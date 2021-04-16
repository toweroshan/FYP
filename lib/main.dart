import 'dart:convert';

import 'package:flutter_app/Payment.dart';
import 'package:flutter_app/ProductLoad.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/TradeBook.dart';
import 'package:flutter_app/UserId.dart';
import 'package:flutter_app/user_provider.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';
import 'package:flutter_app/Sell.dart';
import 'package:flutter_app/home.dart';
import 'Electronics.dart';
import 'cart_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




import 'package:flutter_app/XDiPhone678Plus1.dart';
import 'package:flutter_app/register.dart';
import 'login.dart';

void main() {
   // WidgetsFlutterBinding.ensureInitialized();
   // dynamic token = FlutterSession().get('token');
    //runApp(MaterialApp(home: token != '' ? Home() : MyApp(),));
    runApp(MyApp());

        }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.deepOrange,
        ),

        home: Scaffold(

            body: Center(

                child: Login()
            )

        )
    );
  }


}
/*
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Registration'),),
        body: Center(
          child: RegisterUser(),
        ),



      ),
    );
  }
}

 */
/*
class RegisterUser extends StatefulWidget {

  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State<RegisterUser> {
  bool visible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    setState(() {
      visible = true;
    });

    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;


    var url = 'http://localhost/phpmyadmin/sql.php?db=flutter&table=login&pos=0';

    var data = {'name': name, 'email': email, 'password': password};

    var response = await http.post(url, body: json.encode(data));
    var message = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
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
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('User Registration Form',
                          style: TextStyle(fontSize: 21))),

                  Divider(),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: nameController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Name Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Enter Your Password Here'),
                      )
                  ),

                  RaisedButton(
                    onPressed: userRegistration,
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('Click Here To Register User Online'),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator()
                      )
                  ),

                ],
              ),
            )));
  }
}
*/

/*
class MyApp extends StatelessWidget {
  final routes= <String, WidgetBuilder>{
   Register.tag:(context){
      return Register();

   }

  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Register(),
      routes: routes,

    )


    ;

  }
}


*/
/**
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar (
          title: Center(child:Text('Tap Trade'),),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Image(
              image: AssetImage('images/one.jpg')
          ),
        ),
      ),
    );
  }
}

    **/
/**
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(child: Container(
          height: 100,
          width: 50,
          margin: EdgeInsets.fromLTRB(10, 70, 50, 10),
          padding: EdgeInsets.all(20.0),
          color: Colors.amber,
          child: Text('hiii'),
        ),),
      ),
    );
  }
}
**/
/**
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           // verticalDirection: VerticalDirection.up,
           // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.amber,
                  child: Text('hiii'),),


                Container(
                  width: 100,
                  color: Colors.blueAccent,
                  child: Text('two'),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors. deepOrangeAccent,
                  child: Text('hiii'),),
              ]
          ),
        ),
      ),
    );
  }
}
**/
/**
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    backgroundColor: Colors.amber,
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[


            CircleAvatar(
              backgroundImage: AssetImage('images/one.jpg'),
              radius: 50,
),
              Text ('Roshan',
              style: TextStyle(
              fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal:  20.5),
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              child:  ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                  title: Text('software engineer'),



              ),
            ),
          /**  Container(
              color: Colors.black12,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black, ),
                    Text(
                      'hello'
                  )
                ],
              ),
            )
**/
            Card(
              color: Colors.black12,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.5),
              child: ListTile (
                leading: Icon(
                  Icons.add_shopping_cart,
                ),
                title: Text('hello dai'),





),
),

          ]
        ),
      ),
    ),
    );
  }
}

**/

