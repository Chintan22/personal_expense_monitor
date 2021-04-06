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
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(button: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
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

  void _createNewEntry(String entryName, double cost, DateTime selDate) {
    final newEt = Entry(
        id: DateTime.now().toString(),
        entryName: entryName,
        cost: cost,
        date: selDate);

    setState(() {
      _entries.add(newEt);
    });
  }

  void _btncreateEntry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
            onTap: () {},
            child: NewEntry(_createNewEntry),
            behavior: HitTestBehavior.opaque);
      },
    );
  }

  void _deleteEntry(String id) {
    setState(() {
      _entries.removeWhere((et) => et.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expense Monitor'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add), onPressed: () => _btncreateEntry(context))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.3,
              child: GenChart(_addedEntries)),
          Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.7,
              child: EntryList(_entries, _deleteEntry)),
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
