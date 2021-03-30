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
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            '\$${entries[indx].cost.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            entries[indx].entryName,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMd()
                                .add_jm()
                                .format(entries[indx].date),
                            style:
                                TextStyle(fontSize: 14, color: Colors.indigo),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: entries.length,
            ),
    );
  }
}
