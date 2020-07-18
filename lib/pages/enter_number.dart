import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hisi/widgets/custom_button.dart';
import 'package:hisi/pages/home.dart';

class EnterNumber extends StatefulWidget {
  @override
  _EnterNumberState createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.blueGrey,),
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey,
              Colors.grey
            ]
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/ 4,),
            Text('Enter Package Code',textAlign:TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
//              color: Colors.white
            ),),
            SizedBox(height: 15,),
            TextField(
                onChanged: (value) => code = value,
                decoration: InputDecoration(
//                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    hintText: 'Package Code',
                    fillColor: Colors.deepPurpleAccent
                )
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Track!',
              callback: (){
                Navigator.pop(context);
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home()
                )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
