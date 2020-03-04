import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: DateTimePicker(),
    );
  }
}

class DateTimePicker extends StatefulWidget {

  @override
  DateTimeState createState() => DateTimeState();
}

class DateTimeState extends State<DateTimePicker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            FlatButton(
              onPressed: () async {
                var d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2018,1,1), lastDate: DateTime.now());
                var t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                d = DateTime(d.year, d.month, d.day, t.hour, t.minute);
                print(d);
                print(( d.millisecondsSinceEpoch / 1000).toInt());
                exit(0);
              },
              child: Icon(Icons.add),
                  )
          ],
        ),
      ),
    );
  }
}
