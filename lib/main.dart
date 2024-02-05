import 'package:flutter/material.dart';
import 'package:flutter_timer/app.dart';
import 'package:flutter_timer/features/timer/injector.dart';

void main() async {
  await init('dev');
  runApp(const App());
}
