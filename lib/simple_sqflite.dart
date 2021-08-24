library simple_sqflite;

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
class SimpleSqflite {
  ///  数据库的地址
  static String DBPath = "simplesqflite.db";

  /// 修改数据库DB文件名称 无返回值
  Future<void> editDBPath(String dbName) async {
    DBPath = dbName + ".db";
  }

  ///  传入sql语句并单独执行这一条语句
  ///  成功：操作成功
  ///  失败：操作失败 打印报错
  Future<String> RunSQL(String sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      await database.execute(sql);
      await database.close();
      return "操作成功";
    } catch (e) {
      print(e.toString());
      return "操作失败";
    }
  }

  ///  传入sql语句并单独执行这一条插入语句
  ///  成功：插入成功
  ///  失败：插入失败 打印报错
  Future<String> RunInsert(String sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      int result = await database.rawInsert(sql);
      await database.close();
      return "插入成功";
    } catch (e) {
      print(e.toString());
      return "插入失败";
    }
  }

  ///  传入sql语句并单独执行这一条删除语句
  ///  成功：删除成功
  ///  失败：删除失败 打印报错
  Future<String> RunDelete(String sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      int result = await database.rawDelete(sql);
      await database.close();
      return "删除成功";
    } catch (e) {
      print(e.toString());
      return "删除失败";
    }
  }

  /// 传入sql语句并单独执行这一条修改语句
  /// 成功：修改成功
  /// 失败：修改失败 打印报错
  Future<String> RunUpdate(String sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      int result = await database.rawUpdate(sql);
      await database.close();
      return "修改成功";
    } catch (e) {
      print(e.toString());
      return "修改失败";
    }
  }

  /// 传入sql语句并单独执行这一条搜索语句
  /// 成功：查询数据
  /// 失败：返回空 打印报错
  Future<List<Map>> RunSelect(String sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      List<Map> list = await database.rawQuery(sql);
      await database.close();
      return list;
    } catch (e) {
      List<Map> err = [];
      print(e.toString());
      return err;
    }
  }

  /// 传入sql语句组并事务提交多条sql语句
  /// 成功：操作成功
  /// 失败：操作失败 打印报错
  Future<String> RunBatch(List<String> sql) async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, DBPath);
      Database database = await openDatabase(path);
      var batch = database.batch();
      for (var i = 0; i < sql.length; i++) {
        batch.execute(sql[i]);
      }
      var results = await batch.commit();
      await database.close();
      return "操作成功";
    } catch (e) {
      print(e.toString());
      return "操作失败";
    }
  }
}