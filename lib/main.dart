import 'package:flutter/material.dart';
import './entryList.dart';
import 'package:intl/intl.dart';

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
            Card(
              elevation: 7,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Add Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Add Amount'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Add Entry !'),
                      textColor: Colors.blue.shade600,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: entries.map((et) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('\$${et.cost}',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 22,
                                fontWeight: FontWeight.w700)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            et.entryName,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMd().add_jm().format(et.date),
                            style:
                                TextStyle(fontSize: 14, color: Colors.indigo),
                          )
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
