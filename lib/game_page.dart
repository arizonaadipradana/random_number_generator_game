import 'package:dicoding_submission/endgame_page.dart';
import 'package:dicoding_submission/monster.dart';
import 'package:flutter/material.dart';
import 'character.dart';

class GamePage extends StatefulWidget {
  Character character = Character();
  Monster monster = Monster();
  final String characterName;
  final String monsterName;
  final String difficulty;

  GamePage(
      {Key? key,
      required this.characterName,
      required this.monsterName,
      required this.difficulty,
      required this.character,
      required this.monster});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _stateChanged = false;
  bool _healing = false;
  int _attackCount = 0;


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    //call attackMonster void from character.dart
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              return Container(
                width: screenSize.width,
                height: screenSize.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.blue,
                        ),
                        height: (constraints.maxWidth > 400)?75:50,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    widget.characterName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    widget.monsterName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black,
                        ),
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  Text(
                                    '${widget.character.characterHealthPoints}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  Text(
                                    '${widget.monster.monsterHealthPoints}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: (constraints.maxWidth > 400) ? 100 : 10,
                      ),
                      Container(
                        child: Text(
                          'Status Box',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          height: 150,
                          padding: EdgeInsets.all(5),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Visibility(
                                    visible: _stateChanged,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '${widget.characterName} attacked ${widget.monsterName} for ${widget.character.damage} damage!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: _stateChanged,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '${widget.monster.move()}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    opacity: _healing ? 1 : 0,
                                    duration: Duration(seconds: 1),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'You use healing potions and gain +20 health!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ]),
                          )),
                      SizedBox(
                        height: (constraints.maxWidth > 400)?50:10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Builder(builder: (context) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.monster.isDead()) {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return WinGame(
                                                    attackCount: _attackCount,
                                                    characterName: widget.characterName,
                                                    monsterName: widget.monsterName,
                                                  );
                                                }));
                                          } else if (widget.character.isDead()) {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return LoseGame(
                                                    attackCount: _attackCount,
                                                    characterName: widget.characterName,
                                                    monsterName: widget.monsterName,
                                                  );
                                                }));
                                          }
                                          _attackCount++;
                                          _stateChanged = true;
                                          widget.character.attackMonster(widget.monster);
                                          int initialInventoryLenght =
                                              widget.character.inventory.length;
                                          if (widget.character.inventory.length >
                                              initialInventoryLenght) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'You\'ve received a healing potion'),
                                              duration: Duration(seconds: 1),
                                            ));
                                          }
                                        });
                                      },
                                      child: Text('Attack'),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.health_and_safety_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '${widget.character.inventory.length}/3',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (widget.character.useHealingPotion(1) > 0) {
                                          setState(() {
                                            _healing = true;
                                          });
                                        } else {
                                          widget.character.useHealingPotion(1) == 0;
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'You have no healing potions left!'),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        }
                                        Future.delayed(Duration(seconds: 2), () {
                                          setState(() {
                                            _healing = false;
                                          });
                                        });
                                      },
                                      child: Text('Use Potion'),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },

          ),
      ),
    );
  }
}
