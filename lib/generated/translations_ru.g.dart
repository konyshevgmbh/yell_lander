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
class TranslationsRu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsMetaRu meta = _TranslationsMetaRu._(_root);
	@override late final _TranslationsGameRu game = _TranslationsGameRu._(_root);
	@override late final _TranslationsHudRu hud = _TranslationsHudRu._(_root);
}

// Path: meta
class _TranslationsMetaRu extends TranslationsMetaEn {
	_TranslationsMetaRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'ru';
	@override String get description => 'Русские переводы для игры Luna Lander';
}

// Path: game
class _TranslationsGameRu extends TranslationsGameEn {
	_TranslationsGameRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get initializing => 'Инициализация...';
	@override String welcome({required Object maxLevels}) => 'Ори и Лети!\n${maxLevels} уровней!\n(Нажмите, чтобы начать)';
	@override String get permissionDenied => 'Нет доступа к микрофону.\nНажмите, чтобы повторить';
	@override String get recorderError => 'Ошибка микрофона.\nНажмите, чтобы повторить';
	@override String get audioError => 'Сбой аудио.\nНажмите, чтобы повторить';
	@override String get retryingAudioSetup => 'Повторная настройка аудио...';
	@override String get allLevelsCleared => '🎉 ПОБЕДА! 🎉\nНажмите, чтобы сыграть снова';
	@override String crashedOnLevel({required Object level}) => 'Бабах! Уровень ${level}!\nНажмите, чтобы повторить';
	@override String levelCleared({required Object currentLevel, required Object nextLevel}) => 'Уровень ${currentLevel} пройден!\nНажмите для Уровня ${nextLevel}';
}

// Path: hud
class _TranslationsHudRu extends TranslationsHudEn {
	_TranslationsHudRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String fuel({required Object value}) => 'Топливо: ${value}';
	@override String vSpeed({required Object value}) => 'Скорость: ${value}';
	@override String level({required Object value}) => 'Уровень: ${value}';
	@override String micVolume({required Object value}) => 'Гром. мик.: ${value}';
	@override String threshold({required Object value}) => 'Порог шума: ${value}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'meta.locale': return 'ru';
			case 'meta.description': return 'Русские переводы для игры Luna Lander';
			case 'game.initializing': return 'Инициализация...';
			case 'game.welcome': return ({required Object maxLevels}) => 'Ори и Лети!\n${maxLevels} уровней!\n(Нажмите, чтобы начать)';
			case 'game.permissionDenied': return 'Нет доступа к микрофону.\nНажмите, чтобы повторить';
			case 'game.recorderError': return 'Ошибка микрофона.\nНажмите, чтобы повторить';
			case 'game.audioError': return 'Сбой аудио.\nНажмите, чтобы повторить';
			case 'game.retryingAudioSetup': return 'Повторная настройка аудио...';
			case 'game.allLevelsCleared': return '🎉 ПОБЕДА! 🎉\nНажмите, чтобы сыграть снова';
			case 'game.crashedOnLevel': return ({required Object level}) => 'Бабах! Уровень ${level}!\nНажмите, чтобы повторить';
			case 'game.levelCleared': return ({required Object currentLevel, required Object nextLevel}) => 'Уровень ${currentLevel} пройден!\nНажмите для Уровня ${nextLevel}';
			case 'hud.fuel': return ({required Object value}) => 'Топливо: ${value}';
			case 'hud.vSpeed': return ({required Object value}) => 'Скорость: ${value}';
			case 'hud.level': return ({required Object value}) => 'Уровень: ${value}';
			case 'hud.micVolume': return ({required Object value}) => 'Гром. мик.: ${value}';
			case 'hud.threshold': return ({required Object value}) => 'Порог шума: ${value}';
			default: return null;
		}
	}
}

