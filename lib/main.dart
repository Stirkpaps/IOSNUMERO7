import 'package:flutter/material.dart';
import 'route_generator.dart';

void main() => runApp(BenitezApp());

class BenitezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruteo',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFDFFD8)),
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //fin de return
  } //fin widget
} //fin clase benitezapp

class PageOne extends StatelessWidget {
  String _params = "hola desde PAGINA1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 1 de Luis'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Pagina siguiente",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  } //fin de widget

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  } //fin para abrir la segunda pagina
} //clasepageone