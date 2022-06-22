// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(        
              currentAccountPicture: Image.network(
                  'https://cdn.pixabay.com/photo/2017/08/14/08/39/emoji-2639738_960_720.png'),
              accountName: Text('Jackson Silva'),
              accountEmail: Text('jackson@brisanet.com.br'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de início'),
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Usuários'),
              subtitle: Text('Usuários cadastrados'),
              onTap: () {
                Navigator.of(context).pushNamed('/usuarios');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text('Bem-Vindo(a)')),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          CustomSwitcher(),
        ],
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
