import 'package:flutter/material.dart';
import './entryModel.dart';
import 'package:intl/intl.dart';

class EntryList extends StatelessWidget {
  final List<Entry> entries;
  final Function deleteEt;
  EntryList(this.entries, this.deleteEt);

  @override
  Widget build(BuildContext context) {
    return entries.isEmpty
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
                height: 20,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/addItemIcon.png',
                    fit: BoxFit.cover,
                  ))
            ],
          )
        : ListView.builder(
            itemBuilder: (cntx, indx) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
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
                    DateFormat.yMMMd().format(entries[indx].date),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteEt(entries[indx].id)),
                ),
              );
            },
            itemCount: entries.length,
          );
  }
}
