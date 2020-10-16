import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'filescreen.dart';
import 'connectscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiteShare',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/file': (context) => FileScreen(),
        '/connect': (context) => ConnectScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.send),
              color: Color(kcolorPrimary),
              tooltip: "Send",
              onPressed: ()
              {
                Navigator.pushNamed(context, '/file');
              },
            ),
            IconButton(
              icon: Icon(Icons.receipt),
              color: Color(kcolorPrimary),
              tooltip: "Receive",
              onPressed: ()
              {
                //contactJava("receive");
              },
            )
          ],
        ),

      )
    );
  }
}
