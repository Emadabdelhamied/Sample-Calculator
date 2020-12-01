import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  // _MyAppState createState() => _MyAppState();
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  double first_value = 0.0, second_value = 0.0, res = 0.0;
  String dropdownValue = 'Addition ';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sample Calculator",
          ),
          backgroundColor: Colors.black12,
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blueGrey),
                  underline: Container(
                    height: 2,
                    color: Colors.black12,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Addition ',
                    'Subtraction',
                    'Multiplication',
                    'Division ',
                    'Remainder'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 150,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'First number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onChanged: (value) {
                    setState(() {
                      first_value = double.parse(value);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Second number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onChanged: (value) {
                      setState(() {
                        second_value = double.parse(value);
                      });
                    }),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: RaisedButton(
                      child: Text(
                        '=',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.black45,
                      onPressed: () {
                        setState(() {
                          if (dropdownValue == 'Addition ') {
                            res = (first_value + second_value);
                          } else if (dropdownValue == 'Subtraction') {
                            res = (first_value - second_value);
                          } else if (dropdownValue == 'Division ') {
                            res = (first_value / second_value);
                          } else if (dropdownValue == 'Multiplication') {
                            res = (first_value * second_value);
                          } else {
                            res = (first_value % second_value);
                          }
                        });
                      }),
                ),
                Text(
                  'Result : $res',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                )
              ],
            )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
