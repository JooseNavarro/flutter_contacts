import 'package:contacts/providers/user_provider.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return StateListsPage();
  }
}

class StateListsPage extends State<ListPage> {

  @override
  Widget build( context ) {
    return _listUsers();
  }

  Widget _listUsers() {
    return FutureBuilder(
      future: UserProvider().getUsers,
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView( children: _users( snapshot.data ) );
      }
    );
  }

  List<Widget> _users( List<dynamic> data ) {
    final List<Widget> userTemp = [];
    data.forEach( ( user ) {
      userTemp.add( ListTile(
        title: Text( " ${user['name']['first']} ${user['name']['last']} " ),
        subtitle: Text( " ${user['email']} " ),
        trailing: Icon( Icons.arrow_right ),
        leading: Image(
            image: NetworkImage( "${user['picture']['thumbnail']}" )
        ),
        onTap: ()=> Navigator.pushNamed(context, 'profile', arguments: {
          'name': " ${user['name']['first']} ${user['name']['last']} ",
          'description': lorem,
          'user': user
        }),
      ) );
    });
    return userTemp;
  }

   String get lorem {
    return 'Lorem Ipsum es simplemente el'
        ' texto de relleno de las imprentas y archivos de texto.'
        ' Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,'
        ' cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos'
        ' y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien'
        ' ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original.'
        ' Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem'
        ' Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de'
        ' Lorem Ipsum.';
  }
}