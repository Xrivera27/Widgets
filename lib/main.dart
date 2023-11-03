import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Personalizados',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.orange,
      ),
      home: DefaultTabController(
        length: 2,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets personalizados'),
        bottom: TabBar(
          tabs: <Widget>[

            Tab(text: 'Pagina 1'),

            Tab(text: 'Pagina 2'),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Confirmacion"),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: TabBarView(
        children: <Widget>[
          // Contenido de la Pestaña 1
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('BOTON 1'),
                    ),
                  );
                },
                child: Text('Botón 1'),
              ),
              GestureDetector(
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡Doble toque en botón 2!'),
                    ),
                  );
                },
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Botón 2'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡Desplazamiento!'),
                    ),
                  );
                },
                child: Text('Botón 3'),
              ),
            ],
          ),
          // Contenido de la Pestaña 2
          Center(
            child: Text('Contenido de la Pagina 2'),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple[200], // Morado Claro
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.orange[200],
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Text('Esta se realiza para la clase de programcion Movil impartida por el ingeniero Reynaldo Cruz'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Text('Aqui configuraremos la pagina a todo lo que vamos a hacer'),
      ),
    );
  }
}