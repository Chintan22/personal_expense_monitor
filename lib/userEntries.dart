import 'package:flutter/material.dart';
import './entryList.dart';
import './newEntry.dart';
import './entryModel.dart';

class UserEntries extends StatefulWidget {
  @override
  _UserEntriesState createState() => _UserEntriesState();
}

class _UserEntriesState extends State<UserEntries> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewEntry(_createNewEntry), EntryList(_entries)],
    );
  }
}
