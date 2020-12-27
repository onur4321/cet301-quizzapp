import 'dart:convert' as converter;

import 'package:http/http.dart' as http;

import 'Option.dart';
import 'Question.dart';

class QuizManager {
  QuizManager() {
    //print("before");
    //LoadQuestions(3);
    //  print("after");
  }
  Future<void> loadQuestions(int numberOfQuestions) async {
    var url =
        'https://opentdb.com/api.php?amount=$numberOfQuestions&category=18&difficulty=easy&type=multiple';
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //print(response.body);
      Map<String, dynamic> json = converter.jsonDecode(response.body);
      //print(json['response_code']);
      //print(json['results'][0]['question']);
      //print(json['results'][1]['question']);
      //print(json['results'][2]['question']);
      //for (var question in json['results']) {
      //  print(question['question']);
      //  print(question['correct_answer']);
      //  print(question['incorrect_answers']);
      //}
      for (int i = 0; i < json['results'].length; i++) {
        var questionJson = json['results'][i];
        print(questionJson['question']);
        print(questionJson['correct_answer']);
        print(questionJson['incorrect_answers']);
        List<Option> options = [];
        options.add(Option(questionJson['correct_answer'], 10));
        for (int j = 0; j < questionJson['incorrect_answers'].length; j++) {
          options.add(Option(questionJson['incorrect_answers'][j], 0));
        }
        Question question = Question(questionJson['question'], options);
        _questions.add(question);
      }

      _questions.shuffle();
      for (var question in _questions) {
        question.options.shuffle();
      }
    }
  }

  List<Question> _questions = [];
  int _score = 0;
  int currentQuestionId = 0;
  void nextQuestion(score) {
    if (currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
    print(currentQuestionId);
  }

  int getTotalScore() => _score;
  int getCurrentId() => currentQuestionId + 1;
  int totalQuestionNumber() => _questions.length;
  bool isFinished() {
    return currentQuestionId >= _questions.length;
    /* if(currentQuestionId >= _questions.length -1) {
      return true;
    } else {
      return false;
    }
    */
  }

  Question getCurrentQuestion() {
    print('getCurrentQuestion $currentQuestionId');
    if (currentQuestionId < _questions.length) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
}

class QuizLogic {
  int _questionNumber = 0;
  List<Question2> _questions = [
    Question2('Brasilia is the capital of Brazil', true),
    Question2('The Indian Ocean is the third largest ocean in the world', true),
    Question2('The city of Utrecht is in Holland', false),
    Question2('There are more countries in Africa than Asia', true),
    Question2('Seattle is more northerly than New York', true),
    Question2('The Maldives has the lowest high point of any country', true),
  ];
  String getQuestion2() {
    return _questions[_questionNumber].questionString;
  }

  bool isFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  bool getAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }
}
