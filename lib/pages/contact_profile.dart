import 'package:contact_app/models/contacts.dart';
import 'package:contact_app/pages/edit.dart';
import 'package:contact_app/providers/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactProfile extends StatelessWidget {
  final String userID;
  final String name;
  ContactProfile({Key key, @required this.userID, @required this.name});
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Edit()),
          );
        },
        child: const Icon(Icons.edit_outlined),
        backgroundColor: Colors.cyanAccent[700],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: () {}, child: Icon(Icons.delete_rounded)),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.cyanAccent[700],
        title: Text(
          'Contact Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: contactProvider.fetchContactData(userID),
            builder: (BuildContext context, AsyncSnapshot<Contacts> snapshot) {
              if (snapshot.hasData) {
                var contact = snapshot.data;
                return Column(
                  children: [
                    Container(
                      height: screenHeight / 3.2,
                      width: double.infinity,
                      color: Colors.cyanAccent[700],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: screenWidth / 2.8,
                            height: screenHeight / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('${contact.picture}'),
                                fit: BoxFit.fitWidth,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            '${contact.firstName}' ' ${contact.lastName}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${contact.email}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${contact.phone}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wc_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                height: 30.0,
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${contact.gender}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                height: 30.0,
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${contact.phone}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.date_range_outlined),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                height: 30.0,
                                width: screenWidth / 1.2,
                                child: Text(
                                  '${contact.dateOfBirth}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  height: screenHeight / 1.5,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
