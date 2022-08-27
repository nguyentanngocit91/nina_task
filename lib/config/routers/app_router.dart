import 'package:flutter/material.dart';
import '../../modules/detail/screens/detail_screen.dart';

import '../../modules/home/screens/home_screen.dart';
import '../../modules/loading/screens/loading_screen.dart';
import '../../modules/second/screens/second_screen.dart';
import '../../modules/splash/screens/splash_screen.dart';

class AppRouter {
  static const loadingScreen = '/';
  static const splashScreen = '/splash_screen';
  static const homeScreen = '/home_screen';
  static const secondScreen = '/second_screen';
  static const detailScreen = '/detail_screen';

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case loadingScreen:
        return MaterialPageRoute(
          builder: (_) => LoadingScreen(),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case secondScreen:
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
      case detailScreen:
        return MaterialPageRoute(
          builder: (_) => DetailScreen(),
        );
      default:
        return null;
    }
  }
}
