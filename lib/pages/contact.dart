import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Contact: ', style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('John Smith', style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ))
                  ],
                ),
                Divider(thickness: 3,),
                Text('310-333-4123')
              ],
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
            ),),
          SizedBox(height: 50,),
          Container(
            width: 300,
            height: 300,
            child: MaterialButton(
              shape: CircleBorder(side: BorderSide(width: 15, color: Colors.greenAccent, style: BorderStyle.solid)),
              child: Icon(Icons.phone, size: 50,),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () async{
                showDialog(context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Are You Sure You Want to Call?'),
                        actions: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Divider(),
                              RaisedButton(
                                child: Text('Cancel'),
                                elevation: 12,
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: 10,),
                              RaisedButton(
                                child: Icon(Icons.call),
                                color: Colors.greenAccent,
                                elevation: 12,
                                onPressed: () async{
                                  launch("tel://3103334123}");
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
