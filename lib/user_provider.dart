import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/users.dart';

class UserProvider extends ChangeNotifier {


 // String id="";
  String name = "";
  String id='';


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
id = user.userId.toString();
print(id);

});
}
// return json.decode(response.body);


}
}