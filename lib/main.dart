import 'package:flutter/material.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DynamicControllers(),
    );
  }
}

class DynamicControllers extends StatefulWidget {

  @override
  _DynamicControllersState createState() => _DynamicControllersState();
}

class _DynamicControllersState extends State<DynamicControllers> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dynamic Controllers'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return new Container(
      child: new Text('Creating dynamic controllers on click on "Add" button'),
    );
  }
}
