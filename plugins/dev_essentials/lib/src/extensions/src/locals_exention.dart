part of '../extensions.dart';

extension LocalesIntl on DevEssential {
  static final _intlHost = DevEssentialTranslationHost();

  Locale? get locale => _intlHost.locale;

  Locale? get deviceLocale => engine.platformDispatcher.locale;

  Locale? get fallbackLocale => _intlHost.fallbackLocale;

  set locale(Locale? newLocale) => _intlHost.locale = newLocale;

  set fallbackLocale(Locale? newLocale) => _intlHost.fallbackLocale = newLocale;

  Map<String, Map<String, String>> get translations => _intlHost.translations;

  void addTranslations(Map<String, Map<String, String>> tr) {
    translations.addAll(tr);
  }

  void clearTranslations() {
    translations.clear();
  }

  void appendTranslations(Map<String, Map<String, String>> tr) {
    tr.forEach((key, map) {
      if (translations.containsKey(key)) {
        translations[key]!.addAll(map);
      } else {
        translations[key] = map;
      }
    });
  }

  Future<void> updateLocale(Locale l) async {
    Dev.locale = l;
    await forceAppUpdate();
  }
}
