import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/safe_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "safe.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE SAFE(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project TEXT,
    category TEXT,
    rule TEXT,
    recommendation TEXT,
    description TEXT,
    image Text
  )
  ''');
  }

  Future<int> add(SafeModel data) async {
    Database db = await instance.database;
    return await db.insert('SAFE', data.toJson());
  }

  Future<List<SafeModel>> getData() async {
    Database db = await instance.database;
    var data = await db.query('SAFE');
    List<SafeModel> dataList =
        data.isNotEmpty ? data.map((c) => SafeModel.fromJson(c)).toList() : [];
    return dataList;
  }

  Future<int> update(SafeModel data) async {
    Database db = await instance.database;
    int i = await db
        .update('SAFE', data.toJson(), where: "id = ?", whereArgs: [data.id]);
    print(i);
    return i;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('SAFE', where: "id = ?", whereArgs: [id]);
  }
}
