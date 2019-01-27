import 'package:flutter/material.dart';

class BeautyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const BeautyCard({
    @required Key key,
    @required this.title,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              icon, // Given in Constructor
              color: Colors.white,
            ),
          ),
          title: Text(
            title, // Given in Constructor
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.linear_scale,
                color: Colors.yellowAccent,
              ),
              Text(
                " Intermediate",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
