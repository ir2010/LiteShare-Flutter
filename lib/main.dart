import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiteShare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Get Set Share...'),
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
  static const platform = const MethodChannel('com.cnnfe.liteshare/liteshare');
  Future<void> contactJava(String methodName) async
  {
    String value;
    try{
      value = await platform.invokeMethod(methodName);
    }catch(e)
    {
      print(e);
      print("kuch");
    }
    print("v="+value);
  }

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
                contactJava("send");
              },
            ),
            IconButton(
              icon: Icon(Icons.receipt),
              color: Color(kcolorPrimary),
              tooltip: "Receive",
              onPressed: ()
              {
                contactJava("receive");
              },
            )
          ],
        ),

      )
    );
  }
}
