import 'package:flutter/material.dart';
import 'package:contrast_checker/contrast_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// create a method for calling the library function
  bool isContrast() {
    var cc = ContrastChecker();
    return cc.contrastCheck(18.6, Colors.red, Colors.grey, WCAG.AA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.grey,
              child: Text(
                'Can you see this: ${isContrast()}',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.6,
                 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
