// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ticketAdapter extends TypeAdapter<TicketDetail> {
  @override
  final int typeId = 167;

  @override
  TicketDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketDetail(
      username: fields[21] == null ? '' : fields[21] as String,
      date: fields[20] == null ? '' : fields[20] as String,
      box_num: fields[3] == null ? '' : fields[3] as String,
      win_place: fields[4] == null ? '' : fields[4] as String,
      deposit: fields[5] == null ? '' : fields[5] as String,
      odd: fields[6] == null ? '' : fields[6] as String,
      winned_money: fields[7] == null ? '' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TicketDetail obj) {
    writer
      ..writeByte(7)
      ..writeByte(21)
      ..write(obj.username)
      ..writeByte(20)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.box_num)
      ..writeByte(4)
      ..write(obj.win_place)
      ..writeByte(5)
      ..write(obj.deposit)
      ..writeByte(6)
      ..write(obj.odd)
      ..writeByte(7)
      ..write(obj.winned_money);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ticketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
