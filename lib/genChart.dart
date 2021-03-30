import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './entryModel.dart';

class GenChart extends StatelessWidget {
  final List<Entry> addedEntries;
  GenChart(this.addedEntries);

  List<Map<String, Object>> get weeklyEntryValues {
    return List.generate(7, (days) {
      final weekDay = DateTime.now().subtract(Duration(days: days));
      double tCost = 0.0;
      for (var i = 0; i < addedEntries.length; i++) {
        if (addedEntries[i].date.day == weekDay.day &&
            addedEntries[i].date.month == weekDay.month &&
            addedEntries[i].date.year == weekDay.year) {
          tCost += addedEntries[i].cost;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'cost': tCost
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 8,
      child: Row(
        children: weeklyEntryValues.map((index) {
          return Text('${index['day']}: ${index['cost']}');
        }).toList(),
      ),
    );
  }
}
