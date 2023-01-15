import 'package:fire_provider/screens/login.dart';
import 'package:fire_provider/screens/register.dart';
import 'package:fire_provider/screens/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
