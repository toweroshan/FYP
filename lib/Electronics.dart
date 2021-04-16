

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';

import 'AddToCart.dart';
import 'Profile.dart';
import 'Sell.dart';
import 'cart_widget.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_search_bar/flutter_search_bar.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  Cart obj=Cart();
  SearchBar searchBar;


  AppBar buildAppBar(BuildContext context) {


    return AppBar(
      title: Text('Electronics'),
      centerTitle: true,

      actions:<Widget> [searchBar.getSearchAction(context),
      ],
    );
  }



  int _value = 1;
  bool visible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();




  _ElectronicsState() {

    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        //onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });

  }
  List data=[];
  Future allPerson()async{
    var url = "https://diffused-props.000webhostapp.com/electronics.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future user() async {
    var url = "https://diffused-props.000webhostapp.com/electronics.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    }


    var message = json.decode(response.body);


    if (message == 'Login Matched') {

      //await FlutterSession().set('id', )
      setState(() {
        visible = false;
      //  print(username.toString());
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Electronics()));
    }
    else {
      setState(() {
        visible = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[

              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],

        appBar: searchBar.build(context),
        // body: Center(child: Text('My Page!')),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[


              DrawerHeader(
                child: FutureBuilder(
                    future:   FlutterSession().get('token'),
                    builder: (context,snapshot){
                      return Text(snapshot.hasData? snapshot.data: 'Loading...');

                    }),
                /*Text('Navigate'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              */
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {

                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
                },
              ),
              ListTile(
                title: Text('Cart'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()),);
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cart'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  FlutterSession().set('token', '');
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
                },
              ),

            ],
          ),

        ),










        body:Column(
            children:<Widget> [
              Row(
                  children: <Widget>[


                    DropdownButton(
                      //value: _value,

                        items: [
                          DropdownMenuItem(
                            value: 'Earth',
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
                                },
                                child:Text('Earth')
                            ),)
                        ]

                    ),



                  ]
              ),





              Expanded(

                child: FutureBuilder(

                  future: allPerson(),

                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }


                    return snapshot.hasData ?

                    ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return Card(

                              elevation: 10,
                              color: Colors.greenAccent[100],

                              margin: const EdgeInsets.only(top: 10.0),

                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  Container(

                                    width: 100,
                                    height: 100,
                                    // padding: EdgeInsets.all(40),

                                    child: Image.network(  "https://diffused-props.000webhostapp.com/uploads/${list[index]['image']}"),
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(fontFamily: 'MonteSerrat', fontSize: 16.0),

                                  ),

                                  Column(

                                    children:[

                                      //  Wrap(

                                      // direction: Axis.horizontal,
                                      //  children: <Widget>[
                                      Row(
                                          children: <Widget>[

                                            Text('Product Name: '),
                                            // Expanded(child:
                                            Text(list[index]['product_name']),
                                          ]
                                      ),

                                      Row(
                                          children: <Widget>[
                                            Text('        '),
                                          ]
                                      ),

                                      Row(

                                          children: <Widget>[

                                            // Text('        '),
                                            Text('Quantity Available: ',),
                                            Text(list[index]['quantity']),

                                          ]
                                      ),

                                      Row(
                                          children: <Widget>[
                                            Text('        '),
                                          ]
                                      ),

                                      Row(
                                          children: <Widget>[

                                            //  Text('        '),
                                            Text('Price: Rs'),
                                            Text(list[index]['product_price']),

                                          ]
                                      ),


                                    ],

                                  ),


                                  // ],
                                  // ),


                                  Column(

                                    children: <Widget>[

                                      Center(
                                          child: IconButton(
                                              icon: Icon(Icons.add_shopping_cart,color: Colors.red,),
                                              //child: Text('Add to cart'),



                                              onPressed: () {
                                                //  print(data[index]['user_id']);
                                                //print(list[index]['product_id']);
                                               // obj.addToCart(name, list[index]['product_id'],list[index]['quantity']);
                                              }


                                          )
                                      )
                                    ],
                                  )




                                ],

                                // ),
                                // )
                              )
                          );


                        }) :
                    Center(child: CircularProgressIndicator(),);



                  },
                ),
              )
            ]
        )



    );

  }
}
