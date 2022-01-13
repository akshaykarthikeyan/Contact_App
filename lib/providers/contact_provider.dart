import 'dart:convert' as convert;

import 'package:contact_app/models/contacts.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ContactProvider extends ChangeNotifier {
  String apiUrl = 'dummyapi.io';
  List _contacts;
  get contacts => _contacts;

  void setPlacementList(contactsList) {
    _contacts = contactsList;
  }

  Future<List<Contacts>> fetchData() async {
    if (_contacts != null) {
      return _contacts;
    } else {
      var url = Uri.https(apiUrl, '/data/api/user', {'q': '{http}'});
      final response = await http.get(
        url,
        headers: {'app-id': '609e0aa28e21bc3f2ddbdc28'},
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body)['data'];
        List<Contacts> contacts = jsonResponse
            .map(
              (dynamic item) => Contacts.fromJson(item),
            )
            .toList();
        return contacts;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }

  Future<Contacts> fetchContactData(String userId) async {
    var url = Uri.https(apiUrl, '/data/api/user/$userId', {'q': '{http}'});
    final response = await http.get(
      url,
      headers: {'app-id': '609e0aa28e21bc3f2ddbdc28'},
    );
    if (response.statusCode == 200) {
      print(convert.jsonDecode(response.body));
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return Contacts.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
