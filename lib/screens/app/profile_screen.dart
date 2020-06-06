import 'package:flutter/material.dart';
import 'package:crowdlytics/components/rounded_button.dart';
import 'package:crowdlytics/utils/styles.dart';
import 'package:crowdlytics/utils/data.dart' as DATA;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {

  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Add Expense",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 10),
          child: Container(
            child: ListView(
              children: <Widget>[

                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),

                  decoration: kSTORENAME,

                  onChanged: (value) {
                    DATA.storeName = value;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),

                  decoration: kMAX,

                  onChanged: (value) {
                    DATA.max = int.parse(value);
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),

                  decoration: kX,

                  onChanged: (value) {
                    DATA.x = double.parse(value);
                  },
                ),


                SizedBox(
                  height: 10,
                ),

                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),

                  decoration: kY,

                  onChanged: (value) {
                    DATA.y = double.parse(value);
                  },
                ),


                SizedBox(
                  height: 50,
                ),

                RoundedButton(
                  title: "Submit",
                  colour: Colors.black,
                  onPressed: () async {
                    // need to change endpoint once ready
                    var url = 'http://localhost:4567/api/store';
                    var response = await http.patch(url, body: json.encode(
                        {
                          "owner_id": DATA.ownerID,
                          "store_name": DATA.storeName,
                          "max": DATA.max,
                          "latitude": DATA.x,
                          "longitude": DATA.y
                        }),
                        headers: {"Content-Type": "application/json"});

                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
