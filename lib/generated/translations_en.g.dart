///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsMetaEn meta = TranslationsMetaEn.internal(_root);
	late final TranslationsGameEn game = TranslationsGameEn.internal(_root);
	late final TranslationsHudEn hud = TranslationsHudEn.internal(_root);
}

// Path: meta
class TranslationsMetaEn {
	TranslationsMetaEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get locale => 'en';
	String get description => 'English translations for Luna Lander Game';
}

// Path: game
class TranslationsGameEn {
	TranslationsGameEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get initializing => 'Initializing...';
	String welcome({required Object maxLevels}) => 'Say AAA and Fly!\n${maxLevels} levels!\n(Tap to start)';
	String get permissionDenied => 'No mic access.\nTap to try again';
	String get recorderError => 'Mic error.\nTap to try again';
	String get audioError => 'Audio glitch.\nTap to try again';
	String get retryingAudioSetup => 'Retrying audio setup...';
	String get allLevelsCleared => '🎉 YOU WIN! 🎉\nTap to play again';
	String crashedOnLevel({required Object level}) => 'Boom! Level ${level}!\nTap to try again';
	String levelCleared({required Object currentLevel, required Object nextLevel}) => 'Level ${currentLevel} complete!\nTap for Level ${nextLevel}';
}

// Path: hud
class TranslationsHudEn {
	TranslationsHudEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String fuel({required Object value}) => 'Fuel: ${value}';
	String vSpeed({required Object value}) => 'V-Speed: ${value}';
	String level({required Object value}) => 'Level: ${value}';
	String micVolume({required Object value}) => 'Mic Vol: ${value}';
	String threshold({required Object value}) => 'Threshold: ${value}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'meta.locale': return 'en';
			case 'meta.description': return 'English translations for Luna Lander Game';
			case 'game.initializing': return 'Initializing...';
			case 'game.welcome': return ({required Object maxLevels}) => 'Say AAA and Fly!\n${maxLevels} levels!\n(Tap to start)';
			case 'game.permissionDenied': return 'No mic access.\nTap to try again';
			case 'game.recorderError': return 'Mic error.\nTap to try again';
			case 'game.audioError': return 'Audio glitch.\nTap to try again';
			case 'game.retryingAudioSetup': return 'Retrying audio setup...';
			case 'game.allLevelsCleared': return '🎉 YOU WIN! 🎉\nTap to play again';
			case 'game.crashedOnLevel': return ({required Object level}) => 'Boom! Level ${level}!\nTap to try again';
			case 'game.levelCleared': return ({required Object currentLevel, required Object nextLevel}) => 'Level ${currentLevel} complete!\nTap for Level ${nextLevel}';
			case 'hud.fuel': return ({required Object value}) => 'Fuel: ${value}';
			case 'hud.vSpeed': return ({required Object value}) => 'V-Speed: ${value}';
			case 'hud.level': return ({required Object value}) => 'Level: ${value}';
			case 'hud.micVolume': return ({required Object value}) => 'Mic Vol: ${value}';
			case 'hud.threshold': return ({required Object value}) => 'Threshold: ${value}';
			default: return null;
		}
	}
}

