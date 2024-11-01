import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/clima.widget.dart';
import 'package:flutter_application_1/ej1.dart';
import 'package:flutter_application_1/ej2.dart';
import 'package:flutter_application_1/ej3.dart';
import 'package:flutter_application_1/ej4.dart';
import 'package:flutter_application_1/ej5.dart';
import 'package:flutter_application_1/ej6.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 208, 68)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = HolaMundoApp();
        break;
      case 3:
        page = PersonalizarTextos();
        break;
        case 4:
        page = TarjetaDePerfil();
        break;
        case 5:
        page = Contador();
        break;
        case 6:
        page = FormularioRegistro();
        break;
        case 7:
        page = BienvenidaNavigator();
        break;
        case 8:
        page = Clima();
        break;
      default:
        throw UnimplementedError('no widget selected for $selectedIndex');
    }

//navegacion
    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constrains.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.android),
                    label: Text('1 - Hola Mundo App'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.font_download),
                    label: Text('2 - Personalizar Textos'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('3 - Tarjeta de Perfil'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.calculate),
                    label: Text('4 - Contador'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_add),
                    label: Text('5 - Formulario Registro'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_add),
                    label: Text('5 - Navegacion'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.cloud),
                    label: Text('111 - Clima API'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) => {
                  setState(() {
                    selectedIndex = value;
                  })
                },
              ),
            ),
            Expanded(
                child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ))
          ],
        ),
      );
    });
  }
}

//main module
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(
              height:
                  20), //no renderiza por si solo, se usa para generar espacios vacios
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//favorites list
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Todavia no le diste like a nada'),
      );
    }

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('You have '
            '${appState.favorites.length} favorites:'),
      ),
      for (var f in appState.favorites)
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text(f.asLowerCase),
        ),
    ]);
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

//este es el metodo build de la BigCard
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
