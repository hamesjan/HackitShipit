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
      body: Center(child:Container(
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
                    title: Text('Are You Sure You Want to Activate Emergency?'),
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
                            child: Icon(Icons.volume_up),
                            color: Colors.redAccent,
                            elevation: 12,
                            onPressed: () async{
                              launch("tel://3107559222}");
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
    ),
    );
  }
}
