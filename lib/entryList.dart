import 'dart:ui';

import 'package:flutter/material.dart';
import './entryModel.dart';
import 'package:intl/intl.dart';

class EntryList extends StatelessWidget {
  final List<Entry> entries;
  EntryList(this.entries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: entries.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No entries recorded!',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 220,
                    child: Image.asset(
                      'assets/images/addItemIcon.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (cntx, indx) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${entries[indx].cost}',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    title: Text(
                      entries[indx].entryName,
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        DateFormat.yMd().add_jm().format(entries[indx].date),
                        style: TextStyle(fontSize: 14, color: Colors.indigo)),
                  ),
                );
              },
              itemCount: entries.length,
            ),
    );
  }
}
