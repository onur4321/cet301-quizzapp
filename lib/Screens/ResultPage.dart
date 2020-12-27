import 'package:flutter/material.dart';

import 'HomePage.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Sonuç '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset(
                'assets/fail.png',
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Tebrikler Puanınız',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '${widget.score}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('HomePage'),
            )
          ],
        ),
      ),
    );
  }
}
