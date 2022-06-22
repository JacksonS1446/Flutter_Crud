// ignore_for_file: unused_import, implementation_imports, unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ola_mundo/models/usuario.dart';
import 'package:ola_mundo/provider/user.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            color: Colors.green,
            onPressed: () {
              final isValid = _form.currentState?.validate();
              _form.currentState?.save();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Nome inválido';
                  }
                  if(value.trim().length < 3){
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                onSaved: (value) => _formData['senha'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
