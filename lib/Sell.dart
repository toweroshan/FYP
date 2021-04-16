import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/ProductLoad.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
File image;
final picker = ImagePicker();
TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController oIDController = TextEditingController();

//String category= categoryController.text;

  String category;

  Future choiceImage()async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage.path);
    });
  }

    Future uploadImage()async{

      final uri = Uri.parse("https://diffused-props.000webhostapp.com/upload.php");

      var request = http.MultipartRequest('POST',uri);
      request.fields['name']= nameController.text;
      request.fields['price']= priceController.text;
      request.fields['description']= descriptionController.text;
      request.fields['quantity']= quantityController.text;
      //request.fields['category']=categoryController.text;
      request.fields['category']=category;
      request.fields['ownerId']= oIDController.text;



      var pic = await http.MultipartFile.fromPath ("image",image.path);
      request.files.add(pic);
      var response = await request.send();

      if(response.statusCode == 200){
        print ('Image uploaded');
      }else{
        print('Image not uploaded');
      }


  }
    int _value=1;


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],

        appBar: AppBar(

          title: Text('Enter Your Product Details'),
        ),
        body: SingleChildScrollView(

          child: Center(
            child: Column(
              children: <Widget>[



                IconButton(icon: Icon(Icons.camera),
                  onPressed: () {
                    choiceImage();
                  },),
                Container(
                  width: 280,
                  height: 200,
                  padding: EdgeInsets.all(10.0),
                  child: image == null ? Text('No image selected') : Image.file(
                      image),
                ),






                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child:TextField(

                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Product Name'

                    ),

                  ),
                ),


                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        hintText: 'Product Price'
                    ),
                  ),
                ),


                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Product Description'
                    ),
                  ),
                ),


                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                        hintText: 'Product Quantity'
                    ),
                  ),
                ),

                      Container(
                          width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: DropdownButton(
                            value: _value,
                            items: [


                              DropdownMenuItem(
                                child: Text("Category"),
                                value: 1,
                                onTap: (){

                                },
                              ),
                              DropdownMenuItem(
                                child: Text("Machinery"),
                                value: 2,
                                onTap: (){
                                  category='Machinery';

                                },

                              ),
                              DropdownMenuItem(
                                  child: Text("Lighting"),
                                  value: 3,
                                  onTap:(){
                                    category='Lighting';
      }
                              ),
                              DropdownMenuItem(
                                  child: Text("Clothing"),
                                  value: 4,
                                onTap: (){
                                    category='Clothing';
                                },
                              ),
                              DropdownMenuItem(
                                child: Text("Electronics"),
                                value: 5,
                                onTap: (){
                                  category='Electronics';


                                },
                              ),

                            ],

                            onChanged: (value) {
                              setState(() {

                                _value = value;
                                print(value);
                              });
                            }





                        ),

                      ),


/*
                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: categoryController,
                    decoration: InputDecoration(
                        hintText: 'Product Category'
                    ),
                  ),
                ),

*/

                Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: oIDController,
                    decoration: InputDecoration(
                        hintText: 'Owner ID'
                    ),
                  ),
                ),


                RaisedButton(child: Text('Upload Image'),
                  onPressed: () {
                    uploadImage();

                  },),






                RaisedButton(child: Text('next page'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Products()));
                },

                )


              ],
            ),
          ),
        ),
      );
    }
  }




