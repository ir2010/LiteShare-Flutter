import 'package:flutter/services.dart';

const platform = const MethodChannel('com.cnnfe.liteshare/liteshare');
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