import 'package:cred_app/app/data/dao/person.dao.dart';
import 'package:cred_app/app/data/modal/person.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInitializer {
  HiveInitializer._privateConstructor();
  static final HiveInitializer instance = HiveInitializer._privateConstructor();

  static initDatabase() async {
    await Hive.initFlutter();
    await _registerHiveAdapters();
    await HiveInitializer._createBox();
  }

  static _registerHiveAdapters() async {
    Hive.registerAdapter(PersonAdapter());
  }

  static Future<void> _createBox() async {
    PersonDao.instance.database;
  }
}
