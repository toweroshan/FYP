import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  Future allPerson() async {
    var url = "https://diffused-props.000webhostapp.com/cartLoad.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                  child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 36.0,
                        ),
                      ]

                  )

              ),

            ),
          ]

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
                                            list[index]['user_id'],
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
                                            list[index]['product_id'],
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
                                            list[index]['quantity'],
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