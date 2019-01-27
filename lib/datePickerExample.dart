import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  @override
  DatePickerExampleState createState() => DatePickerExampleState();
}

class DatePickerExampleState extends State<DatePickerExample> {
  String dbDate;
  String dbTime;

  @override
  void initState() {
    super.initState();

    //TODO: Let's Assume we Got this Date From DB;
    dbDate = "20190129";
    dbTime = "20:10";
    // TODO: Check accepts Date format from : https://stackoverflow.com/a/51063116/8623062
  }

  //TODO : Handle on Cancel Picking .. throws Exception
  _selectNewDate(BuildContext context) async {
    var x = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(dbDate), // TODO : Here put Date from DB
        firstDate: DateTime(1997), // TODO: Start Date
        lastDate: DateTime(2020)); // TODO: End Date

    setState(() {
      dbDate = x.toString();
      // TODO: Check other "To" functions to store the date in preferred format
    });
  }

  //TODO : Handle on Cancel Picking .. throws Exception
  _selectNewTime(BuildContext context) async {
//    print(dbTime.substring(0, 2));
//    print(dbTime.substring(1, 4));
    var x = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(dbTime.substring(0, 2)),
            minute: int.parse(dbTime.substring(3, 5))));

    setState(() {
      dbTime = x.hour.toString() + ":" + x.minute.toString();
      // TODO: Check other "To" functions to store the date in preferred format
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker Example"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () => _selectNewDate(context),
            child: Text(
              "Current Selected Date is : $dbDate \n\n"
                  " Click On Text To Change Date",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          InkWell(
            onTap: () => _selectNewTime(context),
            child: Text(
              "Current Selected TIME is : $dbTime \n\n"
                  " Click On Text To Change Time",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
