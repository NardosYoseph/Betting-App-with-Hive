import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/data/hiveodd.dart';
import 'package:mydesktop2/data/hivetotal.dart';

class PassData extends ChangeNotifier{
  List<TicketDetail> tisGameTicket=[];
  late String ip_controller;
  double todaytotal=0;
 double? box1_win_odd;
   double? winned_money;
   String? fixed_winned_money;
   int? Mydeposit;
   double? netdeposit;

 int? boxNum;
  double? odd;
  String? win_place;
  String? day;
  String? username;
  String? password;
  String? button_win_place="win/place";
  String? button_odd;
  String? button_number="0";

  final box = Hive.box('TicketDetailBox');
//Ticket ticket=Ticket();
  // final _myBox = Hive.box('mybox');
List<TicketDetail> ticketdetail= [];
List<TicketDetail> todayTicket= [];

Total recentTotal=Total();
double? newTotal;
 odds win_place_odd=odds(win_odd1: "0", place_odd1: "0", win_odd2: "0", place_odd2: "0", win_odd3: "0", place_odd3: "0",
  win_odd4: "0", place_odd4: "0", win_odd5: "0", place_odd5: "0", win_odd6: "0", place_odd6: "0");
final List<dynamic> provider_win_place_odd=[
  "","","","","","","","","","","",""
];
  
  
  void assign_odd(String? win_controller1,String? place_controller1,String? win_controller2,String? place_controller2,String? win_controller3,
  String? place_controller3,String? win_controller4,String? place_controller4,String? win_controller5,String? place_controller5,
  String? win_controller6,String? place_controller6){
provider_win_place_odd[0]= win_controller1;
provider_win_place_odd[1]= place_controller1;
provider_win_place_odd[2]= win_controller2;
provider_win_place_odd[3]= place_controller2;
provider_win_place_odd[4]= win_controller3;
provider_win_place_odd[5]= place_controller3;
provider_win_place_odd[6]=win_controller4;
provider_win_place_odd[7]=place_controller4;
provider_win_place_odd[8]=win_controller5;
provider_win_place_odd[9]=place_controller5;
provider_win_place_odd[10]=win_controller6;
provider_win_place_odd[11]=place_controller6;


win_place_odd.win_odd1= win_controller1;
win_place_odd.place_odd1= place_controller1;
win_place_odd.win_odd2= win_controller2;
win_place_odd.place_odd2= place_controller2;
win_place_odd.win_odd3=win_controller3; 
win_place_odd.place_odd3= place_controller3; 
win_place_odd.win_odd4= win_controller4; 
win_place_odd.place_odd4= place_controller4; 
win_place_odd.win_odd5= win_controller5;
win_place_odd.place_odd5= place_controller6;
win_place_odd.win_odd6= win_controller6; 
win_place_odd.place_odd6= place_controller6;
box.put("ticketOdds",win_place_odd);

}
void final_print(String deposit, int? box_num,String? win_place_value,BuildContext context){
  win_place_odd=box.get("ticketOdds");
  boxNum=box_num;
//   win_place=win_place_value;
//   if(boxNum==1 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd1 as String);
//   }
//  else if(boxNum==1 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd1 as String);
//   }else if(boxNum==2 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd2 as String);
//   }else if(boxNum==2 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd2 as String);
//   }else if(boxNum==3 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd3 as String);
//   }else if(boxNum==3 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd3 as String);
//   }else if(boxNum==4 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd4 as String);
//   }else if(boxNum==4 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd4 as String);
//   }else if(boxNum==5 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd5 as String);
//   }
//  else if(boxNum==5 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd5 as String);
//   }
//  else if(boxNum==6 && win_place_value=="win"){
//     odd=double.parse(win_place_odd.win_odd6 as String);
//   }
//  else if(boxNum==6 && win_place_value=="place"){
//     odd=double.parse(win_place_odd.place_odd6 as String);
//   }
 RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

 
  Mydeposit=int.parse(deposit);
  netdeposit=(Mydeposit!-(Mydeposit!*0.15))!;
  boxNum=box_num;
  
  winned_money=(netdeposit!*double.parse(button_odd!)) ;
fixed_winned_money = winned_money.toString().replaceAll(regex, '');
}




void addTicket(String date,String box_num,String win_place,String deposit,String odd,String winned_money,String userName,){
     if (box.get("newTickets")==null) {
   ticketdetail = [TicketDetail(username: userName,date: date,box_num: "", win_place: "", deposit: "", odd: "", winned_money: "")] ;
   box.put("newTickets",ticketdetail ) as List<TicketDetail>;
    }
 
   ticketdetail= box.get("newTickets").cast<TicketDetail>();
    ticketdetail.add(TicketDetail(username: userName,date: date,box_num: box_num, 
  win_place: win_place, deposit: deposit, odd: odd , winned_money: winned_money ));
box.put("newTickets", ticketdetail  );

day=date;

 todayTicket.add(TicketDetail(username: userName,date: date,box_num: box_num, 
  win_place: win_place, deposit: deposit, odd: odd , winned_money: winned_money ));


  recentTotal.recentTotal=box.get("newTotal") ; 
 if (box.get("newTotal")==null) {
recentTotal.recentTotal=0 ;
  box.put("newTotal", recentTotal.recentTotal);
}

  
   // newTotal=recentTotal as Total;
   if(recentTotal.recentTotal!=null){
    recentTotal.recentTotal= (recentTotal.recentTotal!  + double.parse(ticketdetail[ticketdetail.length-1].deposit)) ;
    //recentTotal=newTotal as Total;
 }
 else{
    
   recentTotal.recentTotal=0   ;
 }
  if(ticketdetail.isNotEmpty){
    todaytotal= todaytotal+double.parse(ticketdetail[ticketdetail.length-1].deposit);
  }
  else{
   todaytotal=0;
  }

    box.put("newTotal",recentTotal.recentTotal);

  username=userName;

    //print(ticket.ticketdetail.length);
}


//  void addNewGameTicket(String box_num,String win_place,String deposit,String odd,String winned_money){
//     tisGameTicket.add(TicketDetail(box_num: box_num, win_place: win_place, deposit: deposit, odd: odd, winned_money: winned_money));
        
//  } 
 
//  double CalculateIncome(){
//   return 
//  }
void passUsername(String userName, String Password){
username=userName;
password=Password;
}
void win_place_button(String? win_place, String? odd, String? box_num,bool chosen){
button_number=box_num;
button_odd=odd;
button_win_place=win_place;
notifyListeners();
}
 
}