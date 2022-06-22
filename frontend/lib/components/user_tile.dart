// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_null_comparison, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../provider/user.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile(this.user);

  @override
  ListTile build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        // ignore: prefer_const_constructors
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              color: Colors.orange,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      title: Text('Excluir Usuário'),
                      content: Text('Está certo disso?'),
                      actions: <Widget>[
                        // ignore: deprecated_member_use
                        FloatingActionButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // ignore: deprecated_member_use
                        FloatingActionButton(
                          child: Text('Sim'),
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],),
                );
                Provider.of<Users>(context, listen: false).remove(user);
              },
              color: Colors.red,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}