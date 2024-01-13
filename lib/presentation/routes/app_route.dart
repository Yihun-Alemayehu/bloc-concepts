import 'package:bloc_concepts/presentation/screens/home_screen.dart';
import 'package:bloc_concepts/presentation/screens/second_screen.dart';
import 'package:bloc_concepts/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'C O U N T E R   U S I N G   C U B I T',
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'S E C O N D   S C R E E N',
            color: Colors.deepPurple,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'T H I R D   S C R E E N',
            color: Colors.deepOrange,
          ),
        );

      default:
        return null;
    }
  }
}
