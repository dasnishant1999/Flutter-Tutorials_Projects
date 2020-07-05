import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Interest Calculator",
    debugShowCheckedModeBanner: false,
    home: SIform(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigoAccent,
        accentColor: Colors.amber),
  ));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIform();
  }
}

class _SIform extends State<SIform> {
  var _currencies = ["ruppes", "dollars", "yen"];
  var _currentItemSelected = "ruppes";
  var displayresult = "";
  var _formkey = GlobalKey<FormState>();
  TextEditingController principle = TextEditingController();
  TextEditingController roi = TextEditingController();
  TextEditingController term = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("INTEREST"),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) return "Please enter some value";
                    },
                    controller: principle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Principle",
                        hintText: "for eg: 1000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: roi,
                    decoration: InputDecoration(
                        labelText: "Rate of Interest",
                        hintText: "for eg: 1000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: term,
                            decoration: InputDecoration(
                                labelText: "Term",
                                hintText: "only integer",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          )),
                      Container(width: 20.0),
                      Expanded(
                          child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _currentItemSelected,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this._currentItemSelected = newValueSelected;
                              });
                            },
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                            child: Text(
                              "Calculate",
                              textScaleFactor: 1.5,
                            ),
                            color: Colors.deepPurple,
                            onPressed: () {
                              setState(() {
                                if (_formkey.currentState.validate())
                                  this.displayresult = calculate();
                              });
                            },
                          )),
                      Container(
                        width: 20.0,
                      ),
                      Expanded(
                          child: RaisedButton(
                              child: Text(
                                "Reset",
                                textScaleFactor: 1.5,
                              ),
                              color: Colors.deepOrange,
                              onPressed: () {
                                setState(() {
                                  reset();
                                });
                              })),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    displayresult,
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  String calculate() {
    try {
      double princ = double.parse(principle.text);
      double ro = double.parse(roi.text);
      double te = double.parse(term.text);
      double result = princ + (princ * ro * te) / 100;
      return "After $te years investment will be $result $_currentItemSelected";
    }
    catch(FormatException){
      return "Please enter valid numbers only";
    }
  }

  void reset() {
    principle.text = "";
    roi.text = "";
    term.text = "";
    displayresult = "";
    _currentItemSelected = _currencies[0];
  }
}
