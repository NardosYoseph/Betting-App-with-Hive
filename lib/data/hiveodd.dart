import 'package:hive/hive.dart';
part 'hiveodd.g.dart';

@HiveType(typeId:168,adapterName:"winPlaceAdapter")

class odds extends HiveObject{
 @HiveField(8,defaultValue: "")
  String? win_odd1;
 @HiveField(9,defaultValue: "")
  String? place_odd1;
 @HiveField(10,defaultValue: "")
  String? win_odd2;
 @HiveField(11,defaultValue: "")
  String? place_odd2;
 @HiveField(12,defaultValue: "")
  String? win_odd3;
 @HiveField(13,defaultValue: "")
  String? place_odd3;
 @HiveField(14,defaultValue: "")
  String? win_odd4;
 @HiveField(15,defaultValue: "")
  String? place_odd4;
 @HiveField(16,defaultValue: "")
  String? win_odd5;
 @HiveField(17,defaultValue: "")
  String? place_odd5;
 @HiveField(18,defaultValue: "")
  String? win_odd6;
 @HiveField(19,defaultValue: "")
  String? place_odd6;

odds({required this.win_odd1,required this.place_odd1,required this.win_odd2,required this.place_odd2,required this.win_odd3,
required this.place_odd3,required this.win_odd4,required this.place_odd4,required this.win_odd5,required this.place_odd5,
required this.win_odd6,required this.place_odd6,});

}
