import 'package:flutter/material.dart';

import 'ElevatedGradientButton.dart';

class MathChoicePage extends StatelessWidget {
  const MathChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Математика:',
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
                  width: (screenWidth-50)/2,
                  height: (screenWidth-50)/2,
                  borderRadius: 25,
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.pushNamed(context, '/mathe');
                  },
                  child: const Text(
                    '+/-',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Nunito-Black'
                    ),
                  ),
                ),
                ElevatedGradientButton(
                  width: (screenWidth-50)/2,
                  height: (screenWidth-50)/2,
                  borderRadius: 25,
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.pushNamed(context, '/matheComparison');
                  },
                  child: const Text(
                    'Сравнение',
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
