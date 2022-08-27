import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/settings/app_settings.dart';
import '/utils/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocalStorageService localStorageService;

  LocaleCubit(this.localStorageService)
      : super(SelectedLocale(Locale(localStorageService.getData('locale') ??
            AppSettings.defaultLanguage)));

  void _changeLocale(String locale) {
    localStorageService.saveData(
      key: 'locale',
      data: locale,
    );
    emit(SelectedLocale(Locale(locale)));
  }

  void translateLocale(String lang) => _changeLocale(lang);
}
