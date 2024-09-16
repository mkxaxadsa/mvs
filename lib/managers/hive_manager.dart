import 'package:hive_flutter/hive_flutter.dart';

class LocalDBManager {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("LOCAL_DATABASE");
  }

  static late final Box _box;

  static Future<void> setAlreadyOpened() async {
    await _box.put("first_open", false);
  }

  static bool get isFirstTimeOpen {
    return _box.get("first_open") ?? true;
  }
}
