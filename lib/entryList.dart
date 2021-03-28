import 'package:flutter/foundation.dart';

class Entry {
  final String id;
  final String entryName;
  final double cost;
  final DateTime date;

  Entry(
      {@required this.id,
      @required this.entryName,
      @required this.cost,
      @required this.date});
}
