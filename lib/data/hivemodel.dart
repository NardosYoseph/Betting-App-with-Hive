import 'package:hive/hive.dart';
part 'hivemodel.g.dart';




@HiveType(typeId:167,adapterName:"ticketAdapter")

class TicketDetail extends HiveObject{
   @HiveField(21,defaultValue: "")

String username;
  @HiveField(20,defaultValue: "")

String date;
 @HiveField(3,defaultValue: "")

String box_num;
 @HiveField(4,defaultValue: "")

  String win_place;
 @HiveField(5,defaultValue: "")
 
  String deposit;
 @HiveField(6,defaultValue: "")

  String odd;
 @HiveField(7,defaultValue: "")

  String winned_money;

TicketDetail({required this.username,required this.date,required this.box_num,required this.win_place,required this.deposit,required this.odd,required this.winned_money});
}
//@HiveType(typeId:169,adapterName:"allAdapter")

// class Ticket extends HiveObject {
//  @HiveField(0,defaultValue: "")
// List<TicketDetail> ticketdetail=[];
//  @HiveField(1,defaultValue: "")

// odds win_place_odd=odds(win_odd1: "0", place_odd1: "0", win_odd2: "0", place_odd2: "0", win_odd3: "0",
//   place_odd3: "0", win_odd4: "0", place_odd4: "0", win_odd5: "0", place_odd5: "0", win_odd6: "0", place_odd6: "0");
// @HiveField(2,defaultValue: "")
//  double recentTotal=0;
// }