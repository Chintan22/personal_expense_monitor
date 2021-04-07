import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  bool _btnChart = false;
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
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: NewEntry(_createNewEntry)),
        );
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
    final mQuery = MediaQuery.of(context);
    final chkLandscapre = mQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expense Monitor'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    child: Icon(CupertinoIcons.add),
                    onTap: () => _btncreateEntry(context)),
              ],
            ),
          )
        : AppBar(
            title: Text('Personal Expense Monitor'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _btncreateEntry(context))
            ],
          );
    final etLstWidget = Container(
        height: (mQuery.size.height -
                mQuery.padding.top -
                appBar.preferredSize.height) *
            0.7,
        child: EntryList(_entries, _deleteEntry));
    final bodyScaf = SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (chkLandscapre)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enable Chart'),
              Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  value: _btnChart,
                  onChanged: (valC) {
                    setState(() {
                      _btnChart = valC;
                    });
                  })
            ],
          ),
        if (!chkLandscapre)
          Container(
              height: (mQuery.size.height -
                      mQuery.padding.top -
                      appBar.preferredSize.height) *
                  0.3,
              child: GenChart(_addedEntries)),
        if (!chkLandscapre) etLstWidget,
        if (chkLandscapre)
          _btnChart
              ? Container(
                  height: (mQuery.size.height -
                          mQuery.padding.top -
                          appBar.preferredSize.height) *
                      0.6,
                  child: GenChart(_addedEntries))
              : etLstWidget,
      ],
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodyScaf,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyScaf,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isAndroid
                ? FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _btncreateEntry(context),
                  )
                : Container());
  }
}
