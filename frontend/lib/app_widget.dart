// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';
import 'package:ola_mundo/login_page.dart';
import 'package:ola_mundo/routes/app_routes.dart';

import 'home_page.dart';
import 'users/user_list.dart';
import 'views/user_form.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.brown,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/usuarios': (context) => UserList(),
            AppRoutes.USER_FORM:(_) => UserForm(),
          },
        );
      },
      animation: AppController.instance,
    );
  }
}
