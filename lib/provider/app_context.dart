import 'package:fit/builder/circuit_builder.dart';
import 'package:fit/models/circuit_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppContext extends ChangeNotifier {
  List _circuitList = <Circuit>[];
  int selectedNavIndex = 1;

  final CircuitBuilder _circuitBuilder = CircuitBuilder();

  init() {
    getCircuit();
  }

  addCircuit(String name) async {
    // create circuit
    Circuit newCircuit = _circuitBuilder.createCircuit(name);
    // open box
    Box circuitBox = await Hive.openBox('circuit');
    // add to box
    await circuitBox.add(newCircuit);
    notifyListeners();
  }

  addExercise() {}

  getCircuit() async {
    Box circuitBox = await Hive.openBox('circuit');
    _circuitList = circuitBox.values.toList();
    notifyListeners();
  }

  updateCircuit(int index, Circuit circuit) async {
    Box circuitBox = await Hive.openBox('circuit');
    await circuitBox.putAt(index, circuit);
    notifyListeners();
  }

  deleteCircuit(int index) async {
    Box circuitBox = await Hive.openBox('circuit');
    print(index);
    await circuitBox.deleteAt(index);
    notifyListeners();
  }

  clear() async {
    Box circuitBox = await Hive.openBox('circuit');
    circuitBox.clear();
    notifyListeners();
  }

  getCircuitsList() {
    return _circuitList;
  }

  setSelectedNavIndex(int index) {
    selectedNavIndex = index;
    notifyListeners();
  }
}
