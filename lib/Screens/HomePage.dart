import 'package:cetquiz_app/Screens/QuizPage.dart';
import 'package:cetquiz_app/Screens/QuizPage2.dart';
import 'package:flutter/material.dart';

void gotoQuizPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => QuizPage()),
  );
}

void gotoQuizPage2(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => QuizPage2()),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cet Quiz')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                'Merhaba, Sınava Hoşgeldiniz.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            onPressed: () {
              gotoQuizPage(context);
            },
            child: Text('Multiple Choice'),
          ),
          RaisedButton(
            onPressed: () {
              gotoQuizPage2(context);
            },
            child: Text('True False'),
          )
        ],
      ),
    );
  }
}
