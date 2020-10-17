import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ConnectScreen extends StatefulWidget {
  
  final String message;
  ConnectScreen({this.message});
  
  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose device to send file/msg.."),
      ),
      body: Center(
        child: Text(widget.message)
      ),
    );
  }
}
