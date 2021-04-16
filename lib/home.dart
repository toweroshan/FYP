import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/AddToCart.dart';
import 'package:flutter_app/Electronics.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/cart_widget.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/user_provider.dart';
import 'package:flutter_app/users.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_app/Sell.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Payment.dart';
import 'ProductLoad.dart';
import 'UserId.dart';



class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username;
  String id='';
  UserId obj1 =  UserId();
  Cart obj=Cart();

  SearchBar searchBar;


  AppBar buildAppBar(BuildContext context) {
    //Provider.of<UserProvider>(context, listen: false).allPerson();
    return AppBar(
      title: Text('Home Page'),
      centerTitle: true,
      actions:<Widget> [searchBar.getSearchAction(context),
      ],
    );
  }



  int _value = 1;
  bool visible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();




  _HomeState() {

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
Future product()async{
  var url = "https://diffused-props.000webhostapp.com/load.php";
  var response = await http.get(url);
  SharedPreferences prefs = await SharedPreferences.getInstance();
   username = prefs.getString('token');


  return json.decode(response.body);

  }
/*
  Future user() async {
    var url = "https://diffused-props.000webhostapp.com/load.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    }
  }
*/

  Future allPerson() async {
    var url = "https://diffused-props.000webhostapp.com/userId.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String username = prefs.getString('token');

    //var response = await http.get(url);
    var data = {'username': username };
    var response = await http.post(url, body: json.encode(data));
    if(response.statusCode==200){
      var result = json.decode(response.body);
      print(result);
      result.forEach((p){
        var user = User.fromJson(p);
        id = user.userId;

      });
    }
   // return json.decode(response.body);


  }



  @override

  Widget build(BuildContext context) {
    id = Provider.of<UserProvider>(context, listen: false).id;
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


/*
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),

              ),

            ),


       */








      body:Column(
        children:<Widget> [
          Row(
            children: <Widget>[



          InkWell(
               child:DropdownButton(
                  value: _value,
                 items: [


                  DropdownMenuItem(
                     child: Text("Electronics"),
                     value: 1,
                     onTap: (){

                    String categories= 'hello';
                    print(categories);

                     },
                   ),

                   DropdownMenuItem(
                     child: Text("Second Item"),
                     value: 2,
                     onTap: (){

                     },

                   ),
                   DropdownMenuItem(
                       child: Text("Third Item"),
                       value: 3
                   ),
                   DropdownMenuItem(
                       child: Text("Fourth Item"),
                       value: 4
                   )

                 ],

                   onChanged: (value) {
                     setState(() {

                       _value = value;
                       print(value);
                       if(value == 1){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Electronics()));
                       }

                     });
                   }





               ),
          ),



                    Expanded(child: RaisedButton
                      (

                      child: Text('Upload',),
                        shape:
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            ),

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sell()),);
                       // addToCart();
                        //obj.addToCart(1,2,3);
                      },
                    ),
                    )


                ]
    ),





        Expanded(
       //InkWell(

           child: FutureBuilder(

            future: product(),

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
                  //  child: Padding(
                      // padding: const EdgeInsets.all(20.0),
                     // padding: EdgeInsets.fromLTRB(12, 12, 12, 12),

                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                          child:Container(

                            width: 100,
                            height: 100,
                           // padding: EdgeInsets.all(40),

                            child: Image.network(  "https://diffused-props.000webhostapp.com/uploads/${list[index]['image']}"),
                          ),
                            onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => Sell()),);
                            },
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


                                  obj.addToCart(id, list[index]['product_id'],list[index]['quantity']);
                                  print(id);

                }


                              )
                )
                            ],
                          )




                        ],

                     // ),
                   // )
                      ),
                );



              }) : Center(child: CircularProgressIndicator(),);



        },
      ),
         )
    ]
      )



    );


  }


  }
