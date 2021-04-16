import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';






class Register extends StatelessWidget {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        /*
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        */
        appBar: AppBar(title: Text('User Registration Form'),
        centerTitle: true,

        ),

        body: Center(
          child: RegisterUser(),
        ),



      ),
    );
  }
}



class RegisterUser extends StatefulWidget {

  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  bool _obscureText = true;


  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool visible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final companyNameController = TextEditingController();
  final contactNumberController = TextEditingController();

/*
  checkText() {
    String username = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;


    if (username == '' || email == '' || password == '') {
      final snackbar = SnackBar(
        content: Text('empty textfields'),

      );
      Scaffold.of(context).showSnackBar(snackbar);
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');
    } else{

    }

    }

*/

      Future webCall() async {
        setState(() {
          visible = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String idd = prefs.getString('token1');
        print(idd);

        String username = nameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        String address = addressController.text;
        String companyName = companyNameController.text;
        String contactNumber = contactNumberController.text;
        var url = 'https://diffused-props.000webhostapp.com/saveData.php';
        var data = {'username': username, 'email': email, 'password': password , 'address': address , 'companyName': companyName , 'contactNumber': contactNumber};

        var response = await http.post(url, body: json.encode(data));

        var message = jsonDecode(response.body);


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


      @override
      Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.amberAccent,
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                        CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(

                      'https://source.unsplash.com/50x50/?portrait',)
                        ),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          //child: Text('User Registration Form',
                              //style: TextStyle(fontSize: 21))
                      ),

                      Divider(),


                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            inputFormatters: [
                              BlacklistingTextInputFormatter(RegExp(r"\s")),
                            ],
                            controller: nameController,
                            autocorrect: true,
                            decoration: InputDecoration(

                                hintText: 'Enter Your Name Here'),
                          )
                      ),
                        Container(
                          width: 280,
                       child:Form(
                          autovalidate: true,
                          child: TextFormField(


                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Email Address'

                            ),
                            validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                          ),

                        ),
                        ),

                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            inputFormatters: [
                              BlacklistingTextInputFormatter(RegExp(r"\s")),
                            ],
                            controller: passwordController,
                            autocorrect: true,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter Your Password Here',
                                icon: const Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                                child: const Icon(Icons.lock))),
                                    // validator: (val) => val.length < 6 ? 'Password too short.' : null,
                                    // onSaved: (val) => _password = val,
                                    // obscureText: _obscureText,
                                              ),
                          ),


                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),

                          child: TextField(

                            inputFormatters: [
                              BlacklistingTextInputFormatter(RegExp(r"\s")),
                            ],
                            controller: addressController,
                            autocorrect: true,

                            decoration: InputDecoration(
                                hintText: 'Enter Your Address',

                            ),



                          ),

                      ),

                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            inputFormatters: [
                              BlacklistingTextInputFormatter(RegExp(r"\s")),
                            ],
                            controller: companyNameController,
                            autocorrect: true,
                           // obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter Company Name'),
                          )
                      ),

                      Container(
                          width: 280,
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            inputFormatters: [
                              BlacklistingTextInputFormatter(RegExp(r"\s")),
                            ],
                            controller: contactNumberController,
                            autocorrect: true,
                           // obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter Your Contact Number (+977)'),
                          )
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                        ),

                        child: RaisedButton(
                          onPressed: () {
                            webCall();
                            _toggle;
                            child: new Text(_obscureText ? "Show" : "Hide");
                            //checkText();
                          },

                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('Click Here To Register User Online'),


                        ),
                      ),

                      RaisedButton(
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:
                                  (context) => Login()),

                            );
                          }


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


