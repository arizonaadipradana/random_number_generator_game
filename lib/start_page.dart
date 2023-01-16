import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game_page.dart';
import 'character.dart';
import 'monster.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Character character = Character();
  Monster monster = Monster();
  String _monsterChoose = '';
  List<String> _monsterList = ['Kitten', 'Bear', 'Pocong', 'Mark Zuckerberg'];
  String _difficultyChoose = '';
  List _difficultyList = ['Easy', 'Medium', 'Hard', 'Extreme'];
  TextEditingController _characterName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (BuildContext context , BoxConstraints constraints ) {
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: (constraints.maxWidth > 400) ? EdgeInsets.symmetric(vertical: 10,horizontal: 50) : EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: (constraints.maxWidth > 400) ? EdgeInsets.only(left: 70,right: 70,top: 30) : EdgeInsets.only(left: 55,right: 55,top: 20),
                          child: TextField(
                            inputFormatters: [LengthLimitingTextInputFormatter(8)],
                            style: TextStyle(color: Colors.white),
                            controller: _characterName,
                            decoration: InputDecoration(
                              hintText: 'Character name',
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Enter your character name',
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton(
                            dropdownColor: Colors.black,
                            hint: Text(
                              'Choose Monster',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: _monsterChoose.isNotEmpty ? _monsterChoose : null,
                            onChanged: (newValue) {
                              setState(() {
                                _monsterChoose = newValue.toString();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('You choose $_monsterChoose monster'),
                                duration: Duration(seconds: 1),
                              ));
                            },
                            items: _monsterList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton(
                            dropdownColor: Colors.black,
                            hint: Text(
                              'Select Difficulty',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: _difficultyChoose.isNotEmpty ? _difficultyChoose : null,
                            onChanged: (newValue) {
                              setState(() {
                                _difficultyChoose = newValue.toString();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('You choose $_difficultyChoose mode'),
                                duration: Duration(seconds: 1),
                              ));
                            },
                            items: _difficultyList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_difficultyChoose == 'Easy') {
                                    monster.monsterHealthPoints = 100;
                                  } else if (_difficultyChoose == 'Medium') {
                                    monster.monsterHealthPoints = 200;
                                  } else if (_difficultyChoose == 'Hard') {
                                    monster.monsterHealthPoints = 300;
                                  } else if (_difficultyChoose == 'Extreme') {
                                    monster.monsterHealthPoints = 400;
                                  }
                                });
                                if (_characterName.text.isEmpty ||
                                    int.tryParse(_characterName.text) != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                      Text('Please enter a valid character name e.g. John'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else if (_monsterChoose.isEmpty ||
                                    int.tryParse(_monsterChoose) != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter a monster name e.g Pocong'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else if (_difficultyChoose.isEmpty ||
                                    int.tryParse(_difficultyChoose) != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter a valid difficulty e.g Easy'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GamePage(
                                        characterName: _characterName.text,
                                        monsterName: _monsterChoose,
                                        difficulty: _difficultyChoose,
                                        character: character,
                                        monster: monster,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text('Next')),
                        )
                      ]),
                ),
              ),
            );
          },

        )

    );
  }
  @override
  dispose(){
    _characterName.dispose();
    super.dispose();
  }
}
