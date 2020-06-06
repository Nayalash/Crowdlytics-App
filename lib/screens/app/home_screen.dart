import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int n = 0;

  void add() {
    setState(() {
      n++;
    });
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
                //Navigator.pushNamed(context, HistoryScreen.id);
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
                  //Navigator.pushNamed(context, AddScreen.id);
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.white,
                    onPressed: add,
                    child: Icon(Icons.add, color: Colors.red),
                  ),
                  Text('$n', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.white,
                    onPressed: minus,
                    child: Icon(Icons.remove, color: Colors.red),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
