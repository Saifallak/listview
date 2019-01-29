import 'dart:async';

import 'package:flutter/material.dart';

class DropDownListExample extends StatefulWidget {
  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  String _mySelection;
  List<Map> _myJson = [
    // TODO: Remove Comments if you want initial Data
//    {"id": 0, "name": "<>"},
//    {"id": 1, "name": "Test Practice"}
  ];

  @override
  void initState() {
    super.initState();

    //TODO: Let's make a count down so after screen init with 3sec we get more data ?
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _myJson
          ..add({"id": 2, "name": "hel123ld2"})
          ..add({"id": 3, "name": "he1232"})
          ..add({"id": 4, "name": "hel12"})
          ..add({
            "id": 5,
            "name":
                "heaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaa22222"
          });
      });
    });
  }

// TODO : STill bug in flutter https://github.com/flutter/flutter/issues/9211
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down Example"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      ),
      body: Center(
        child: DropdownButton<String>(
          isDense: true,
          hint: Text("Select"),
          value: _mySelection,
          onChanged: (String Value) {
            setState(() {
              _mySelection = Value;
            });
          },
          items: _myJson.map((Map map) {
            return DropdownMenuItem<String>(
              value: map["id"].toString(),
              child: SizedBox(
                // TODO: this is a quick fix from : https://stackoverflow.com/a/50345779/8623062
                // TODO: He said ,, wrap your text in sized box and give it a width ,, hmm ,, 80% of screen is good i think
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  map["name"],
                  // TODO: This isn't required but better .. shows ... at the end of long long text so it doesn't be ugly
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
