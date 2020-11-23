import 'package:flutter/material.dart';
import 'package:praktinis_3/StorageImplementation/LocalStorageContext.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';
import 'package:praktinis_3/Models/advert.dart';

class AddNewAdvert extends StatefulWidget {
  @override
  _AddNewAdvertState createState() => _AddNewAdvertState();
}
class _AddNewAdvertState extends State<AddNewAdvert> {

  dbContext _database = new dbContext();
  LocalStorageContext _localStorage = new LocalStorageContext();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  _clearTextInputs(){
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  _createAdvert(){
    Advert newAdvert = Advert(
      userId: _localStorage.userRetrieve(),
      title: titleController.text,
      description: descriptionController.text,
      picture: '',
      price: int.parse(priceController.text),
    );
    _database.advertInsert(newAdvert);
    _clearTextInputs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              height: 60,
              color: Colors.transparent,
            ),
            Text('Create Your New Advert',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            Divider(
              height: 60,
              color: Colors.transparent,
            ),
              Container(
                width: 350,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular((29)),
                ),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.title, color: Colors.teal,),
                      hintText: "Title"
                  ),
                ),
              ),
              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular((29)),
                ),
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.description, color: Colors.teal,),
                        hintText: "Your Cool Description"
                    ),
                  ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular((29)),
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.money, color: Colors.teal,),
                      hintText: "Price Of the item"
                  ),
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                onPressed: (){
                  _createAdvert();
                },
                child: Text(
                  'Publish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 50),
                  backgroundColor: Colors.blue[500],
                ),
              ),
            ),
            Divider(
              height: 30,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
