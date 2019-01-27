import 'package:flutter/material.dart';
import 'package:listview/BeatyCard.dart';

class ListViewExample extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListViewExample> {
  // Making Dummy Data
  List<BeautyCard> listOfCards = [];

  @override
  void initState() {
    super.initState();
    listOfCards
      ..add(
        BeautyCard(
          key: Key("uniqueCardID_12"),
          // TODO: Let's assume that all cards have unique key got from DB
          title: "Intro to Diving",
          icon: Icons.beach_access,
          onPressed: () => deleteListItem("uniqueCardID_12"),
        ),
      )
      ..add(
        BeautyCard(
          key: Key("uniqueCardID_1xxaa"),
          // TODO: Let's assume that all cards have unique key got from DB
          title: "Intro to Sleeping",
          icon: Icons.airline_seat_individual_suite,
          onPressed: () => deleteListItem("uniqueCardID_1xxaa"),
        ),
      )
      ..add(
        BeautyCard(
          key: Key("uniqueCardID_12311111"),
          // TODO: Let's assume that all cards have unique key got from DB
          title: "Intro into flutter",
          icon: Icons.flag,
          onPressed: () => deleteListItem("uniqueCardID_12311111"),
        ),
      )
      ..add(
        BeautyCard(
          key: Key("uniqueCardID_1xxxx11"),
          // TODO: Let's assume that all cards have unique key got from DB
          title: "Intro to android",
          icon: Icons.android,
          onPressed: () => deleteListItem("uniqueCardID_1xxxx11"),
        ),
      );
  }

  void deleteListItem(String keyOfItem) {
    listOfCards
        .forEach((f) => debugPrint("Key in Before List : ${f.key.toString()}"));
    debugPrint("Deleting Key : ${keyOfItem.toString()}");
    setState(() {
      listOfCards.removeWhere((itemCard) => itemCard.key == Key(keyOfItem));
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
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
