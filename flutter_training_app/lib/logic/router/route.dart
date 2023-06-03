import 'package:flutter/material.dart';
import 'package:flutter_training_app/logic/Cubit/cubit/navigation_cubit.dart';
import 'package:flutter_training_app/presentation/screens/login.dart';
import 'package:flutter_training_app/presentation/screens/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/screens/registration.dart';

class AppRoute {
  final _navigation = NavigationCubit();
  Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _navigation,
                  child: const LoginScreen(),
                ));
      case '/registration':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
          value: _navigation,
          child: const RegistrationScreen(),
        ));
      case '/map':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
          value: _navigation,
          child: const MapScreen(),
        ));
      default:
        return null;
    }
  }

  void dispose() {
    _navigation.close();
  }
}
