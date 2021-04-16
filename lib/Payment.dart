import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController AmountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Payment'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width/2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: AmountController,
                decoration: InputDecoration(
                  hintText: 'Amount'
                ),
              ),
            ),
          RaisedButton(color: Colors.green,
          child: Text('Pay'),
            onPressed: (){
            _sendToKhalti(context);
            },
          )
          ]


        ),
      ),


    );
  }
}

_sendToKhalti(BuildContext context){
  FlutterKhalti _flutterKhalti= FlutterKhalti.configure(publicKey: "test_public_key_36ccd6d2b4bf4926a699b90213b6bc45",
      urlSchemeIOS: "KhaltiPayFlutterExampleSchema",);

  KhaltiProduct product=KhaltiProduct(
    id: "test",
    amount: 1000.00,
    name: "Payment for something"
  );
  _flutterKhalti.startPayment(
    product: product,
    onSuccess: (data){
      print('Payment Made successful');

    },
    onFaliure: (error){
      print('Failure');
    },
  );
}