
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/LoginModel.dart';
import 'package:flutter_app/ProductLoad.dart';
import 'package:flutter_app/home.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/register.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String tag = 'login-page';

 String user_id;
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool visible = false;

  final nameController = TextEditingController();
  final passwordController = TextEditingController();



 // void  login(String name) async {
  Future Login( )async{
    setState(() {
      visible = true;
    });

    String username = nameController.text;
    String password = passwordController.text;

    var url = 'https://diffused-props.000webhostapp.com/login.php';
    var data = {'username': username, 'password': password};
    var response = await http.post(url, body: json.encode(data));

    var message = json.decode(response.body);


    if (message == 'Login Matched') {
      await FlutterSession().set('token', nameController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('token', nameController.text);

      widget.user_id=(jsonDecode(response.body)["result"][0]["user_id"]).toString();
      print("user Id: ${widget.user_id}");

      //LoginModel.user_id = (jsonDecode(response.body)["result"][0]["user_id"].toString());
      //await FlutterSession().set('id', )
      setState(() {
        visible = false;
         //print(username.toString());
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
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





   // getStringValuesSF() async {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      //String name = prefs.getString('token');
      //return token;
      // print (name);
   // }
  }


      @override
      Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.amberAccent[100],

          body: SingleChildScrollView(



            child: Center(


              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text('',
                          style: TextStyle(fontSize: 21)),),
                 // Divider(),
                //  Image.asset('logo.png'),


                   Image.asset
                    ('images/logo.png'),




                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
                     child:TextFormField(
                       inputFormatters: [
                         BlacklistingTextInputFormatter(RegExp(r"\s")),
                       ],
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                       style: TextStyle(color: Colors.red),

                      decoration: InputDecoration(
                        fillColor: Colors.orange[100], filled: true,
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),

                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 0),
                    child:TextFormField(
                      inputFormatters: [
                        BlacklistingTextInputFormatter(RegExp(r"\s")),
                      ],
                    controller: passwordController,
                    obscureText: true,
                  //  obscuringCharacter: "*",
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.orange[100], filled: true,
                      hintText: 'password',

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 0),
                  child:RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.0),
                    ),

                    child: Text('Login'),
                    color: Colors.lightGreen,
                    onPressed: () {
                      Login();
                    },
                  ),
                  ),
                  Container(

                  child:FlatButton(
                    child: Text(
                      'Dont have an account? SignUp',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
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

            ),

          ),
        );
      }


    }
