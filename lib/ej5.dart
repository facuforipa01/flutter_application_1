import 'package:flutter/material.dart';

class FormularioRegistro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? nombre;
  String? correo;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nombre = value;
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    correo = value;
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  }),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gracias por registrarse')));
                  }
                },
                child: Text('Registrarme'),
              ),
            ],
          ),
        ));
  }
}

/** 

import 'package:provider/provider.dart';

class Persona {
  String nombre;
  String correo;
  String password;

  Persona(this.nombre, this.correo, this.password);
}

class PersonaManager {
  List<Persona> personas = [];

  void agregarPersona(Persona persona) {
    personas.add(persona);
  }
}

class MyAppState extends ChangeNotifier {
  var current = {'nombre': 'facu', 'correo': 'folatelli', 'password': '123456'};

  var contacts = <Persona>[];

  void agregar() {
    contacts.add(current as Persona);
    notifyListeners();
  }
}

//favorites list
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.contacts.isEmpty) {
      return Center(
        child: Text('Todavia no tenes contactos'),
      );
    }

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('You have '
            '${appState.contacts.length} favorites:'),
      ),
      for (var f in appState.contacts)
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text(f.nombre),
        ),
    ]);
  }
}
*/