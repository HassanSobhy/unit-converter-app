import 'package:flutter/material.dart';
import 'package:unit_converter/screens/converter_screen.dart';

final double _rowHeight = 75;
final BorderRadius _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final IconData icon;

  const Category({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange.shade50,
        child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: Colors.deepOrange[200],
            splashColor: Colors.deepOrange[200],
            onTap: () {
              _navigateToConverter(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      icon,
                      size: 30,
                    ),
                  ),
                  Center(
                      child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _navigateToConverter(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ConverterScreen(name: this.name ,);
    }));
  }
}
