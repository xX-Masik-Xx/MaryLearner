import 'package:flutter/material.dart';
import 'package:mary_learner_flutter/ElevatedGradientButton.dart';
import 'package:mary_learner_flutter/MatheChoicePage.dart';

import 'MathematicsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (context) => const MyHomePage(title: 'Home Page'),
        '/matheChoice': (context) => const MathChoicePage(),
        '/mathe': (context) => const MathematicsPage(title: "Math here!", cardType: MatheCardType.calculation),
        '/matheComparison': (context) => const MathematicsPage(title: "Math here!", cardType: MatheCardType.comparison)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MaryLearner',
          style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.05,
              fontWeight: FontWeight.w900,
              fontFamily: 'Nunito-Black'
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 98, 0, 234), Color.fromARGB(255, 141, 59, 255)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            ),
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedGradientButton(
              width: screenHeight * 0.3,
              height: screenHeight * 0.3,
              borderRadius: 25,
              onPressed: () {
                // Pushing a route directly, WITHOUT using a named route
                Navigator.pushNamed(context, '/matheChoice');
              },
              child: const Text(
                'Математика',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Nunito-Black'
                ),
            ),
          ),
            ]
        )
      ),
    );
  }
}

