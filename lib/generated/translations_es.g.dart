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
class TranslationsEs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsMetaEs meta = _TranslationsMetaEs._(_root);
	@override late final _TranslationsGameEs game = _TranslationsGameEs._(_root);
	@override late final _TranslationsHudEs hud = _TranslationsHudEs._(_root);
}

// Path: meta
class _TranslationsMetaEs extends TranslationsMetaEn {
	_TranslationsMetaEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'es';
	@override String get description => 'Traducciones al español para el juego Luna Lander';
}

// Path: game
class _TranslationsGameEs extends TranslationsGameEn {
	_TranslationsGameEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get initializing => 'Inicializando...';
	@override String welcome({required Object maxLevels}) => '¡Di AAA y Vuela!\n¡${maxLevels} niveles!\n(Toca para empezar)';
	@override String get permissionDenied => 'Sin acceso al micrófono.\nToca para reintentar';
	@override String get recorderError => 'Error de micrófono.\nToca para reintentar';
	@override String get audioError => 'Fallo de audio.\nToca para reintentar';
	@override String get retryingAudioSetup => 'Reintentando configuración de audio...';
	@override String get allLevelsCleared => '🎉 ¡GANASTE! 🎉\nToca para jugar de nuevo';
	@override String crashedOnLevel({required Object level}) => '¡Boom! ¡Nivel ${level}!\nToca para reintentar';
	@override String levelCleared({required Object currentLevel, required Object nextLevel}) => '¡Nivel ${currentLevel} completado!\nToca para Nivel ${nextLevel}';
}

// Path: hud
class _TranslationsHudEs extends TranslationsHudEn {
	_TranslationsHudEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String fuel({required Object value}) => 'Combustible: ${value}';
	@override String vSpeed({required Object value}) => 'Velocidad-V: ${value}';
	@override String level({required Object value}) => 'Nivel: ${value}';
	@override String micVolume({required Object value}) => 'Vol. Mic.: ${value}';
	@override String threshold({required Object value}) => 'Umbral: ${value}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'meta.locale': return 'es';
			case 'meta.description': return 'Traducciones al español para el juego Luna Lander';
			case 'game.initializing': return 'Inicializando...';
			case 'game.welcome': return ({required Object maxLevels}) => '¡Di AAA y Vuela!\n¡${maxLevels} niveles!\n(Toca para empezar)';
			case 'game.permissionDenied': return 'Sin acceso al micrófono.\nToca para reintentar';
			case 'game.recorderError': return 'Error de micrófono.\nToca para reintentar';
			case 'game.audioError': return 'Fallo de audio.\nToca para reintentar';
			case 'game.retryingAudioSetup': return 'Reintentando configuración de audio...';
			case 'game.allLevelsCleared': return '🎉 ¡GANASTE! 🎉\nToca para jugar de nuevo';
			case 'game.crashedOnLevel': return ({required Object level}) => '¡Boom! ¡Nivel ${level}!\nToca para reintentar';
			case 'game.levelCleared': return ({required Object currentLevel, required Object nextLevel}) => '¡Nivel ${currentLevel} completado!\nToca para Nivel ${nextLevel}';
			case 'hud.fuel': return ({required Object value}) => 'Combustible: ${value}';
			case 'hud.vSpeed': return ({required Object value}) => 'Velocidad-V: ${value}';
			case 'hud.level': return ({required Object value}) => 'Nivel: ${value}';
			case 'hud.micVolume': return ({required Object value}) => 'Vol. Mic.: ${value}';
			case 'hud.threshold': return ({required Object value}) => 'Umbral: ${value}';
			default: return null;
		}
	}
}

