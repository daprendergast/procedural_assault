import 'dart:math';

var rand = Random();

dynamic setSeed(int seed) {
  rand = Random(seed);
}

class PipCount {
  int blast;
  int surge;
  int shield;
  int dodge;
  int range;
  int evade;

  PipCount(
      {this.blast = 0,
      this.surge = 0,
      this.shield = 0,
      this.dodge = 0,
      this.range = 0,
      this.evade = 0});

  @override
  String toString() {
    return {
      'blast': blast,
      'surge': surge,
      'shield': shield,
      'dodge': dodge,
      'range': range,
      'evade': evade
    }.toString();
  }
}

class Die {
  List<PipCount> faces = [];

  Die.red() {
    faces = [
      PipCount(blast: 1),
      PipCount(blast: 2),
      PipCount(blast: 2),
      PipCount(blast: 2, surge: 1),
      PipCount(blast: 3),
      PipCount(blast: 3)
    ];
  }

  Die.blue() {
    faces = [
      PipCount(surge: 1, range: 2),
      PipCount(blast: 1, range: 2),
      PipCount(blast: 2, range: 3),
      PipCount(blast: 1, surge: 1, range: 1),
      PipCount(blast: 2, range: 4),
      PipCount(blast: 1, range: 5)
    ];
  }

  Die.green() {
    faces = [
      PipCount(surge: 1, range: 1),
      PipCount(blast: 1, surge: 1, range: 1),
      PipCount(blast: 2, range: 1),
      PipCount(blast: 1, surge: 1, range: 2),
      PipCount(blast: 2, range: 2),
      PipCount(blast: 2, range: 3)
    ];
  }

  Die.yellow() {
    faces = [
      PipCount(surge: 1),
      PipCount(surge: 2, blast: 1),
      PipCount(blast: 2, range: 1),
      PipCount(blast: 1, surge: 1, range: 1),
      PipCount(surge: 1, range: 2),
      PipCount(blast: 1, range: 2)
    ];
  }

  Die.black() {
    faces = [
      PipCount(shield: 1),
      PipCount(shield: 1),
      PipCount(shield: 2),
      PipCount(shield: 2),
      PipCount(shield: 3),
      PipCount(evade: 1)
    ];
  }

  Die.white() {
    faces = [
      PipCount(),
      PipCount(shield: 1),
      PipCount(evade: 1),
      PipCount(shield: 1, evade: 1),
      PipCount(shield: 1, evade: 1),
      PipCount(dodge: 1)
    ];
  }
}

PipCount _rollSingle(Die die) {
  return die.faces[rand.nextInt(die.faces.length)];
}

List<PipCount> roll(List<Die> dice) {
  return dice.map((die) => _rollSingle(die)).toList();
}

PipCount sumDice(List<PipCount> faces) {
  return PipCount(
      blast: faces.fold<int>(0, (sum, item) => sum + item.blast),
      shield: faces.fold<int>(0, (sum, item) => sum + item.shield),
      surge: faces.fold<int>(0, (sum, item) => sum + item.surge),
      evade: faces.fold<int>(0, (sum, item) => sum + item.evade),
      dodge: faces.fold<int>(0, (sum, item) => sum + item.dodge),
      range: faces.fold<int>(0, (sum, item) => sum + item.range));
}
