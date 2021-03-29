import 'package:flutter/material.dart';
import './userEntries.dart';

class NewEntry extends StatelessWidget {
  final Function passNewEntry;
  NewEntry(this.passNewEntry);
  final entryInput = TextEditingController();
  final costInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Add Title'),
              controller: entryInput,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Add Amount'),
              controller: costInput,
            ),
            FlatButton(
              onPressed: () {
                passNewEntry(entryInput.text, double.parse(costInput.text));
              },
              child: Text('Add Entry !'),
              textColor: Colors.blue.shade600,
            )
          ],
        ),
      ),
    );
  }
}
