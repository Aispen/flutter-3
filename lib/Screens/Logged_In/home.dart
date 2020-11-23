import 'package:flutter/material.dart';
import 'package:praktinis_3/StorageImplementation/dbContext.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  dbContext _database = new dbContext();

  Widget _buildFutureList() {
    return FutureBuilder(
        future: _database.getAdvertList(),
        builder: (context, snapshot) {
          if(snapshot.data != null){
            if(snapshot.hasError){
              return Center(child: Text('Something Went Wrong'),);
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, int index){
              return Flexible(
                child: Card(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(snapshot.data[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Kaina: '+snapshot.data[index].price.toString() + 'EUR',
                        style: TextStyle(
                            fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                        ],
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(snapshot.data[index].description,
                            style: TextStyle(
                                fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              },
              itemCount: snapshot.data.length,
            );
          }
          else{
            return CircularProgressIndicator();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _buildFutureList()),);
  }
}
