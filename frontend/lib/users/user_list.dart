// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, unused_import, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';
import '../routes/app_routes.dart';
import 'users.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<Usuario>> usuarios;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    usuarios = pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
            color: Colors.blue,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Usuario>>(
          future: usuarios,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Usuario usuario = snapshot.data![index];
                  return ListTile(
                    title: Text(usuario.nome!),
                    subtitle: Text(usuario.email!),
                    trailing: Container(
                      width: 80,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.USER_FORM,
                              );
                            },
                            color: Colors.amber,
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/usuarios');
                            },
                            color: Colors.red,
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<Usuario>> pegarUsuario() async {
    var url = Uri.parse('http://localhost:5550/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List listaUsuarios = json.decode(response.body);
      return listaUsuarios.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Não foi possível carregar os usuários.');
    }
  }
}
