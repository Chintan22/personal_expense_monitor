import 'package:flutter/material.dart';
import './entryList.dart';
import './newEntry.dart';
import './entryModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Monitor',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.amber,
          appBarTheme: AppBarTheme(color: Colors.purple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Entry> _entries = [
    Entry(
        id: 'et1', entryName: 'First Entry', cost: 10.00, date: DateTime.now()),
    Entry(
        id: 'et2', entryName: 'Second Entry', cost: 20.20, date: DateTime.now())
  ];

  void _createNewEntry(String entryName, double cost) {
    final newEt = Entry(
        id: DateTime.now().toString(),
        entryName: entryName,
        cost: cost,
        date: DateTime.now());

    setState(() {
      _entries.add(newEt);
    });
  }

  void _btncreateEntry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(onTap: () {}, child: NewEntry(_createNewEntry));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense Monitor'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add), onPressed: () => _btncreateEntry(context))
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Text('Top for chart'),
          ),
          EntryList(_entries),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _btncreateEntry(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
