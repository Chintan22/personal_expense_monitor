import 'package:flutter/material.dart';
import './entryList.dart';
import './newEntry.dart';
import './entryModel.dart';
import './genChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Monitor',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Entry> _entries = [];
  List<Entry> get _addedEntries {
    return _entries.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GenChart(_addedEntries),
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
