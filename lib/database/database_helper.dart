import 'package:appescolar/models/usuario_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DatabaseHelper {
  static Database? _db;
  //criando uma varíavel com o nome do banco de dados
  static const String dbName = 'myDb.db';
  //criando uma variavel com o nome da tabela
  static const String table = 'users';
  //criando uma variável para a versão do banco
  static const int version = 1;
  //criando as três colunas que a tabela users irá possuir
  static const String columnUserName = 'userName';
  static const String columnEmail = 'email';
  static const String columnPass = 'password';



  //Criando o banco de dados caso ele não exista, caso ele exista, o sistema vai esperar ele ser inicializado
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  //Função para iniciar nosso banco de dados local
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $table ("
        " $columnUserName TEXT, "
        " $columnEmail TEXT, "
        " $columnPass TEXT, "
        " PRIMARY KEY ($columnEmail)"
        ")");
  }

  Future<int?> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient?.insert(table, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String emailId, String password) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery("SELECT * FROM $table WHERE "
        "$columnEmail = '$emailId' AND "
        "$columnPass = '$password'");

    if (res!.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int?> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient?.update(table, user.toMap(),
        where: '$columnEmail = ?', whereArgs: [user.userName]);
    return res;
  }

  Future<int> deleteUser(String userName) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(table, where: '$columnEmail = ?', whereArgs: [userName]);
    return res;
  }
}
