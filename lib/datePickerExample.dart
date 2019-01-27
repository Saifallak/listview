import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  @override
  DatePickerExampleState createState() => DatePickerExampleState();
}

class DatePickerExampleState extends State<DatePickerExample> {
  String dbDate;

  @override
  void initState() {
    super.initState();

    //TODO: Let's Assume we Got this Date From DB;
    dbDate = "20190129";
    // TODO: Check accepts Date format from : https://stackoverflow.com/a/51063116/8623062
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: InkWell(
            onTap: () => _selectNewDate(context),
            child: Text(
              "Current Selected Date is : $dbDate \n\n"
                  " Click On Text To Change Date",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
