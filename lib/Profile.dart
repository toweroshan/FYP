import 'dart:convert';
import 'package:flutter_app/login.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id;
  LoginState objLogin = LoginState();



  Future allPerson() async {
    var url = "https://diffused-props.000webhostapp.com/profile.php";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('token');

   //var response = await http.get(url);
    var data = {'username': username };
    var response = await http.post(url, body: json.encode(data));

    SharedPreferences pref1 = await SharedPreferences.getInstance();
    int idd = pref1.getInt('token1');
    print(idd);

    return json.decode(response.body);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              /* Write listener code here */
            },
            child: Icon(
              Icons.keyboard_return, // add custom icons also
            ),
          ),
        ),
        body: Container(
          color: Colors.lightGreenAccent[100],
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              //Center(
              Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    // border: Border.all(
                    //   color: Colors.red[500],
                    //),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  'images/profile.png',
                  fit: BoxFit.contain,
                ),
                height: 200,
                width: 300,
              )

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
                             // print (id);
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
                                                'Name:    ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            Container(
                                              height: 40.0,
                                              child: Text(
                                                'Address:    ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
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
                                                list[index]['username'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            Container(
                                              height: 40.0,
                                              child: Text(
                                                list[index]['address'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
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
