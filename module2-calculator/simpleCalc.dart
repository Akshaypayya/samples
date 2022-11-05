import 'package:flutter/material.dart';

class SimpleCalc extends StatefulWidget {
  @override
  State createState() => SimpleCalcState();
}

class SimpleCalcState extends State<SimpleCalc> {
  var num1 = 0, num2 = 0, ans = 0;

  final TextEditingController firstNumber = TextEditingController(text: "");
  final TextEditingController secondNumber = TextEditingController(text: "");

  bool checkNumbers() {
    try {
      num1 = int.parse(firstNumber.text);
      num2 = int.parse(secondNumber.text);
      return true;
    } on FormatException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Invalid Number"),
        ),
      );

      setState(() {
        ans = 0;
      });
      return false;
    }
  }

  void add() {
    if (checkNumbers())
      setState(() {
        ans = num1 + num2;
      });
  }

  void subtract() {
    if (checkNumbers())
      setState(() {
        ans = num1 - num2;
      });
  }

  void multiply() {
    if (checkNumbers())
      setState(() {
        ans = num1 * num2;
      });
  }

  void division() {
    if (checkNumbers())
      setState(() {
        try {
          ans = num1 ~/ num2;
        } on IntegerDivisionByZeroException catch (_) {
          ans = 0;
        }
      });
  }

  void doClear() {
    setState(() {
      firstNumber.text = "";
      secondNumber.text = "";
      ans = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter first number',
              ),
              controller: firstNumber,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter second number',
              ),
              controller: secondNumber,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Output : $ans",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: add,
                ),
                ElevatedButton(
                  child: Text(
                    "Subtract",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: subtract,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                    "Multiply",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: multiply,
                ),
                ElevatedButton(
                  child: Text(
                    "Divide",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: division,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.greenAccent,
                  onPressed: doClear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}