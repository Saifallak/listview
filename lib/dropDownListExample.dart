import 'package:flutter/material.dart';

class DropDownListExample extends StatefulWidget {
  String value;

  DropDownListExample(this.value);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState(value);
}

class _DropDownListExampleState extends State<DropDownListExample> {
  // TODO: Update 30 Jan
  // TODO: Your "value" for DropdownButton should be set to 'null' or or be one from the values list.
  // TODO: Means ,, the values here are 0 , 1 , 2 , 3 ... etc
  _DropDownListExampleState(this._mySelection);

  String _mySelection;
  List<Map> _myJson = [
    {"id": 0, "name": "selection1"},
    {"id": 1, "name": "some selection yaay"},
    {"id": 2, "name": "selection3"},
    {"id": 3, "name": "Test Practice"}
  ];

  @override
  void initState() {
    super.initState();

    //TODO: Let's make a count down so after screen init with 3sec we get more data ?
//    Future.delayed(const Duration(seconds: 1), () {
//      setState(() {
//        //this word from data base return
//        _mySelection = "0"; // TODO : THis Means select id 0 => selection1
//      });
//    });
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
              value: map["id"]
                  .toString(), // TODO :Your "value" for DropdownButton should be set to 'null' or or be one from the values list.
              // TODO: THis is the value ^^
              child: SizedBox(
                // TODO: this is a quick fix from : https://stackoverflow.com/a/50345779/8623062
                // TODO: He said ,, wrap your text in sized box and give it a width ,, hmm ,, 80% of screen is good i think
                // TODO: Another Sol.
                // TODO: You can also use a ConstrainedBox instead of a SizedBox if you want to be able to set min and max widths instead of having a fixed width.
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
