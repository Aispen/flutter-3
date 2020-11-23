import 'package:flutter/material.dart';
import 'package:praktinis_3/Models/user.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';
class RegisterScreen extends StatelessWidget {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  dbContext _database = new dbContext();

  _register(context) async{
    final newUser = User(
      userId: usernameController.text,
      password: passwordController.text,
    );
    await _database.userInsert(newUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register Page', style: TextStyle(
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
              ),),
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
            Divider(
              height: 40,
              color: Colors.transparent,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                onPressed: (){_register(context);},
                child: Text(
                  'Register',
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
            ),
          ],
        ),
      ),

    );
  }
}
