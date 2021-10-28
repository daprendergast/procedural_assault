import 'package:procedural_assault/dice.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    setSeed(123);
    List<PipCount> faces = roll([
      Die.red(),
      Die.green(),
      Die.yellow(),
      Die.blue(),
      Die.white(),
      Die.black()
    ]);
    //blast: 0, dodge
    PipCount pipcount = sumDice(faces);

    expect(
        pipcount.toString(),
        PipCount(blast: 6, surge: 3, shield: 0, dodge: 1, range: 4, evade: 1)
            .toString());
  });
}
