import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Payment.dart';

class SellHistory extends StatefulWidget {
  @override
  _SellHistoryState createState() => _SellHistoryState();

}

class _SellHistoryState extends State<SellHistory> {




  final idController = TextEditingController();
  bool visible = false;






    //var response = await http.post(url, body: json.encode(data));
    // var message = jsonDecode(response.body);


    Future allPerson() async {
      var url = "https://diffused-props.000webhostapp.com/tradeBook.php";
      var response = await http.get(url);
      return json.decode(response.body);
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(

          body: SingleChildScrollView(
              child: Center(


                  child: Column(
                      children: <Widget>[
                        TextField(
                          controller: idController,
                        ),

                        //  ElevatedButton(
                        //  onPressed: (){

                        FutureBuilder(


                          future: allPerson(),

                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                            }


                            return snapshot.hasData ?

                            ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  List list = snapshot.data;
                                  return Card(
                                      color: Colors.greenAccent[100],

                                      margin: const EdgeInsets.only(top: 20.0),
                                      child: Padding(
                                        //  padding: const EdgeInsets.all(20.0),
                                        padding: EdgeInsets.fromLTRB(
                                            12, 12, 12, 12),

                                        child: Row(

                                          children: <Widget>[
                                            Container(
                                              width: 100,
                                              height: 100,
                                              child: Image.network(
                                                  "https://diffused-props.000webhostapp.com/uploads/${list[index]['image']}"),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                  fontFamily: 'MonteSerrat',
                                                  fontSize: 16.0),

                                            ),


                                            Wrap(


                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text('Product Name: '),
                                                    Text(
                                                        list[index]['product_name']),
                                                    Text('        '),
                                                    Text('Price: Rs'),
                                                    Text(
                                                        list[index]['product_price']),

                                                    Text('        '),
                                                    Text(
                                                      'Quantity Available: ',),
                                                    Text(
                                                        list[index]['quantity']),


                                                  ],
                                                ),
                                              ],
                                            ),
/*
                      Align(
                        alignment: Alignment.centerRight,
                        child: removeCartFunction == null
                        ?IconButton(
                         icon: Icon(Icons.add_shopping_cart,color: Colors.red,),
                        )
                            :IconButton(Icons.remove_shopping_cart , color: Colors.red,),
                          onPressed: () {
                          checkItemInCart(model.quantity., context)

                          },),

                      */
                                            Column(


                                              children: <Widget>[


                                                IconButton(
                                                  icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.red,),
                                                  //child: Text('Add to cart'),


                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                Payment()));
                                                  },

                                                )
                                              ],
                                            )


                                          ],

                                        ),
                                      ));
                                }) : Center(
                              child: CircularProgressIndicator(),);
                          },
                        ),
                        //   },),
                      ]
                  )

              )

          )


      );
    }
  }

