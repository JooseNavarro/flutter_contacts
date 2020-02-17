import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class UserProvider {

  Future<List<dynamic>> get getUsers async{
    final res =  await rootBundle.loadString('lib/data/users.json');
    Map serializer = json.decode( res );
    return serializer['results'];
  }
} 