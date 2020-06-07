import 'package:flutter/material.dart';
import 'package:crowdlytics/utils/data.dart' as DATA;
import 'package:crowdlytics/screens/app/profile_screen.dart';
import 'package:crowdlytics/screens/app/view_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int n = 0;
  int MAX = DATA.max;

  void add() async {
    setState(() {
      if (n < MAX) {
        n++;
      }
    });

    var url = 'http://localhost:4567/api/store/count';
    var response = await http.put(url,
        body: json.encode({
          "owner_id": DATA.ownerID,
        }),
        headers: {"Content-Type": "application/json"});
  }

  void minus() {
    setState(() {
      if (n != 0) n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
              icon: Icon(
                Icons.trending_up,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ViewScreen.id);
              }),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                }),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //TITLE
              Center(
                child: Text(
                  "${DATA.storeName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.white,
                    onPressed: add,
                    child: Icon(Icons.add, color: Colors.red),
                  ),
                  Text('${n}',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.white,
                    onPressed: minus,
                    child: Icon(Icons.remove, color: Colors.red),
                  ),
                ],
              ),

              Center(
                child: Text(
                  "Max People: ${DATA.max}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
