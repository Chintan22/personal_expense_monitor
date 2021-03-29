import 'package:flutter/material.dart';
import './userEntries.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Monitor',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final entryInput = TextEditingController();
  final costInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense Monitor'),
        ),
        body: Column(
          children: [
            Card(
              child: Text('Top for chart'),
            ),
            UserEntries(),
          ],
        ));
  }
}
