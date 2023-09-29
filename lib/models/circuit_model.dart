import 'package:hive_flutter/hive_flutter.dart';
part 'circuit_model.g.dart';

@HiveType(typeId: 0)
class Circuit extends HiveObject {
  @HiveField(0)
  String name = "";
  @HiveField(1)
  String type = "Cardio";
  @HiveField(2)
  List<Exercise>? exercises = [];

  Circuit({required this.name});
}

class Exercise {
  String name = "";
  int position = -1;
  int reps = 0;
}
