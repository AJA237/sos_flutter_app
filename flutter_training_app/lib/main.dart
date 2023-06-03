import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; // new

import 'presentation/widgets/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GeneratorPage());
}
