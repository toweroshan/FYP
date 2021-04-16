
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Payment.dart';
import 'package:flutter_app/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


import 'package:flutter_search_bar/flutter_search_bar.dart';

import 'AddToCart.dart';
import 'Profile.dart';
import 'cart_widget.dart';



class Products extends StatefulWidget {
  //SearchBar searchBar;
  @override
  _ProductsState createState() => _ProductsState();


}

class _ProductsState extends State<Products> {
  SearchBar searchBar;
  Cart obj=Cart();
  int _value = 1;
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {


       return AppBar(


        title: new Text('Products'),
        centerTitle: true,
        actions:<Widget> [searchBar.getSearchAction(context),

        ],
    );



  }


/*
  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }
*/


  _ProductsState() {
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






  Future allPerson() async {
    var url = "https://diffused-props.000webhostapp.com/load.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

        backgroundColor: Colors.lightBlueAccent[100],
        appBar: searchBar.build(context),
   //   key: _scaffoldKey,
     // body: new Center(
      //    child: new Text("Don't look at me! Press the search button!")),
        //appBar: AppBar(title: Text('data'),),


        body:Column(
            children:<Widget> [
        Row(
        children: <Widget>[




            DropdownButton(
            value: _value,

            items: [



              DropdownMenuItem(
                child: Text("First Item"),
                value: 1,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
                },
              ),
              DropdownMenuItem(
                child: Text("Second Item"),
                value: 2,

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
              });
            }
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
               Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);


          },
        ),
        )


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
    //  child: Padding(
    // padding: const EdgeInsets.all(20.0),
    // padding: EdgeInsets.fromLTRB(12, 12, 12, 12),

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
    //obj.addToCart(40, list[index]['product_id'],list[index]['quantity']);
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


    }) : Center(child: CircularProgressIndicator(),);



    },
    )
    ),
    ]
        )

        );




  }
  }

