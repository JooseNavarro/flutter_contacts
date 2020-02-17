import 'package:contacts/pages/contact_page.dart';
import 'package:contacts/pages/profile_page.dart';
import 'package:flutter/material.dart';

final router = <String, WidgetBuilder> {
  '/': ( BuildContext context ) => ContactPage(),
  'profile': ( BuildContext context ) => ProfilePage()
};
