import 'package:flutter/material.dart';
import 'package:flutter_training_app/presentation/features/config/themes.dart';
import '../../logic/router/route.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRoute.onGenerateRoute,
      theme: lightColorScheme,
    );
  }

  @override
  void dispose() {
    _appRoute.dispose();
    super.dispose();
  }
}
