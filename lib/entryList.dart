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
      child: ListView.builder(
        itemBuilder: (cntx, indx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('\$${entries[indx].cost}',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
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
                      DateFormat.yMd().add_jm().format(entries[indx].date),
                      style: TextStyle(fontSize: 14, color: Colors.indigo),
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
