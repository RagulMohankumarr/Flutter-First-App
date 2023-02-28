import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final String screen_title;
  Country(this.screen_title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.screen_title),
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}
