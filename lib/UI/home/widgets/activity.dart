import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String text;

  ActivityTile(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}