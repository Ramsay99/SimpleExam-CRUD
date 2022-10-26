import 'dart:math';

List<int> generateListOFNumbers({int length = 8}) {
  return List.generate(length, (index) => Random().nextInt(25) + 97);
}
