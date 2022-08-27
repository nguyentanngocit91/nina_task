part of 'theme_cubit.dart';

class ThemeState {
  final bool isDarkThemeOn;
  late ThemeData theme;
  ThemeState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = AppTheme.darkTheme;
    } else {
      theme = AppTheme.lightTheme;
    }
  }

  ThemeState copyWith({required bool changeState}) {
    return ThemeState(isDarkThemeOn: changeState);
  }
}
