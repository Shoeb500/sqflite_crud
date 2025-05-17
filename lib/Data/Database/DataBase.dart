  import 'dart:io';

  import 'package:path/path.dart';
  import 'package:path_provider/path_provider.dart';
  import 'package:sqflite/sqflite.dart';

  class DBHelper {

    DBHelper._();

    static DBHelper getInstance = DBHelper._();

    Database? myDB;

    Future<Database> getDB() async {
      if (myDB != null) {
        return myDB!;
      } else {
        myDB = await openDb();
        return myDB!;
      }
    }

    Future<Database> openDb() async {
      Directory appDir = await getApplicationDocumentsDirectory();

      String dbpath = join(appDir.path, "notedb.db");

      return await openDatabase(dbpath, onCreate: (db, version) {
        db.execute(""
            "create table note (s_no integer primary key autoincrement,title text,desc text,name text )");
      }, version: 1);
    }

    Future<bool> addNotes(
        {required String mtitile, required String name, required String mDesc}) async {
      var db = await getDB();
      int rowsEffected = await db.insert("note", {
        "title": mtitile,
        "desc": mDesc,
        "name": name,
      });
      return rowsEffected > 0;
    }

    Future<List<Map<String, dynamic>>> getAllNotes() async {
      var db = await getDB();
      List<Map<String, dynamic>> mData = await db.query("note",);
      return mData;
    }
  }