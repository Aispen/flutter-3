import 'package:flutter/material.dart';
import 'package:praktinis_3/Redux/actions.dart';
import 'package:praktinis_3/Screens/home_page_navigator.dart';
import 'package:praktinis_3/StorageImplementation/LocalStorageContext.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';
import 'package:praktinis_3/Models/user.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praktinis_3/Models/app_state.dart';
import 'package:praktinis_3/Redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:praktinis_3/Redux/actions.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool checkedValue = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  dbContext _database = new dbContext();
  LocalStorageContext _localStorage = new LocalStorageContext();

  _loginCheck(context) async{
    final List<User> retrievedUsers = await _database.getUserList();
    retrievedUsers.forEach((element){
      if(element.userId == usernameController.text &&
          element.password == passwordController.text){
        if(checkedValue == true){
          _localStorage.userSave(usernameController.text);
        }
        Navigator.push(context, MaterialPageRoute(builder: (context){return HomePageNavigator();}));
      }
      else{print('Nera tokio naudotojo :(');}
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,),),
            Divider(
              height: 40,
              color: Colors.transparent,
            ),
            Container(
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular((29)),
              ),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.grey[200],),
                    hintText: "Username"
                ),
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular((29)),
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.grey[200],),
                    hintText: "Password"
                ),
                obscureText: true,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CheckboxListTile(
              title: Text("Remember Me"),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            )),
            Divider(
              height: 40,
              color: Colors.transparent,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    onPressed: (){
                      StoreProvider.of<AppState>(context).dispatch(AddUserAction(usernameController.text));

                      _loginCheck(context);

                      //print('STATEEEEEEEE:' + state.loggedInUser);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 50),
                      backgroundColor: Colors.purple[400],
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

