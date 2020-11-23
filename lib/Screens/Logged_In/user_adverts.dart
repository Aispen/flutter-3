import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';
import 'package:praktinis_3/StorageImplementation/LocalStorageContext.dart';
import 'package:praktinis_3/Models/advert.dart';
import 'package:praktinis_3/Models/app_state.dart';
import 'package:praktinis_3/Redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:praktinis_3/Redux/actions.dart';

class UserAdverts extends StatefulWidget {
  @override
  _UserAdvertsState createState() => _UserAdvertsState();
}

class _UserAdvertsState extends State<UserAdverts> {

  dbContext _database = new dbContext();
  LocalStorageContext _localStorage = new LocalStorageContext();

  Widget _buildFutureList() {
    String username = _localStorage.userRetrieve();
    return FutureBuilder(
        future: _database.getUserAdvertList(username),
        builder: (context, snapshot) {
          if(snapshot.data != null){
            if(snapshot.hasError){
              return Center(child: Text('Something Went Wrong'),);
            }
            return _buildItemList(snapshot);
          }
          else{
            return CircularProgressIndicator();
          }
        }
    );
  }

  Widget _buildItemList(AsyncSnapshot snapshot){
    if(snapshot.data != null){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {_database.deleteAdvert(snapshot.data[index].id);
              });
            },
          child: index < snapshot.data.length
            ? _buildItem(snapshot.data[index])
            : null,
          background: Container(
              color: Colors.red[400],
              child: Icon(Icons.cancel)
            ),
            secondaryBackground: Container(
              color: Colors.yellow[400],
              child: Icon(Icons.edit),
            ),
        );
      },
      itemCount: snapshot.data.length,
    );
  }else{
      return Center(
        child: Text("No adverts published"),
      );
    }
  }

  Widget _buildItem(dynamic data){
    return Container(
      color: Colors.blue[100],
      child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              print('edit advert');
              _showDialog(data);
            },
          ),
          title: Text(data.title
          ),
      ),
    );
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  _updateAdvert(int id, String userId){
  final updatedAdvert = Advert(
    id: id,
    userId: userId,
    title:  titleController.text,
    description: descriptionController.text,
    picture: '',
    price: int.parse(priceController.text)
  );
  _database.updateAdvert(updatedAdvert);
  }

  _showDialog(Advert advert) async {
    titleController.text = advert.title;
    descriptionController.text = advert.description;
    priceController.text = advert.price.toString();

    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Column(
          children: [
            new Expanded(
              child: new TextField(
                controller: titleController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Title', hintText: advert.title),
              ),
            ),
            new Expanded(
              child: new TextField(
                controller: descriptionController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Description', hintText: advert.description),
              ),
            ),
            new Expanded(
              child: new TextField(
                controller: priceController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Price', hintText: advert.price.toString()),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('UPDATE'),
              onPressed: () {
                _updateAdvert(advert.id, advert.userId);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: _buildFutureList(),
        ),
      floatingActionButton: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state){
            return FloatingActionButton(
              child: Icon(Icons.logout),
              onPressed: (){
                StoreProvider.of<AppState>(context).dispatch(RemoveUserAction(state.loggedInUser));
                //print('STATEEEEEEEE:' + state.loggedInUser);
                _localStorage.userDelete();
                Navigator.pop(context);
              },
            );
          }
      ),
    );
  }
}
