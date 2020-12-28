import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String phoneNo;
  @HiveField(3)
  final String email;

  Contact({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNo,
    this.email,
  });
}
