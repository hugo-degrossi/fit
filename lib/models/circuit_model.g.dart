// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circuit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CircuitAdapter extends TypeAdapter<Circuit> {
  @override
  final int typeId = 0;

  @override
  Circuit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Circuit(
      name: fields[0] as String,
    )
      ..type = fields[1] as String
      ..exercises = (fields[2] as List?)?.cast<Exercise>();
  }

  @override
  void write(BinaryWriter writer, Circuit obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.exercises);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CircuitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
