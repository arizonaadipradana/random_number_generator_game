import 'dart:math';
import 'character.dart';
import 'game_page.dart';
import 'start_page.dart';

enum MonsterAction {
  counterattack,
  heal,
  defend,
}

class Monster {
  Character character = Character();
  late MonsterAction? action;
  int? healing;
  int? damage;
  late int monsterHealthPoints = 100;


  Monster({this.action});


  bool isDead() {
    if (monsterHealthPoints <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void attackCharacter(Character character) {
    //random damage 1-25 no null
    damage = Random().nextInt(20);
    character.characterHealthPoints =
        character.characterHealthPoints! - damage!;
  }

  void healMonster(Monster monster) {
    if (action == MonsterAction.heal) {
      healing = Random().nextInt(10);
      monsterHealthPoints += healing!;
    }
  }

  void defendMonster(Monster monster) {
    monster.monsterHealthPoints -= damage! - 5;
  }

  Object? move() {
    switch (action) {
      case MonsterAction.counterattack:
        return 'Monster counterattack you for $damage damage';
      case MonsterAction.heal:
        return 'Monster is healing $healing hp';
      case MonsterAction.defend:
        return 'Monster is defending';
      default:
        return 'Monster';
    }
  }


}
