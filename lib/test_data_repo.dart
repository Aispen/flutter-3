import 'package:praktinis_3/Models/user.dart';
import 'package:praktinis_3/Models/advert.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';

class TestData{

  dbContext _database = dbContext();

  addTestDatatoDB(){
    Test_userList.forEach((element) {_database.userInsert(element);});
    Test_advertList.forEach((element) {_database.advertInsert(element);});
  }


 List<User> Test_userList = [
   User(
     userId: 'test',
     password: 'test',
   ),
   User(
     userId: 'Tomas',
     password: 'tomas123',
   ),
   User(
     userId: 'useris1',
     password: '123456',
   ),
   User(
     userId: 'Zigmas',
     password: 'abc123',
   ),
 ];

 List<Advert> Test_advertList = [
   Advert(
     userId: 'Tomas',
     title: 'Plancete',
     description: 'Puikiai veikia, viskas ok. Tel nr. 869595959',
     picture: '',
     price: 129,
   ),
   Advert(
     userId: 'Tomas',
     title: 'Saldytuvas',
     description: 'Biski pabraizytas el nr. 869595959',
     picture: '',
     price: 80,
   ),
   Advert(
     userId: 'Tomas',
     title: 'Ziemines padangos',
     description: 'Geros siaip dar metus laikys ,Tel nr. 869595959',
     picture: '',
     price: 90,
   ),
   Advert(
     userId: 'useris1',
     title: 'Mikrobange',
     description: 'Viskas veikia tik bisk atidauzytas :).Tel nr. +370611552244',
     picture: '',
     price: 30,
   ),
   Advert(
     userId: 'useris1',
     title: 'Skalbimo masina',
     description: 'Nesuka Tel nr. +370611552244',
     picture: '',
     price: 20,
   ),
   Advert(
     userId: 'useris1',
     title: 'Stalas',
     description: 'Biski pabraizytas Tel nr. +370611552244',
     picture: '',
     price: 45,
   ),
   Advert(
     userId: 'Zigmas',
     title: 'Kompiuteris',
     description: 'Ekranas susikiles Tel nr. +30465432156',
     picture: '',
     price: 4000,
   ),
   Advert(
     userId: 'Zigmas',
     title: 'Tapetai',
     description: 'Nauji, katik nuo tralo Tel nr. +30465432156',
     picture: '',
     price: 200,
   ),
   Advert(
     userId: 'Zigmas',
     title: 'Kaukes',
     description: '20 vnt. Padeda nuo koronos(gal) Tel nr. +30465432156',
     picture: '',
     price: 190,
   ),
   Advert(
     userId: 'test',
     title: 'Tara',
     description: '20 vnt. Tik rimti skambuciai Tel nr. +37011231144',
     picture: '',
     price: 5,
   ),
   Advert(
     userId: 'test',
     title: 'Kampinis slifuoklis',
     description: 'Pavogtas is statybininku, bet man nerupi Tel nr. +37011231144',
     picture: '',
     price: 80,
   ),
   Advert(
     userId: 'test',
     title: 'Tralas',
     description: 'pagalba kelyje 24-7, aciu uz demesi. Tel nr. +37011231144',
     picture: '',
     price: 1,
   ),
 ];
}