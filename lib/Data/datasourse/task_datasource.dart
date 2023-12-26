import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/Utils/db_keys.dart';

import '../../Utils/utils.dart';
import '../models/models.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE ${DBKeys.dbTable} (
      ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${TaskKeys.title} TEXT,
      ${TaskKeys.note} TEXT,
      ${TaskKeys.date} TEXT,
      ${TaskKeys.time} TEXT,
      ${TaskKeys.category} TEXT,
      ${TaskKeys.isCompleted} INTEGER    
    )
    ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        DBKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        DBKeys.dbTable,
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<List<Task>> getAllTask() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      DBKeys.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
          (index) {
        return Task.fromJson(maps[index]);
      },
    );
  }

}