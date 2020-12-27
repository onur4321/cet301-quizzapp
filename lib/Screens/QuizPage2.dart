import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Service/QuizManager.dart';
import 'HomePage.dart';

QuizLogic quizLogic = new QuizLogic();

class QuizPage2 extends StatefulWidget {
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  final List<Widget> scoreKeeper = [];

  int totalCorrect = 0;
  int totalQuestions = 0;

  void checkAnswer(bool value) {
    if (quizLogic.getAnswer() == value) {
      print('right answer');
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      totalCorrect++;
    } else {
      print('wrong answer');
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    totalQuestions++;
    if (quizLogic.isFinished() == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      quizLogic.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.blue[200],
                  ),
                  child: Center(
                    child: Text(
                      quizLogic.getQuestion2(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      textColor: Colors.white,
                      color: Colors.greenAccent[400],
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          checkAnswer(true);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      textColor: Colors.white,
                      color: Colors.redAccent[400],
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          checkAnswer(false);
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }
}
