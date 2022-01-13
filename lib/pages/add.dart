import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var addName = TextEditingController();
    var addPhone = TextEditingController();
    String inputName = '';
    String inputPhone = '';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent[700],
        title: Text(
          'Add Contact',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: screenWidth / 1,
                height: screenHeight / 4,
                color: Colors.cyanAccent[700],
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: addName,
                minLines: 1,
                onChanged: (text) {
                  inputName = text;
                },
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: ' name',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 23.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: addPhone,
                minLines: 1,
                onChanged: (text) {
                  inputPhone = text;
                },
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: ' phone',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 23.0),
              ),
              TextButton(
                onPressed: () {
                  print(inputName);
                  print(inputPhone);
                  addName.clear();
                  addPhone.clear();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.cyanAccent[700],
                ),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
