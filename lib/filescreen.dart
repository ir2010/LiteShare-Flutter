import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'connectscreen.dart';

class FileScreen extends StatefulWidget {
  FileScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  String message;

  void sendMessage(String msg) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConnectScreen(
                  message: message,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: "Enter a message..",
                  ),
                  onChanged: (text) {
                    message = text;
                  },
                ),
              ),
              Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(Icons.send),
                    color: Color(kcolorPrimary),
                    onPressed: () {
                      sendMessage(message);
                    },
                  ),
              )
            ],
          ),
        ));
  }
}
