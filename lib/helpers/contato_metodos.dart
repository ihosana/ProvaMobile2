import 'package:path/path.dart';
import 'package:segunda_prova/domain/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContatoMetodo {
  static final ContatoMetodo _instance = ContatoMetodo.internal();
  factory ContatoMetodo() => _instance;
  ContatoMetodo.internal();
  Database? _db;
  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "contatosbr.db");


    openDatabase(path, version: 1,
      onCreate: (db, version) {
      db.execute("sql");
    }, onUpgrade: (db, oldVersion, newVersion) {

    },);


    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(

        
          "CREATE TABLE ${Contato.tabelaContatos}(${Contato.idColuna} INTEGER PRIMARY KEY AUTOINCREMENT, "
          "                                 ${Contato.nomeColuna} TEXT, "
          "                                 ${Contato.sobrenomeColuna} TEXT, "
          "                                 ${Contato.numeroColuna} INTEGER, "
          "                                 ${Contato.emailColuna} TEXT), "
          "                                  ${Contato.enderecoColuna} TEXT), "
          "                                  ${Contato.paisColuna} TEXT) ");
    });
  }


  Future<Contato> saveContato(Contato c) async {
    Database? dbContatos = await db;
    if (dbContatos != null) {
      c.id = await dbContatos.insert(Contato.tabelaContatos, c.toMap());
    }
    return c;
  }

  Future<Contato?> getContato(int id) async {
    Database? dbContato = await db;
    if (dbContato != null) {
      List<Map> maps = await dbContato.query(Contato.tabelaContatos,
          columns: [
            Contato.idColuna,
            Contato.nomeColuna,
            Contato.sobrenomeColuna,
            Contato.numeroColuna,
            Contato.emailColuna,
            Contato.enderecoColuna,
            Contato.paisColuna
          ],
          where: "${Contato.idColuna} = ?",
          whereArgs: [id]);
      if (maps.length > 0)
        return Contato.fromMap(maps.first);
      else
        return null;
    }
    return null;
  }

  Future<int> deleteContato(int id) async {
    Database? dbContato = await db;
    if (dbContato != null) {
      return await dbContato.delete(Contato.tabelaContatos,
          where: "${Contato.idColuna} = ?", whereArgs: [id]);
    } else
      return 0;
  }

  Future<int> updateContato(Contato c) async {
    Database? dbContatos = await db;
    if (dbContatos != null) {
      return await dbContatos.update(Contato.tabelaContatos, c.toMap(),
          where: "${Contato.idColuna} = ?", whereArgs: [c.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAll() async {
    Database? dbContato = await db;
    if (dbContato != null) {
      List listMap = await dbContato.query(Contato.tabelaContatos);
      List<Contato> listContatos = [];

      for (Map m in listMap) {
        listContatos.add(Contato.fromMap(m));
      }
      return listContatos;
    } else {
      return [];
    }
  }
}
