import 'package:flutter/material.dart';
import 'package:message_app/feature/view/message_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Message App',
        debugShowCheckedModeBanner: false,
        home: MessageView());
  }
}
