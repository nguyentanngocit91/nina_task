import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/utils/services/local_storage_service.dart';

import '../app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final LocalStorageService localStorageService;

  // Passing an initial value (state) with a default 'Locale' to the super class.
  ThemeCubit(this.localStorageService)
      : super(ThemeState(
            isDarkThemeOn:
                localStorageService.getData('isDarkThemeOn') ?? false));

  void toggleSwitch(bool value) {
    localStorageService.saveData(key: 'isDarkThemeOn', data: value);
    return emit(state.copyWith(changeState: value));
  }
}
