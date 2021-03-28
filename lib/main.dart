import 'package:flutter/material.dart';
import './entryList.dart';

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
  final List<Entry> entries = [
    Entry(
        id: 'et1', entryName: 'First Entry', cost: 10.00, date: DateTime.now()),
    Entry(
        id: 'et2', entryName: 'Second Entry', cost: 20.20, date: DateTime.now())
  ];

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
            Column(
              children: entries.map((et) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(et.cost.toString()),
                      ),
                      Column(
                        children: <Widget>[
                          Text(et.entryName),
                          Text(et.date.toString())
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
