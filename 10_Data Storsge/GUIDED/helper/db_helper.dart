import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton untuk memastikan hanya ada satu instance DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Factory constructor
  factory DatabaseHelper() {
    return _instance;
  }

  // Private constructor
  DatabaseHelper._internal();

  // Getter untuk mendapatkan database
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Inisialisasi database jika belum ada
    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDatabase() async {
    // Mendapatkan path untuk database
    String path = join(await getDatabasesPath(), 'my_prakdatabase.db');

    // Membuka database dengan nama dan versi tertentu
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Membuat tabel pada database
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  // Metode untuk memasukkan data ke tabel
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_table', row);
  }

  // Metode untuk membaca semua data dari tabel
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_table');
  }

  // Metode untuk membaca satu data berdasarkan id
  Future<List<Map<String, dynamic>>> getItem(int id) async {
    Database db = await database;
    return await db.query(
      'my_table',
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
  }

  // Metode untuk memperbarui data di tabel
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update(
      'my_table',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Metode untuk menghapus data dari tabel
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
