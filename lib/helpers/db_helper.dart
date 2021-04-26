import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static const _dbFileName = 'places.db';
  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await getDatabase();
    await database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<sql.Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, _dbFileName),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await getDatabase();
    return database.query(
      table,
    );
  }
}
