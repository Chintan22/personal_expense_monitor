import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './genBars.dart';
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
    }).reversed.toList();
  }

  double get totExpense {
    return weeklyEntryValues.fold(0.0, (previousValue, element) {
      return previousValue + element['cost'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weeklyEntryValues.map((index) {
            return Flexible(
              fit: FlexFit.tight,
              child: GenBar(
                  index['day'],
                  index['cost'],
                  totExpense == 0.0
                      ? 0.0
                      : (index['cost'] as double) / totExpense),
            );
          }).toList(),
        ),
      ),
    );
  }
}
