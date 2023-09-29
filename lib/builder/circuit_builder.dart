import 'package:fit/models/circuit_model.dart';
import 'package:flutter/material.dart';

class CircuitBuilder {
  // CIRCUITS

  Circuit createCircuit(String name) {
    return Circuit(name: name);
  }

  Circuit addExercise(Exercise exercise, Circuit circuit) {
    circuit.exercises?.add(exercise);
    return circuit;
  }

  Circuit updateCircuit(String name, Circuit circuit) {
    circuit.name = name;
    return circuit;
  }

  // EXERCISES

  Circuit removeExercise(int index, Circuit circuit) {
    circuit.exercises?.removeAt(index);
    return circuit;
  }

  Circuit orderExercises(Circuit circuit) {
    return circuit;
  }
}
