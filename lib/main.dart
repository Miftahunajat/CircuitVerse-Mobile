import 'package:circuitverse_mobile/RouteGenerator.dart';
import 'package:circuitverse_mobile/widgets/projectDetail.dart';
import 'package:circuitverse_mobile/widgets/projectsList.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CircuitVerse',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
