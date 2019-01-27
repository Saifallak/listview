import 'package:flutter/material.dart';
import 'package:listview/BeatyCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Making Dummy Data
  List<BeautyCard> listOfCards = [];

  @override
  void initState() {
    super.initState();
    listOfCards
      ..add(
        BeautyCard(
          key: Key("cardIndex_${listOfCards.length}"),
          // TODO: Important Key to manage this card ,, delete/modify/...etc
          // TODO: make key pattern of whatever you want,, this is just basic one works for this situation
          // TODO: if using firebase ,, you make want to set the key to same as firebase item key?!
          // TODO: Try it
          title: "Intro to Diving",
          icon: Icons.beach_access,
        ),
      )
      ..add(
        BeautyCard(
          key: Key("cardIndex_${listOfCards.length}"),
          title: "Intro to Sleeping",
          icon: Icons.airline_seat_individual_suite,
        ),
      )
      ..add(
        BeautyCard(
          key: Key("cardIndex_${listOfCards.length}"),
          title: "Intro into flutter",
          icon: Icons.flag,
        ),
      )
      ..add(
        BeautyCard(
          key: Key("cardIndex_${listOfCards.length}"),
          title: "Intro to android",
          icon: Icons.android,
        ),
      );
  }

  void deleteListItem(Key keyOfItem) {
    listOfCards
        .forEach((f) => debugPrint("Key in Before List : ${f.key.toString()}"));
    debugPrint("Deleting Key : ${keyOfItem.toString()}");
    setState(() {
      listOfCards.removeWhere((itemCard) => itemCard.key == keyOfItem);
    });
    listOfCards.forEach(
        (f) => debugPrint("Key in List After Deleting : ${f.key.toString()}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View App"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      ),
      body: ListView.builder(
          itemCount: listOfCards.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: listOfCards[index],
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteListItem(listOfCards[index].key),
              ),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
