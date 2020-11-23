import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:praktinis_3/Models/user.dart';
import 'package:praktinis_3/Models/advert.dart';
import 'dart:async';
import 'package:praktinis_3/test_data_repo.dart';

class dbContext{
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'advert_database.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            "CREATE TABLE users(userId TEXT PRIMARY KEY, password TEXT)"
          );
          await db.execute(
            "CREATE TABLE adverts(id INTEGER PRIMARY KEY, userId TEXT, title TEXT, description TEXT, picture TEXT, price INTEGER,"
            "FOREIGN KEY (userId) REFERENCES users (userId) ON DELETE NO ACTION ON UPDATE NO ACTION)"
          );
          TestData test = TestData();
          test.addTestDatatoDB();
        },
      );
    }
  }
//user
  Future<void> userInsert(User user) async{

    await openDb();
    return await _database.insert(
        'users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<User>> getUserList() async{
     await openDb();
     final List<Map<String, dynamic>> maps = await _database.query('users');
     return List.generate(maps.length, (i){
       return User(
           userId: maps[i]['userId'],
           password: maps[i]['password']
       );
     });
  }

  Future<void> updateUser(User user) async{
    await openDb();
    await _database.update(
      'users',
      user.toMap(),
      where: "userId = ?",
      whereArgs: [user.userId],
    );
  }

  Future<void> deleteUser(String userId) async{
    await openDb();
    await _database.delete(
      'users',
      where: "userId = ?",
      whereArgs: [userId]
    );
  }
//adds
  Future<void> advertInsert(Advert advert) async{
    await openDb();
    return await _database.insert(
        'adverts',
        advert.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  
  Future<List<Advert>> getAdvertList() async{
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('adverts');
    return List.generate(maps.length, (i){
      return Advert(
        id: maps[i]['id'],
        userId: maps[i]['userId'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        picture: maps[i]['picture'],
        price: maps[i]['price']
      );
  });
  }

  Future<List<Advert>> getUserAdvertList(String username) async{
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query(
        'adverts',
        where: 'userId = ?',
        whereArgs: [username]
    );
    return List.generate(maps.length, (i){
      return Advert(
          id: maps[i]['id'],
          userId: maps[i]['userId'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          picture: maps[i]['picture'],
          price: maps[i]['price']
      );
    });
  }

  Future<void> updateAdvert(Advert advert) async{
    await openDb();
    await _database.update(
      'adverts',
      advert.toMap(),
      where: "id = ?",
      whereArgs: [advert.id],
    );
  }

  Future<void> deleteAdvert(int id) async{
    await openDb();
    await _database.delete(
      'adverts',
      where: "id = ?",
      whereArgs: [id]
    );
  }
  //test
  void printUsers() async{
    final List<User> retrievedUserList = await getUserList();
    retrievedUserList.forEach((element) {print(element.userId);print(element.password);});
  }
  void printAdverts() async{
    final List<Advert> retrievedAdvertList = await getUserAdvertList('Naudotojas2');
    retrievedAdvertList.forEach((element) {print(element.id);print(element.userId);print(element.title);});
  }
}