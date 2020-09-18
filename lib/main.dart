import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tira 2 dados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _dice_1 = 1;
  int _dice_2 = 1;

  void _rollDices() {
    setState(() {
      var rng = new Random();
      _dice_1 = 1 + rng.nextInt(6);
      _dice_2 = 1 + rng.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dado 1',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Image.asset('images/dice_face_' + '$_dice_1' + '.png')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dado 2',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Image.asset('images/dice_face_' + '$_dice_2' + '.png')
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rollDices,
        tooltip: 'Roll Dices',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
