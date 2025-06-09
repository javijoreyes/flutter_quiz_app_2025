import 'package:flutter/material.dart';
import 'package:flutter_quiz_1/models/questions.dart';
import 'package:flutter_quiz_1/questions_screen.dart';
import 'package:flutter_quiz_1/start_screen.dart';
import 'package:flutter_quiz_1/results_screen.dart';

enum ActiveScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  ActiveScreen activeScreen = ActiveScreen.start;
  List<String> selectedAnswers = [];

  void switchToQuestions() {
    setState(() {
      activeScreen = ActiveScreen.questions;
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = ActiveScreen.start;
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers = [...selectedAnswers, answer];

      if (selectedAnswers.length == questions.length) {
        activeScreen = ActiveScreen.results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activeScreen) {
      case ActiveScreen.start:
        screenWidget = StartScreen(switchToQuestions);
        break;
      case ActiveScreen.questions:
        screenWidget = QuestionsScreen(chooseAnswer);
        break;
      case ActiveScreen.results:
        screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
        break;
    }

    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 93, 4, 134),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: screenWidget,
        ),
      ),
    );
  }
}
