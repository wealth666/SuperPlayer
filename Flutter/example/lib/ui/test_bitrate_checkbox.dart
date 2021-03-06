import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

typedef void TestBitrateCheckboxFinishCallback(
    int value);

class TestBitrateCheckbox extends StatefulWidget {
  List supportedBitrates;
  int index;
  TestBitrateCheckboxFinishCallback callback;

  TestBitrateCheckbox(this.supportedBitrates, this.index, this.callback);

  @override
  _TestBitrateCheckboxState createState() => _TestBitrateCheckboxState();
}

class _TestBitrateCheckboxState extends State<TestBitrateCheckbox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () async {
          Navigator.of(context).pop();
          this.widget.callback(this.widget.index);
        },
        child: Container(
          color: Color.fromARGB(180, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.widget.supportedBitrates.map((e) {
              String s = e["index"].toString();
              return Row(
                children: [
                  Text("码率$s", style: TextStyle(color: Colors.white),),
                  Theme(data: ThemeData(
                    unselectedWidgetColor: Colors.white,),
                    child: Radio(
                      value: e["index"],
                      groupValue: this.widget.index,
                      onChanged: (value) {
                        setState(() {
                          this.widget.index = value;
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),));
  }
}
