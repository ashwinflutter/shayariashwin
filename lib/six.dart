import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class six extends StatefulWidget {
  @override
  _sixState createState() => _sixState();
}

class _sixState extends State<six> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);                     //  option file color check pattern

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("refresh"),
      ),
      backgroundColor: Colors.amber.shade100,
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: currentColor,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: (value) {
                        setState(() {
                          currentColor = value;
                        });
                      },
                    );
                  },
                );
              },
              child: Text("pick"))
        ],
      ),
    );
  }
}
