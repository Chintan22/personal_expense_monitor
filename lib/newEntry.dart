import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEntry extends StatefulWidget {
  final Function passNewEntry;
  NewEntry(this.passNewEntry);

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final entryInput = TextEditingController();
  final costInput = TextEditingController();
  DateTime _datePicked;

  void passEntry() {
    if (costInput.text.isEmpty) {
      return;
    }
    final createEntry = entryInput.text;
    final createCost = double.parse(costInput.text);
    if (createEntry.isEmpty || createCost <= 0 || _datePicked == null) {
      return;
    }

    widget.passNewEntry(entryInput, costInput, _datePicked);
    Navigator.of(context).pop();
  }

  void _displayDateP() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((selDate) {
      if (selDate == null) {
        return;
      }
      setState(() {
        _datePicked == selDate;
      });
    });
    print('...');
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
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_datePicked == null
                        ? 'No Date Selected!'
                        : 'Selected Date: ${DateFormat.yMd().format(_datePicked)}'),
                  ),
                  FlatButton(
                    onPressed: _displayDateP,
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: passEntry,
              child: Text('ADD ENTRY'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
