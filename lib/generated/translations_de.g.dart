///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsDe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsMetaDe meta = _TranslationsMetaDe._(_root);
	@override late final _TranslationsGameDe game = _TranslationsGameDe._(_root);
	@override late final _TranslationsHudDe hud = _TranslationsHudDe._(_root);
}

// Path: meta
class _TranslationsMetaDe extends TranslationsMetaEn {
	_TranslationsMetaDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'de';
	@override String get description => 'Deutsche Übersetzungen für das Luna Lander Spiel';
}

// Path: game
class _TranslationsGameDe extends TranslationsGameEn {
	_TranslationsGameDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get initializing => 'Initialisiere...';
	@override String welcome({required Object maxLevels}) => 'Sag AAA und Flieg!\n${maxLevels} Level!\n(Tippen zum Starten)';
	@override String get permissionDenied => 'Kein Mikrofonzugriff.\nZum Wiederholen tippen';
	@override String get recorderError => 'Mikrofonfehler.\nZum Wiederholen tippen';
	@override String get audioError => 'Audio-Problem.\nZum Wiederholen tippen';
	@override String get retryingAudioSetup => 'Audio-Setup wird wiederholt...';
	@override String get allLevelsCleared => '🎉 DU HAST GEWONNEN! 🎉\nZum Neustarten tippen';
	@override String crashedOnLevel({required Object level}) => 'Bumm! Level ${level}!\nZum Wiederholen tippen';
	@override String levelCleared({required Object currentLevel, required Object nextLevel}) => 'Level ${currentLevel} geschafft!\nTippen für Level ${nextLevel}';
}

// Path: hud
class _TranslationsHudDe extends TranslationsHudEn {
	_TranslationsHudDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String fuel({required Object value}) => 'Treibstoff: ${value}';
	@override String vSpeed({required Object value}) => 'V-Geschw.: ${value}';
	@override String level({required Object value}) => 'Level: ${value}';
	@override String micVolume({required Object value}) => 'Mikro-Lautst.: ${value}';
	@override String threshold({required Object value}) => 'Schwelle: ${value}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'meta.locale': return 'de';
			case 'meta.description': return 'Deutsche Übersetzungen für das Luna Lander Spiel';
			case 'game.initializing': return 'Initialisiere...';
			case 'game.welcome': return ({required Object maxLevels}) => 'Sag AAA und Flieg!\n${maxLevels} Level!\n(Tippen zum Starten)';
			case 'game.permissionDenied': return 'Kein Mikrofonzugriff.\nZum Wiederholen tippen';
			case 'game.recorderError': return 'Mikrofonfehler.\nZum Wiederholen tippen';
			case 'game.audioError': return 'Audio-Problem.\nZum Wiederholen tippen';
			case 'game.retryingAudioSetup': return 'Audio-Setup wird wiederholt...';
			case 'game.allLevelsCleared': return '🎉 DU HAST GEWONNEN! 🎉\nZum Neustarten tippen';
			case 'game.crashedOnLevel': return ({required Object level}) => 'Bumm! Level ${level}!\nZum Wiederholen tippen';
			case 'game.levelCleared': return ({required Object currentLevel, required Object nextLevel}) => 'Level ${currentLevel} geschafft!\nTippen für Level ${nextLevel}';
			case 'hud.fuel': return ({required Object value}) => 'Treibstoff: ${value}';
			case 'hud.vSpeed': return ({required Object value}) => 'V-Geschw.: ${value}';
			case 'hud.level': return ({required Object value}) => 'Level: ${value}';
			case 'hud.micVolume': return ({required Object value}) => 'Mikro-Lautst.: ${value}';
			case 'hud.threshold': return ({required Object value}) => 'Schwelle: ${value}';
			default: return null;
		}
	}
}

