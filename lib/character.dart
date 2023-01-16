import 'dart:math';
import 'monster.dart';

enum CharacterAction { jump, run, attack }

class Character {
  late CharacterAction? action;
  int? damage;
  List inventory = [];
  late int characterHealthPoints = 100;

  Character({this.action});


  int? healthPointCharacter(Character character) {
    return character.characterHealthPoints;
  }
  
  void attackMonster(Monster monster) {
    damage = Random().nextInt(10);
    monster.monsterHealthPoints -= damage!;

    int dropChance = Random().nextInt(101);
    if (dropChance < 20) {
      this.inventory.length < 3
          ? this.inventoryAdd("Healing Potion")
          : print("Inventory penuh!");

    }

    int action = Random().nextInt(3);
    if (action == 0) {
      monster.action = MonsterAction.counterattack;
      monster.attackCharacter(this);
    } else if (action == 1) {
      monster.action = MonsterAction.heal;
      monster.healMonster(monster);
    } else if (action == 2) {
      monster.action = MonsterAction.defend;
      monster.defendMonster(monster);
    };

    if (monster.monsterHealthPoints < 0) {
      monster.monsterHealthPoints = 0;
      monster.isDead();
    } else {
      monster.monsterHealthPoints = monster.monsterHealthPoints;
    }
  }

  void healCharacter(Character character) {
    character.characterHealthPoints = character.characterHealthPoints + 20;
  }

  bool isDead() {
    if (characterHealthPoints! <= 0) {
      return true;
    } else {
      return false;
    }
  }

  bool inventoryAdd(String item) {
    inventory.add(item);
    return true;
  }

  int useHealingPotion(int item) {
    if (item == 1 && inventory.isNotEmpty) {
      // check if the main character has any healing potions and the user's input is 1
      inventory.removeAt(0); // decrease the counter by one
      healCharacter(this);
      return item; // call the healCharacter method to increase the main character's health points
    } else {
      print("Anda tidak memiliki potion");
      return 0;
    }
  }
}
