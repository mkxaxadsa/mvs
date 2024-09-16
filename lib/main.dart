import 'package:flutter/material.dart';
import 'package:mostbet_3/app/app.dart';
import 'package:mostbet_3/managers/hive_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDBManager.initialize();
  runApp(const MostBetApp());
}
