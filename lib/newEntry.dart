import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './custom_Button.dart';

class NewEntry extends StatefulWidget {
  final Function passNewEntry;
  NewEntry(this.passNewEntry);

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final _entryInput = TextEditingController();
  final _costInput = TextEditingController();
  DateTime _choosenDate;

  void _passEntry() {
    if (_costInput.text.isEmpty) {
      return;
    }
    final createEntry = _entryInput.text;
    final createCost = double.parse(_costInput.text);
    if (createEntry.isEmpty || createCost <= 0 || _choosenDate == null) {
      return;
    }

    widget.passNewEntry(createEntry, createCost, _choosenDate);
    Navigator.of(context).pop();
  }

  void _displayDateP() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((seltdDate) {
      if (seltdDate == null) {
        return;
      }
      setState(() {
        _choosenDate = seltdDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Add Title'),
                controller: _entryInput,
                onSubmitted: (_) => _passEntry(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Add Amount'),
                controller: _costInput,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _passEntry(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_choosenDate == null
                          ? 'No Date Selected!'
                          : 'Selected Date: ${DateFormat.yMd().format(_choosenDate)}'),
                    ),
                    CustomButton('Select Date', _displayDateP)
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _passEntry,
                child: Text('ADD ENTRY'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
