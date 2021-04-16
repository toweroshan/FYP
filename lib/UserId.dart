

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class UserId extends StatefulWidget {
  @override
  _UserIdState createState() => _UserIdState();
}

class _UserIdState extends State<UserId> {
  bool visible = false;
  int id;
  LoginState objLogin = LoginState();



  Future allPerson() async {
    var url = "https://diffused-props.000webhostapp.com/userId.php";


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('token');
    var data = {'username': username };
    var response = await http.post(url, body: json.encode(data));

    //return json.decode(response.body);

    if (response.statusCode == 200) {
      await FlutterSession().set('token1', id);
      SharedPreferences pref1 = await SharedPreferences.getInstance();
       pref1.setInt('token1', id);


      setState(() {
        visible = false;
      });
    }







  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,

        ),
        body: Container(
          color: Colors.lightGreenAccent[100],
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              //Center(

              // )
            ]),
            Align(
                alignment: Alignment.centerRight,
                child: FutureBuilder(
                  future: allPerson(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }

                    return snapshot.hasData
                        ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          id=list[index]['user_id'];
                           print (id);
                          allPerson();
                          /*
                          return Card(
                            color: Colors.blue[100],
                            child: IntrinsicHeight(
                              child: Row(

                                // crossAxisAlignment: CrossAxisAlignment.stretch,

                                  children: [
                                    Expanded(
                                      child: Column(children: [


                                        Container(
                                          height: 40.0,
                                          child: Text(
                                            'User ID    ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                FontStyle.italic),
                                          ),
                                        )
                                      ]),
                                    ),
                                    Expanded(
                                      child: Column(children: [


                                        Container(
                                          height: 40.0,
                                          child: Text(
                                            list[index]['user_id'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                FontStyle.italic),

                                          ),


                                        ),
                                      ]),
                                    ),
                                  ]),
                            ),

                          );

                          */

                        })
                        : Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ))
          ]),

        )
    );
  }
}


