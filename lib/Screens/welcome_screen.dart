import 'package:flutter/material.dart';
import 'package:praktinis_3/Screens/register.dart';
import 'package:praktinis_3/StorageImplementation/LocalStorageContext.dart';
import 'home_page_navigator.dart';
import 'login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praktinis_3/Models/app_state.dart';
import 'package:praktinis_3/Redux/reducers.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  LocalStorageContext _localStorage = LocalStorageContext();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.teal[200],
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0,),),
              Divider(
                height: 40,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: TextButton(
                      onPressed: (){
                          String username = _localStorage.userRetrieve();
                          if(username == null){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                          }
                          else{
                             Navigator.push(context, MaterialPageRoute(builder: (context){return HomePageNavigator();}));
                          }
                        },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 40),
                        backgroundColor: Colors.purple[500],
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: TextButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));},
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 40),
                        backgroundColor: Colors.purple[500],
                      ),
                    ),
                  ),
                ],),
            ],
          ),),),
    );
  }
}
