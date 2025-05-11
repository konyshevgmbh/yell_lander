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
class TranslationsZh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsMetaZh meta = _TranslationsMetaZh._(_root);
	@override late final _TranslationsGameZh game = _TranslationsGameZh._(_root);
	@override late final _TranslationsHudZh hud = _TranslationsHudZh._(_root);
}

// Path: meta
class _TranslationsMetaZh extends TranslationsMetaEn {
	_TranslationsMetaZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get locale => 'zh';
	@override String get description => '月球着陆器游戏简体中文翻译';
}

// Path: game
class _TranslationsGameZh extends TranslationsGameEn {
	_TranslationsGameZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get initializing => '初始化中...';
	@override String welcome({required Object maxLevels}) => '说 AAA 然后起飞！\n${maxLevels} 个级别！\n(点击开始)';
	@override String get permissionDenied => '无麦克风权限。\n点击重试';
	@override String get recorderError => '麦克风错误。\n点击重试';
	@override String get audioError => '音频故障。\n点击重试';
	@override String get retryingAudioSetup => '重试音频设置...';
	@override String get allLevelsCleared => '🎉 你赢了！🎉\n点击重新开始';
	@override String crashedOnLevel({required Object level}) => '砰！第 ${level} 关！\n点击重试';
	@override String levelCleared({required Object currentLevel, required Object nextLevel}) => '第 ${currentLevel} 关完成！\n点击进入第 ${nextLevel} 关';
}

// Path: hud
class _TranslationsHudZh extends TranslationsHudEn {
	_TranslationsHudZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String fuel({required Object value}) => '燃料: ${value}';
	@override String vSpeed({required Object value}) => '垂直速度: ${value}';
	@override String level({required Object value}) => '级别: ${value}';
	@override String micVolume({required Object value}) => '麦克风音量: ${value}';
	@override String threshold({required Object value}) => '阈值: ${value}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'meta.locale': return 'zh';
			case 'meta.description': return '月球着陆器游戏简体中文翻译';
			case 'game.initializing': return '初始化中...';
			case 'game.welcome': return ({required Object maxLevels}) => '说 AAA 然后起飞！\n${maxLevels} 个级别！\n(点击开始)';
			case 'game.permissionDenied': return '无麦克风权限。\n点击重试';
			case 'game.recorderError': return '麦克风错误。\n点击重试';
			case 'game.audioError': return '音频故障。\n点击重试';
			case 'game.retryingAudioSetup': return '重试音频设置...';
			case 'game.allLevelsCleared': return '🎉 你赢了！🎉\n点击重新开始';
			case 'game.crashedOnLevel': return ({required Object level}) => '砰！第 ${level} 关！\n点击重试';
			case 'game.levelCleared': return ({required Object currentLevel, required Object nextLevel}) => '第 ${currentLevel} 关完成！\n点击进入第 ${nextLevel} 关';
			case 'hud.fuel': return ({required Object value}) => '燃料: ${value}';
			case 'hud.vSpeed': return ({required Object value}) => '垂直速度: ${value}';
			case 'hud.level': return ({required Object value}) => '级别: ${value}';
			case 'hud.micVolume': return ({required Object value}) => '麦克风音量: ${value}';
			case 'hud.threshold': return ({required Object value}) => '阈值: ${value}';
			default: return null;
		}
	}
}

