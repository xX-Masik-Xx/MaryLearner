import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'EquationCardComparison.dart';

class EquationCardComparisonList extends StatefulWidget with ChangeNotifier {
  late Function onCorrectAnswer;
  final int amountOfCards;
  late GlobalKey<AnimatedListState> _stateListKey = _stateListKey;
  late final List<EquationCardComparison> _equationCardsComparisonList;
  int usedCards = 0;


  EquationCardComparisonList({
    Key? key,
    required this.onCorrectAnswer,
    this.amountOfCards = 15
  }) : super(key: key);

  @override
  _EquationCardComparisonListState createState() => _EquationCardComparisonListState();

  //GlobalKey<AnimatedListState> getListKey() => _stateListKey;

  //void getEquationCardsList() => _equationCardsList;
  void removeCard2() {
    removeCard(_stateListKey, _equationCardsComparisonList);
    notifyListeners();
  }

  void removeCard(GlobalKey<AnimatedListState> _listKey, List<EquationCardComparison> equationCardsComparisonList) {
    log("removed");
    for(var i = 0; i < 4; i++) {
      equationCardsComparisonList.removeAt(0);
      _listKey.currentState?.removeItem(
          equationCardsComparisonList.length, (contex,
          animation) => equationCardsComparisonList[equationCardsComparisonList.length]);
    }
    for(var i = 0; i < 4 && usedCards + i - 1< amountOfCards; i++) {
       equationCardsComparisonList.add(EquationCardComparison(onCorrectAnswer: onCorrectAnswer,));
       _listKey.currentState?.insertItem(equationCardsComparisonList.length - 1);
    }
    usedCards += 1;

  }
}

class _EquationCardComparisonListState extends State<EquationCardComparisonList> {
  static final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  static List<EquationCardComparison> equationCardsComparisonList = [];
  final Tween<Offset> _offset = Tween(begin: const Offset(1,0), end: const Offset(0,0));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      addCards();
    });
  }

  void addCards() {
    List<EquationCardComparison> _equationCardsComparisonList = List.filled(4, EquationCardComparison(onCorrectAnswer: widget.onCorrectAnswer,));

    Future future = Future(() {});
    for (var card in _equationCardsComparisonList) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          equationCardsComparisonList.add(card);
          _listKey.currentState?.insertItem(equationCardsComparisonList.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._stateListKey = _listKey;
    widget._equationCardsComparisonList = equationCardsComparisonList;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.1125 * 5,
      child: AnimatedList(
          key: _listKey,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              child: equationCardsComparisonList[index],
              position: animation.drive(_offset),
            );
          }
      ),
    );
  }
}
