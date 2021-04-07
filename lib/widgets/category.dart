import 'package:flutter/material.dart';

final double _rowHeight = 100;
final BorderRadius _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.deepOrange[200],
          splashColor: Colors.deepOrange[200],
          onTap: () {
            print("I was Tapped");
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.cake,
                    size: 30,
                  ),
                ),
                Center(
                    child: Text(
                  "Cake",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
