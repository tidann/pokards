import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/app.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
