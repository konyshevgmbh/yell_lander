import 'dart:async';
import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recorder/flutter_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

// Game Configuration Constants
class GameConfig {
  // General Game Mechanics
  static const int maxLevels = 3;
  static const double initialFuel = 10.0;
  static const double baseGravity = 90.0;
  static const double gravityLevelMultiplier = 1.9;
  static const double safeLandingSpeed = 100.0;
  static const double defaultMinEngineVolumeThreshold = 0.2;

  // Lander
  static final Vector2 landerSize = Vector2(24, 32);
  static const double landerThrustPower = -1000.0; // Negative for upward thrust
  static const double landerFuelConsumptionRate = 6.0;
  static const double landerInitialYFactor =
      0.4; // Initial Y position relative to screen height (40% from top)
  static const double landerLevelStartY =
      50.0; // Absolute Y position at the start of a level

  // Recorder
  static const PCMFormat recorderFormat = PCMFormat.f32le;
  static const int recorderSampleRate = 22050;
  static const RecorderChannels recorderChannels = RecorderChannels.mono;
  static const double minDbVolume = -60.0;
  static const double maxDbVolume = 0.0;
  static double get dbRange => maxDbVolume - minDbVolume;

  // Surface
  static const int surfaceSegments = 20;
  static const int surfacePadStartIndex = 8;
  static const int surfacePadEndIndex = 12;
  static const double surfaceBaseHeightFactor =
      0.75; // Base height from top (e.g., 75%)
  static const double surfaceHeightVariationFactor =
      0.15; // Variation in height (e.g., +/- 15%)
  static const double surfaceDefaultHeight =
      800.0; // Fallback height if terrain points are missing
  static const double terrainStrokeWidth = 1.5;
  static const double landingPadStrokeWidth = 3.0;
  static const Color terrainColor = Colors.grey;
  static const Color landingPadColor = Colors.lightGreenAccent;

  // HUD
  static const EdgeInsets hudPadding = EdgeInsets.all(10.0);
  static const TextStyle hudTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );

  static final TextStyle hudMessageTextStyle = hudTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const Color hudBarActiveColor = Colors.greenAccent;
  static const Color hudBarInactiveColor = Colors.orangeAccent;
  static const Color hudSliderActiveColor = Colors.lightBlueAccent;
  static final Color hudVolumeBarBorderColor = Colors.white54;

  static final Color hudSliderContainerBackgroundColor = Colors.black
      .withOpacity(0.5);

  static final EdgeInsets hudStatusMessagePadding = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  );
  static final Color hudStatusMessageBackgroundColor = Colors.black.withOpacity(
    0.6,
  );
}

// Text messages centralized here
class GameMessages {
  // Game State & Instructions
  static const String initializing = "Initializing...";
  static const String welcome =
      "SAY AAA-A-A AND FLY\nReach all ${GameConfig.maxLevels} levels!\n(TAP OR SPACE TO START)";
  static const String permissionDenied =
      "Microphone permission denied.\nTAP OR SPACE TO RETRY.";
  static const String recorderError =
      "Error initializing recorder.\nTAP OR SPACE TO RETRY.";
  static const String audioError = "Audio error. TAP/SPACE to retry.";
  static const String retryingAudioSetup = "Retrying audio setup...";
  static const String allLevelsCleared =
      "🎉 YOU WIN! 🎉\nTap or press Space to restart";

  static String crashedOnLevel(int level) =>
      "CRASHED ON LEVEL $level!\nTAP OR SPACE TO RESTART";
  static String levelCleared(int currentLevel) =>
      "LEVEL $currentLevel CLEARED!\nTAP OR SPACE FOR LEVEL ${currentLevel + 1}";

  // HUD Labels
  static String fuel(double value) => 'Fuel: ${value.toStringAsFixed(1)}';
  static String vSpeed(double value) => 'V-Speed: ${value.toStringAsFixed(1)}';
  static String level(int value) => 'Level: $value';
  static String micVolume(double value) =>
      'Mic Vol: ${value.toStringAsFixed(2)}';
  static String threshold(double value) =>
      'Threshold: ${value.toStringAsFixed(2)}';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget.controlled(
          gameFactory: LunaLanderGame.new,
          overlayBuilderMap: {
            'hud':
                (BuildContext context, LunaLanderGame game) =>
                    HudOverlay(game: game),
          },
          initialActiveOverlays: const ['hud'],
        ),
      ),
    ),
  );
}

