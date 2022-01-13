import 'package:contact_app/models/contacts.dart';
import 'package:contact_app/pages/add.dart';
import 'package:contact_app/pages/contact_profile.dart';
import 'package:contact_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.cyanAccent[700],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {},
            );
          },
        ),
        backgroundColor: Colors.cyanAccent[700],
        elevation: 10.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'CONTACTS',
          style: TextStyle(
            fontSize: 17.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: contactProvider.fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contacts>> snapshot) {
            if (snapshot.hasData) {
              List<Contacts> contacts = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: contacts.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactProfile(
                                      userID: '${item.id}',
                                      name:
                                          '${item.firstName} ${item.lastName}',
                                    )));
                      },
                      child: Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                    child: Image.network(
                                  '${item.picture}',
                                  width: screenWidth / 4,
                                )),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 10.0,
                                          ),
                                          Text(
                                            '${item.firstName}'
                                            ' ${item.lastName}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth / 22.0,
                                              letterSpacing: 2.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }).toList(),
                ),
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
    );
  }
}
