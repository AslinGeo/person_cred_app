import 'package:hive/hive.dart';

class PersonDao {
  Box<dynamic>? _database;

  static final PersonDao _singleton = PersonDao._();
  static PersonDao get instance => _singleton;
  PersonDao._();

  Future<Box?> get database async {
    _database = _database ?? await _openDatabase();
    return _database;
  }

  _openDatabase() async {
    return await Hive.openBox<dynamic>("personBox");
  }

  clearDatabase() async {
    return await _database?.clear() ?? (await _openDatabase()).clear();
  }

  Future<void> insertOrUpdate(uid, value) async {
    await _database!.put(uid, value);
  }

  Future<void> delete(String uid) async {
    await _database!.delete(uid);
  }

  get(String uid) {
    return _database!.get(uid);
  }

  List getAll() {
    return _database!.values.toList();
  }
}
