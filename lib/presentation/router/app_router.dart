import 'package:flutter/material.dart';
import 'package:topjobinn/presentation/screens/login_screen/login_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/loginScreen';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: Strings.homeScreenTitle,
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
