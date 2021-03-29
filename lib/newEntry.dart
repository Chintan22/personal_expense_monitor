import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  final Function passNewEntry;
  NewEntry(this.passNewEntry);

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final entryInput = TextEditingController();

  final costInput = TextEditingController();

  void passEntry() {
    final createEntry = entryInput.text;
    final createCost = double.parse(costInput.text);
    if (createEntry.isEmpty || createCost <= 0) {
      return;
    }

    widget.passNewEntry(entryInput.text, double.parse(costInput.text));
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => passEntry(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Add Amount'),
              controller: costInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => passEntry(),
            ),
            FlatButton(
              onPressed: passEntry,
              child: Text('Add Entry !'),
              textColor: Colors.blue.shade600,
            )
          ],
        ),
      ),
    );
  }
}
