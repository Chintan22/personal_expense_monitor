import 'package:flutter/material.dart';

class GenBar extends StatelessWidget {
  final String dLabel;
  final double expCost;
  final double expPerofT;
  GenBar(this.dLabel, this.expCost, this.expPerofT);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (contex, constraint) {
      return Column(
        children: <Widget>[
          Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text('\$${expCost.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height: constraint.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: expPerofT,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text(dLabel)))
        ],
      );
    });
  }
}
