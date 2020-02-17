import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StateProfilePage();
  }
}

class _StateProfilePage extends State<ProfilePage> {

  @override
  Widget build( BuildContext context ) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text( " ${args['name']} ")),
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            _imageProfile( args ),
            Divider(),
            Text(" Gender: ${args['user']['gender']} - City ${args['user']['location']['city']}"),
            Divider(),
            Text(" ${args['description']} "),
            Divider(),
            Text(" ${args['description']} ")
          ],
        )
      ],),
    );
  }

  Widget _imageProfile( Map<String, dynamic> args ) {
    return Card(
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage("${args['user']['picture']['large']}"),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(seconds: 1),
              height: 300,
              fit: BoxFit.cover,
            )
          ],
        )
    );
  }
}