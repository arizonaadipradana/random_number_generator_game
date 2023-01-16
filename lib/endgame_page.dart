import 'package:dicoding_submission/character.dart';
import 'package:dicoding_submission/monster.dart';
import 'package:dicoding_submission/start_page.dart';
import 'package:flutter/material.dart';

class WinGame extends StatelessWidget {
  final int attackCount;
  final String characterName;
  final String monsterName;

  WinGame(
      {required this.attackCount,
      required this.characterName,
      required this.monsterName,
      Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              margin: constraints.maxHeight > 600
                  ? EdgeInsets.symmetric(horizontal: 30, vertical: 300)
                  : EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '${characterName} won the game!',
                      textAlign: TextAlign.center,
                      style: constraints.maxHeight > 600
                          ? TextStyle(color: Colors.green, fontSize: 30)
                          : TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'You killed the ${monsterName}!',
                      textAlign: TextAlign.center,
                      style: constraints.maxHeight > 600
                          ? TextStyle(color: Colors.green, fontSize: 30)
                          : TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartPage()));
                      },
                      child: Text('Restart')),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Your point is: ${attackCount} click',
                      style: constraints.maxHeight > 600
                          ? TextStyle(color: Colors.green, fontSize: 30)
                          : TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoseGame extends StatelessWidget {
  final int attackCount;
  final String characterName;
  final String monsterName;

  LoseGame(
      {required this.attackCount,
      required this.characterName,
      required this.monsterName,
      Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              margin: constraints.maxHeight > 600
                  ? EdgeInsets.symmetric(horizontal: 30, vertical: 300)
                  : EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '${characterName} lose the game!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${monsterName} killed ${characterName}!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartPage()));
                      },
                      child: Text('Restart')),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Your point is: ${attackCount} click',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
