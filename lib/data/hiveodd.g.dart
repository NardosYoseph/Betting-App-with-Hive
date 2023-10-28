// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveodd.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class winPlaceAdapter extends TypeAdapter<odds> {
  @override
  final int typeId = 168;

  @override
  odds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return odds(
      win_odd1: fields[8] == null ? '' : fields[8] as String?,
      place_odd1: fields[9] == null ? '' : fields[9] as String?,
      win_odd2: fields[10] == null ? '' : fields[10] as String?,
      place_odd2: fields[11] == null ? '' : fields[11] as String?,
      win_odd3: fields[12] == null ? '' : fields[12] as String?,
      place_odd3: fields[13] == null ? '' : fields[13] as String?,
      win_odd4: fields[14] == null ? '' : fields[14] as String?,
      place_odd4: fields[15] == null ? '' : fields[15] as String?,
      win_odd5: fields[16] == null ? '' : fields[16] as String?,
      place_odd5: fields[17] == null ? '' : fields[17] as String?,
      win_odd6: fields[18] == null ? '' : fields[18] as String?,
      place_odd6: fields[19] == null ? '' : fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, odds obj) {
    writer
      ..writeByte(12)
      ..writeByte(8)
      ..write(obj.win_odd1)
      ..writeByte(9)
      ..write(obj.place_odd1)
      ..writeByte(10)
      ..write(obj.win_odd2)
      ..writeByte(11)
      ..write(obj.place_odd2)
      ..writeByte(12)
      ..write(obj.win_odd3)
      ..writeByte(13)
      ..write(obj.place_odd3)
      ..writeByte(14)
      ..write(obj.win_odd4)
      ..writeByte(15)
      ..write(obj.place_odd4)
      ..writeByte(16)
      ..write(obj.win_odd5)
      ..writeByte(17)
      ..write(obj.place_odd5)
      ..writeByte(18)
      ..write(obj.win_odd6)
      ..writeByte(19)
      ..write(obj.place_odd6);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is winPlaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
