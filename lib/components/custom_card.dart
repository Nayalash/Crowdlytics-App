import 'package:flutter/material.dart';

class CustomCardList extends StatelessWidget {
  String label;
  String subtitle;


  CustomCardList({this.label, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.data_usage,
            color: Colors.white,
          ),

          title: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),

          subtitle: Text(
            subtitle,
            style: TextStyle(
                color: Colors.orangeAccent
            ),
          ),
        )
    );
  }
}