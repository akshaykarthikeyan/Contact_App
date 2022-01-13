import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent[700],
        title: Text(
          'Edit Contact',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
