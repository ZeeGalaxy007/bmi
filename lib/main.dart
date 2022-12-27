// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = " ";
  var bgColor = Colors.cyan.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Body Mass Index'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 512,
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Weight (in KGs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height (in Feets)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your height (in Inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //BMI Calculate

                        var iWt = int.parse(wt); //convt to integer
                        var iFt = int.parse(ft); //convt to integer
                        var iInch = int.parse(inch); //convt to integer

                        var tInch = (iFt * 12) + iInch; //feet to inch
                        var tCm = tInch * 2.54; //inch to cm
                        var tM = tCm / 100; //cm to meter
                        var bmi = iWt / (tM * tM);

                        var msg = " ";

                        if (bmi > 15) {
                          msg = " You're over weight!!";
                          bgColor = Colors.red.shade300;
                        } else {
                          if (bmi < 10) {
                            msg = "You're UnderWeight!!";
                            bgColor = Colors.orange.shade300;
                          } else {
                            msg = "You're Healthy!!";
                            bgColor = Colors.green.shade300;
                          }
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks!!";
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
