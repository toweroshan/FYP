import 'dart:convert';

import 'package:http/http.dart' as http;

 class Cart {

   void addToCart(String user_id, String product_id, String quantity ) async {
    // a=Text(list[index]['quantity']);
    var url = "https://diffused-props.000webhostapp.com/addCart1.php?user_id=$user_id&product_id=$product_id&quantity=$quantity";
    print(url);
  //  var data = {'user_id': user_id,'product_id': product_id , 'quantity': quantity};

    var response = await http.post(url);
   // var message = jsonDecode(response.body);


    if (response.statusCode == 200) {
      print("added");
    }else{
      print("failed");
    }
   // var response = await http.get(url);
   // print('hello');



  }

}