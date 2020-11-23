import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktinis_3/Screens/welcome_screen.dart';
import 'package:praktinis_3/StorageImplementation/LocalStorageContext.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praktinis_3/Models/app_state.dart';
import 'package:praktinis_3/Redux/reducers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Avoid errors
  LocalStorageContext _localStorage = LocalStorageContext();

  final _initialState = AppState(loggedInUser: 'test');
  final Store<AppState> _store = Store<AppState>(reducer, initialState: _initialState);


  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {

  final Store<AppState> store;
  MyApp({this.store});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Praktinis 3',
          home: WelcomeScreen(),
      ),
    );
  }
}