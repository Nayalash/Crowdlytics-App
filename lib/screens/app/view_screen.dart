import 'package:flutter/material.dart';
import 'package:crowdlytics/components/custom_card.dart';
import 'package:crowdlytics/utils/data.dart' as DATA;

class ViewScreen extends StatefulWidget {

  static const String id = 'view_screen';

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "View My Data"
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.redAccent,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              CustomCardList(label: DATA.storeName, subtitle: "Store Name"),
              SizedBox(height: 40),
              CustomCardList(label: DATA.max.toString(), subtitle: "Max"),
              SizedBox(height: 40),
              CustomCardList(label: DATA.x.toString(), subtitle: "Latitude"),
              SizedBox(height: 40),
              CustomCardList(label: DATA.y.toString(), subtitle: "Longitude")

            ],
          )
      ),
    );
  }
}