enum GameState {
  initializing,
  welcome,
  playing,
  levelWonTransition,
  gameWon,
  crashed,
}

class HudOverlay extends StatefulWidget {
  final LunaLanderGame game;
  const HudOverlay({super.key, required this.game});
  @override
  State<HudOverlay> createState() => _HudOverlayState();
}

class _HudOverlayState extends State<HudOverlay> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.game.minEngineVolumeThreshold;
    widget.game.onHudUpdate =
        () =>
            mounted
                ? setState(() {
                  _currentSliderValue = widget.game.minEngineVolumeThreshold;
                })
                : null;
  }

  @override
  void dispose() {
    widget.game.onHudUpdate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = widget.game;
    String displayMessage = '';

    switch (game.gameState) {
      case GameState.gameWon:
        displayMessage = GameMessages.allLevelsCleared;
        break;
      case GameState.crashed:
        displayMessage = GameMessages.crashedOnLevel(
          game.levelConcluded ?? game.currentLevel,
        );
        break;
      case GameState.playing:
        break;
      default: //welcome or initializing or levelWonTransition
        displayMessage = game.statusMessage;
        break;
    }
    return Stack(
      children: [
        // Stats display
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: GameConfig.hudPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    GameMessages.fuel(game.fuelValue),
                    style: GameConfig.hudTextStyle,
                  ),
                  Text(
                    GameMessages.vSpeed(game.velocityYValue),
                    style: GameConfig.hudTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Level display
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: GameConfig.hudPadding,
              child: Text(
                GameMessages.level(game.currentLevel),
                style: GameConfig.hudTextStyle,
              ),
            ),
          ),
        ),

        // Combined Mic Volume (Left) and Threshold (Right) Display
        if (game.isRecorderInitialized)
          SafeArea(
            child: Align(
              // Align the entire Row to the bottom. The Row itself will span the width.
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: GameConfig.hudPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Key for left/right
                  crossAxisAlignment: CrossAxisAlignment.start, // Key for aligning tops
                  // textBaseline: TextBaseline.alphabetic, // Use with CrossAxisAlignment.baseline if needed
                  children: [
                    // Mic Volume Group (Left)
                    Column(
                      mainAxisSize: MainAxisSize.min, // Important for Column in Row
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GameMessages.micVolume(game.normalizedVolume),
                          style: GameConfig.hudTextStyle,
                        ),
                        const SizedBox(height: 4), // Space between text and bar
                        Container(
                          width: 100.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: GameConfig.hudVolumeBarBorderColor,
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: game.normalizedVolume.clamp(0.0, 1.0),
                            child: Container(
                              color: game.normalizedVolume >= game.minEngineVolumeThreshold
                                  ? GameConfig.hudBarActiveColor
                                  : GameConfig.hudBarInactiveColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Threshold Slider Group (Right)
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: GameConfig.hudSliderContainerBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Important for Column in Row
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GameMessages.threshold(_currentSliderValue),
                            style: GameConfig.hudTextStyle,
                          ),
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Slider(
                              value: _currentSliderValue,
                              min: 0.0,
                              max: 1.0,
                              divisions: 20,
                              activeColor: GameConfig.hudSliderActiveColor,
                              onChanged: (value) => setState(() {
                                _currentSliderValue = value;
                                game.minEngineVolumeThreshold = value;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Status message
        if (displayMessage.isNotEmpty)
          IgnorePointer(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: GameConfig.hudStatusMessagePadding,
                color: GameConfig.hudStatusMessageBackgroundColor,
                child: Text(
                  displayMessage,
                  textAlign: TextAlign.center,
                  style: GameConfig.hudMessageTextStyle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class LunaLanderGame extends FlameGame with TapCallbacks, KeyboardEvents {
  late LunarLander lander;
  late LunarSurface surface;

  final recorder = Recorder.instance;
  bool isRecorderInitialized = false;
  bool hasPermission = false;
  String statusMessage = GameMessages.initializing;

  GameState gameState = GameState.initializing;
  double normalizedVolume = 0.0;
  double minEngineVolumeThreshold = GameConfig.defaultMinEngineVolumeThreshold;

  VoidCallback? onHudUpdate;
  int currentLevel = 1;
  int? levelConcluded;
  double get currentGravity =>
      GameConfig.baseGravity *
      math.pow(GameConfig.gravityLevelMultiplier, currentLevel - 1);
  bool _gameComponentsLoaded = false;

  double get fuelValue =>
      _gameComponentsLoaded && lander.isMounted
          ? lander.fuel
          : GameConfig.initialFuel;
  double get velocityYValue =>
      _gameComponentsLoaded &&
              lander.isMounted &&
              gameState == GameState.playing
          ? lander.velocity.y
          : 0.0;

  @override
  Future<void> onLoad() async {
    gameState = GameState.initializing;
    statusMessage = GameMessages.initializing;
    if (!_gameComponentsLoaded) {
      surface = LunarSurface();
      lander = LunarLander(
        position: Vector2(size.x / 2, size.y * GameConfig.landerInitialYFactor),
      );
      await add(surface);
      await add(lander);
      _gameComponentsLoaded = true;
    }
    await _requestPermissionAndInitialize();
    gameState = GameState.welcome;
    statusMessage =
        hasPermission && isRecorderInitialized
            ? GameMessages.welcome
            : (hasPermission
                ? GameMessages.recorderError
                : GameMessages.permissionDenied);
    onHudUpdate?.call();
  }

  Future<void> _requestPermissionAndInitialize() async {
    bool permGranted =
        !kIsWeb ? (await Permission.microphone.request()).isGranted : true;
    hasPermission = permGranted;

    if (permGranted) {
      try {
        await recorder.init(
          format: GameConfig.recorderFormat,
          sampleRate: GameConfig.recorderSampleRate,
          channels: GameConfig.recorderChannels,
        );
        recorder.start();
        isRecorderInitialized = true;
      } catch (e) {
        debugPrint("Recorder init error: $e");
        isRecorderInitialized = false;
        statusMessage = GameMessages.recorderError;
      }
    } else {
      statusMessage = GameMessages.permissionDenied;
    }
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    if (_gameComponentsLoaded) {
      final oldWidth =
          surface.terrainPoints.isNotEmpty
              ? surface.terrainPoints.last.x
              : canvasSize.x;
      if (oldWidth > 0) {
        lander.position.x = lander.position.x * canvasSize.x / oldWidth;
      } else {
        lander.position.x = canvasSize.x / 2;
      }
      surface.updateForNewSize(canvasSize);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isRecorderInitialized) {
      try {
        final db = recorder.getVolumeDb();
        if (db != null && db.isFinite) {
          normalizedVolume = ((db.clamp(
                        GameConfig.minDbVolume,
                        GameConfig.maxDbVolume,
                      ) -
                      GameConfig.minDbVolume) /
                  GameConfig.dbRange)
              .clamp(0.0, 1.0);
        } else {
          normalizedVolume = 0.0;
        }
      } catch (e) {
        debugPrint("Recorder getVolumeDb error: $e");
        isRecorderInitialized = false;
        normalizedVolume = 0.0;
        statusMessage = GameMessages.audioError;
        gameState = GameState.welcome;
      }
    }

    if (gameState == GameState.playing &&
        isRecorderInitialized &&
        _gameComponentsLoaded) {
      lander.velocity.y += currentGravity * dt;

      if (normalizedVolume >= minEngineVolumeThreshold && lander.fuel > 0) {
        double thrustFactor = ((normalizedVolume - minEngineVolumeThreshold) /
                (1.0 - minEngineVolumeThreshold).clamp(0.01, 1.0))
            .clamp(0.0, 1.0);
        lander.applyThrust(dt, thrustFactor);
        lander.startThrustVisual();
      } else {
        lander.stopThrust();
      }

      final terrainY = surface.getHeightAt(lander.position.x);
      if (lander.position.y >= terrainY - 1.0) {
        lander.position.y = terrainY - 1.0;
        lander.velocity = Vector2.zero();
        lander.stopThrust();
        levelConcluded = currentLevel;

        final bool onPad =
            lander.position.x >= surface.landingPadLeft &&
            lander.position.x <= surface.landingPadRight;
        final bool safeSpeed =
            lander.previousVelocityY.abs() <= GameConfig.safeLandingSpeed;

        if (onPad && safeSpeed) {
          gameState =
              currentLevel == GameConfig.maxLevels
                  ? GameState.gameWon
                  : GameState.levelWonTransition;
          statusMessage =
              currentLevel == GameConfig.maxLevels
                  ? ""
                  : GameMessages.levelCleared(currentLevel);
        } else {
          gameState = GameState.crashed;
          lander.showExplosion();
        }
      }

      final halfWidth = lander.size.x / 2;
      lander.position.x = lander.position.x.clamp(
        halfWidth,
        size.x - halfWidth,
      );
    } else if (gameState == GameState.welcome && _gameComponentsLoaded) {
      lander.velocity = Vector2.zero();
      if (isRecorderInitialized &&
          normalizedVolume >= minEngineVolumeThreshold) {
        lander.startThrustVisual();
      } else {
        lander.stopThrust();
      }
    }

    onHudUpdate?.call();
  }

  void _processGameAction() {
    if (gameState == GameState.welcome) {
      if (isRecorderInitialized && hasPermission) {
        currentLevel = 1;
        _startLevel();
      } else {
        gameState = GameState.initializing;
        statusMessage = GameMessages.retryingAudioSetup;
        onHudUpdate?.call();
        _requestPermissionAndInitialize().then((_) {
          gameState = GameState.welcome;
          statusMessage =
              hasPermission && isRecorderInitialized
                  ? GameMessages.welcome
                  : (hasPermission
                      ? GameMessages.recorderError
                      : GameMessages.permissionDenied);
          onHudUpdate?.call();
        });
      }
    } else if (gameState == GameState.levelWonTransition) {
      currentLevel++;
      _startLevel();
    } else if (gameState == GameState.gameWon ||
        gameState == GameState.crashed) {
      _resetGame();
    }
  }

  void _startLevel() {
    levelConcluded = null;
    if (_gameComponentsLoaded) {
      if (currentLevel != 1) {
        surface.regenerate(size);
      }
      lander.reset(position: Vector2(size.x / 2, GameConfig.landerLevelStartY));
    }
    gameState = GameState.playing;
    statusMessage = "";
    onHudUpdate?.call();
  }

  void _resetGame() {
    levelConcluded = null;
    currentLevel = 1;
    if (_gameComponentsLoaded) {
      surface.regenerate(size);
      lander.reset(
        position: Vector2(size.x / 2, size.y * GameConfig.landerInitialYFactor),
      );
    }
    gameState = GameState.welcome;
    statusMessage =
        hasPermission && isRecorderInitialized
            ? GameMessages.welcome
            : (hasPermission
                ? GameMessages.recorderError
                : GameMessages.permissionDenied);
    onHudUpdate?.call();
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    _processGameAction();
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space)) {
      _processGameAction();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class LunarLander extends PositionComponent {
  Vector2 velocity = Vector2.zero();
  double fuel = GameConfig.initialFuel;
  bool isExploding = false;
  bool _showFlame = false;
  double previousVelocityY = 0.0;

  LunarLander({required Vector2 position})
    : super(
        position: position,
        size: GameConfig.landerSize,
        anchor: Anchor.center,
      );

  void reset({required Vector2 position}) {
    this.position = position;
    velocity = Vector2.zero();
    previousVelocityY = 0.0;
    fuel = GameConfig.initialFuel;
    isExploding = false;
    _showFlame = false;
  }

  @override
  void update(double dt) {
    super.update(dt);
    previousVelocityY = velocity.y;
    if (!isExploding) position += velocity * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (isExploding) {
      // Original explosion drawing
      canvas.drawCircle(
        Offset.zero,
        size.x * 1.5,
        Paint()..color = Colors.red.withOpacity(0.8),
      );
      canvas.drawCircle(
        Offset.zero,
        size.x * 0.8,
        Paint()..color = Colors.orange.withOpacity(0.9),
      );
      return;
    }

    // Draw lander body (original drawing)
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(0, -size.y * 0.1),
        width: size.x * 0.8,
        height: size.y * 0.6,
      ),
      Paint()..color = Colors.grey[300]!,
    );

    // Draw legs (original drawing)
    final legPaint =
        Paint()
          ..color = Colors.grey[400]!
          ..strokeWidth = 2;
    canvas.drawLine(
      Offset(-size.x * 0.4, size.y * 0.2),
      Offset(-size.x * 0.5, size.y / 2),
      legPaint,
    );
    canvas.drawLine(
      Offset(size.x * 0.4, size.y * 0.2),
      Offset(size.x * 0.5, size.y / 2),
      legPaint,
    );

    // Draw flame (original drawing)
    if (_showFlame) {
      final flamePath =
          Path()
            ..moveTo(-size.x * 0.2, size.y * 0.4)
            ..lineTo(
              0,
              size.y * 0.5 + 15 * (0.8 + math.Random().nextDouble() * 0.4),
            )
            ..lineTo(size.x * 0.2, size.y * 0.4)
            ..close();
      canvas.drawPath(flamePath, Paint()..color = Colors.orangeAccent);
    }
  }

  void applyThrust(double dt, double thrustFactor) {
    if (fuel > 0 && !isExploding && thrustFactor > 0) {
      velocity.y += GameConfig.landerThrustPower * thrustFactor * dt;
      fuel -= GameConfig.landerFuelConsumptionRate * thrustFactor * dt;
      fuel = math.max(0, fuel);
    }
  }

  void startThrustVisual() => _showFlame = !isExploding && fuel > 0;
  void stopThrust() => _showFlame = false;
  void showExplosion() {
    isExploding = true;
    _showFlame = false;
  }
}

class LunarSurface extends Component {
  List<Vector2> terrainPoints = [];
  double landingPadLeft = 0;
  double landingPadRight = 0;
  double landingY = 0;

  void regenerate(Vector2 gameSize) {
    final w = gameSize.x, h = gameSize.y;
    if (w <= 0 || h <= 0) return;

    final segments = GameConfig.surfaceSegments;
    final segmentWidth = w / segments;
    final padStartIndex = GameConfig.surfacePadStartIndex;
    final padEndIndex = GameConfig.surfacePadEndIndex;
    final rnd = math.Random();
    landingY =
        h *
        (GameConfig.surfaceBaseHeightFactor +
            (rnd.nextDouble() * GameConfig.surfaceHeightVariationFactor * 2 -
                GameConfig.surfaceHeightVariationFactor));

    terrainPoints = [];
    for (int i = 0; i <= segments; i++) {
      final x = i * segmentWidth;
      final isPadSegment = i >= padStartIndex && i <= padEndIndex;
      final yVariation =
          GameConfig.surfaceBaseHeightFactor +
          (rnd.nextDouble() * GameConfig.surfaceHeightVariationFactor * 2 -
              GameConfig.surfaceHeightVariationFactor);
      final y = isPadSegment ? landingY : h * yVariation.clamp(0.5, 0.95);
      terrainPoints.add(Vector2(x, y));
    }
    for (int i = padStartIndex; i <= padEndIndex; i++) {
      if (i < terrainPoints.length) terrainPoints[i].y = landingY;
    }

    landingPadLeft = padStartIndex * segmentWidth;
    landingPadRight = padEndIndex * segmentWidth;
  }

  void updateForNewSize(Vector2 newSize) {
    if (terrainPoints.isEmpty || terrainPoints.last.x == 0) {
      regenerate(newSize);
      return;
    }

    final oldWidth = terrainPoints.last.x;
    final scaleX = newSize.x / oldWidth;
    terrainPoints =
        terrainPoints.map((p) => Vector2(p.x * scaleX, p.y)).toList();
    landingPadLeft *= scaleX;
    landingPadRight *= scaleX;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (terrainPoints.length < 2) return;

    final path = Path()..moveTo(terrainPoints[0].x, terrainPoints[0].y);
    for (int i = 1; i < terrainPoints.length; i++) {
      path.lineTo(terrainPoints[i].x, terrainPoints[i].y);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = GameConfig.terrainColor
        ..strokeWidth = GameConfig.terrainStrokeWidth
        ..style = PaintingStyle.stroke,
    );

    canvas.drawLine(
      Offset(landingPadLeft, landingY),
      Offset(landingPadRight, landingY),
      Paint()
        ..color = GameConfig.landingPadColor
        ..strokeWidth = GameConfig.landingPadStrokeWidth
        ..style = PaintingStyle.stroke,
    );
  }

  double getHeightAt(double x) {
    if (terrainPoints.length < 2) return GameConfig.surfaceDefaultHeight;

    final clampedX = x.clamp(terrainPoints.first.x, terrainPoints.last.x);

    for (int i = 0; i < terrainPoints.length - 1; i++) {
      final p1 = terrainPoints[i];
      final p2 = terrainPoints[i + 1];

      if (p1.x <= clampedX && p2.x >= clampedX) {
        if ((p2.x - p1.x).abs() < 0.001) return p1.y;
        final t = (clampedX - p1.x) / (p2.x - p1.x);
        return p1.y + t * (p2.y - p1.y);
      }
    }
    return terrainPoints.last.y;
  }

  @override
  void onMount() {
    super.onMount();
    final game = findGame();
    if (game != null && game.size.x > 0 && game.size.y > 0) {
      regenerate(game.size);
    }
  }
}
