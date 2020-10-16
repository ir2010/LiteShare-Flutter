import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ConnectScreen extends StatefulWidget {
  //ConnectScreen({Key key, this.title}) : super(key: key);
  ConnectScreen({this.message});
  String message;
  String title;

  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ));
  }
}
