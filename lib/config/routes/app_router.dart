import 'package:code_test/config/routes/routes.dart';
import 'package:code_test/module/encrypt/encrypt.dart';
import 'package:code_test/module/screens/home/home.dart';
import 'package:code_test/module/screens/settings/settings.dart';
import 'package:code_test/module/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SETTINGS:
        return routeTo(SETTINGS, Settings());
        break;

      case SPLASH_SCREEN_ROUTE:
        return routeTo(SPLASH_SCREEN_ROUTE, Splash());

      case HOME_ROUTE:
        return routeTo(HOME_ROUTE, Home());

      case ENCRYPT:
        return routeTo(ENCRYPT, Encrypt());

      default:
        return null;
    }
  }

  Route<dynamic> routeTo(String name, Widget screen) {
    return MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (_) => Material(child: screen),
    );
  }

  void dispose() {}
}
