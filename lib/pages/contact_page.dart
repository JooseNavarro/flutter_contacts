import 'package:contacts/pages/contact_list_page.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Contacts'))),
      body: ListPage()
    );
  }

 }

