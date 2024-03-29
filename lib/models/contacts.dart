import 'package:flutter/cupertino.dart';

class Contacts {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String picture;
  final String gender;
  final String phone;
  final String dateOfBirth;

  Contacts({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.picture,
    @required this.gender,
    @required this.phone,
    @required this.dateOfBirth,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
        id: json['id'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        picture: json['picture'] as String,
        gender: json['gender'] as String,
        phone: json['phone'] as String,
        dateOfBirth: json['dateOfBirth'] as String);
  }
}
