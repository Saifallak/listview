import 'package:flutter/material.dart';
import 'package:listview/datePickerExample.dart';
import 'package:listview/dropDownListExample.dart';
import 'package:listview/listViewExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NavigateToExamples(),
      routes: <String, WidgetBuilder>{
        '/list': (BuildContext context) => ListViewExample(),
        '/date': (BuildContext context) => DatePickerExample(),
        '/drop': (BuildContext context) => DropDownListExample("2"),
      },
    );
  }
}

class NavigateToExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/list'),
              child: Text("ListViewExample"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/date'),
              child: Text("DatePickerExample"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/drop'),
              child: Text("DropDownListExample"),
            ),
          ],
        ),
      ),
    );
  }
}
