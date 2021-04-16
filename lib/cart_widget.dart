


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import 'Cart.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 248 * count;
        });
      }
    }
  }

  final int fitSize = 1;

  List<Cart> cartList = [];

  int price = 0;

  @override
  Widget build(BuildContext context) {

   // cartList = Provider.of<CartProvider>(context, listen: false).cartList;

    return Scaffold(

      body: ListView(shrinkWrap: true, children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Stack(children: [
            Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Container(
                height: 250.0,
                width: double.infinity,
                color: Color(0xFFFDD148),
              ),
              Positioned(
                bottom: 450.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Color(0xFFFEE16D),
                  ),
                ),
              ),
              Positioned(
                bottom: 500.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(0xFFFEE16D).withOpacity(0.5))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: IconButton(
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Positioned(
                  top: 75.0,
                  left: 15.0,
                  child: Text(
                    'Shopping Cart',
                    style: TextStyle(
                      color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  )
              ),
              Positioned(
                top: 150.0,
                child: Column(
                  children: <Widget>[
                    itemCard('Finn Navian-Sofa', 'gray', '248',
                        'assets/otto5.jpg', true, 0),
                    itemCard('Finn Navian-Sofa', 'gray', '248',
                        'assets/anotherchair.jpg', true, 1),
                    itemCard('Finn Navian-Sofa', 'gray', '248',
                       'assets/chair.jpg', false, 2)
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 600.0, bottom: 25.0),
                  child: Container(
                      height: 60.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Total: \$' + totalAmount.toString()),
                          SizedBox(width: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () {},
                              elevation: 0.5,
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  'Pay Now',
                                ),
                              ),
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      )
                  )
              )
             ]
            )
           ]
          )
         ]
        )
      ]
      ),
    );
  }

  Widget itemCard(itemName, color, price, imgPath, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                        color: picked[i]
                                            ? Colors.yellow
                                            : Colors.grey
                                            .withOpacity(0.4),
                                        borderRadius:
                                        BorderRadius.circular(6.0)),
                                  )
                                      : Container()))
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 150.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 4.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(width: 7.0),
                              available
                                  ? picked[i]
                                  ? Text(
                                'x1',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.grey),
                              )
                                  : Container()
                                  : Container()
                            ],
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                            'Color: ' + color,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey),
                          )
                              : OutlineButton(
                            onPressed: () {},
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid),
                            child: Center(
                              child: Text('Find Similar',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.red)),
                            ),
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                            '\$' + price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0xFFFDD34A)),
                          )
                              : Container(),
                        ],
                      )
                    ],
                  )
              )
          )
      ),
    );
  }
}









// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
// import 'package:tripansh/provider/cart_provider.dart';
//
// import 'models/cart.dart';
//
// class CartScreen extends StatelessWidget {
//   final int fitSize = 1;
//
//   List<Cart> cartList = [];
//
//   int price = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     cartList = Provider.of<CartProvider>(context, listen: false).cartList;
//
//     return Scaffold(
//       backgroundColor: Colors.white24,
//       body: Padding(
//         padding: const EdgeInsets.all(28),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Cart',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 32,
//                   ),
//                 ),
//                 FlatButton(
//                   onPressed: () {},
//                   child: Text('Clear Cart'),
//                   textColor: Colors.black,
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 child: SingleChildScrollView(
//                   //crossAxisAlignment: CrossAxisAlignment.start,
//                   //   physics: NeverScrollableScrollPhysics(),
//                   child: StaggeredGridView.countBuilder(
//                       primary: false,
//                       shrinkWrap: true,
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 2.0,
//                       crossAxisSpacing: 2.0,
//                       staggeredTileBuilder: (index) =>
//                           StaggeredTile.fit(fitSize),
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: cartList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return SingleCart(cartList[index]);
//                       }),
//                 ),
//                 // child: buildCardItems(context),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                     child: ListTile(
//                   title: Text(
//                     "Total:",
//                     style: TextStyle(color: Colors.black, fontSize: 18),
//                   ),
//                   subtitle: Text(
//                     '\$$price',
//                     style: TextStyle(color: Colors.black, fontSize: 20),
//                   ),
//                 )),
//                 Expanded(
//                     child: MaterialButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Checkout',
//                     style: TextStyle(color: Colors.black, fontSize: 18),
//                   ),
//                   // color:kAppbar,
//                 ))
//               ],
//             ),
//             SizedBox(height: 24),
//             Container(
//               width: double.infinity,
//               height: 50,
//               child: RaisedButton(
//                 color: Theme.of(context).primaryColor,
//                 shape: StadiumBorder(),
//                 child: Text(
//                   'Next',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SingleCart extends StatelessWidget {
//   final Cart _cart;
//
//   SingleCart(this._cart);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => ProductDetails(_cart) ));
//       },
//       child: Card(
//         child: Hero(
//             tag: _cart.name,
//             child: Column(
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: _cart.image,
//                   height: 200,
//                   width: 200,
//                 ),
//                 Text(
//                   _cart.name,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             )
//          ),
//       ),
//     );
//   }
// }

