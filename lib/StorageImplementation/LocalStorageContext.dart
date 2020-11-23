import 'package:localstorage/localstorage.dart';

class LocalStorageContext{
  final LocalStorage _storage = new LocalStorage('session');

  Future<void> userSave(String username) async{
    if(await _storage.ready == true){
      _storage.setItem('session', username);
    }
  }

  Future<void> userDelete() async{
    if(await _storage.ready == true){
      _storage.deleteItem('session');
    }
  }

  String userRetrieve() {
    //if(_storage.ready == true){
      String usernameToReturn = _storage.getItem('session');
        return usernameToReturn;

    //}
  }
}