class User {
  String id;
  final String name;
  final int age;
  final DateTime accCreated;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.accCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'accCreated': accCreated,
    };
  }
}
