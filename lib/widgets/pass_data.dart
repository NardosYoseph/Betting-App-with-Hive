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
bool endGame=false;
bool newGame=false;
 String errorMessage="";
 int? boxNum;
  double? odd;
  String? win_place;
  String? day;
  String? username;
  String? password;
  String? button_win_place="win/place";
  String? button_odd;
  String? button_number="0";
  String ticketID=0.toString();

  final box = Hive.box('TicketsBox');
//Ticket ticket=Ticket();
  // final _myBox = Hive.box('mybox');
List<TicketDetail> ticketdetail= [];
List<TicketDetail> todayTicket= [];
List<TicketDetail> winTicket= [];
List<TicketDetail> place1Ticket= [];
List<TicketDetail> place2Ticket= [];
List<TicketDetail> totalWinTicket= [];

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
     if (box.get("newTickets")==null) {//all ticket
   ticketdetail = [TicketDetail(ticketID: ticketID,username: userName,date: date,box_num: "", win_place: "", deposit: "", odd: "", winned_money: "")] ;
   box.put("newTickets",ticketdetail ) as List<TicketDetail>;
    }
   
  ticketdetail= box.get("newTickets").cast<TicketDetail>();
    ticketdetail.add(TicketDetail(ticketID: ticketID,username: userName,date: date,box_num: box_num, 
  win_place: win_place, deposit: deposit, odd: odd , winned_money: winned_money ));
box.put("newTickets", ticketdetail  );
//today ticket
 
day=date;
 //String today= "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}";
 if (box.get("todayTicket")==null) {
   todayTicket = [TicketDetail(ticketID: ticketID,username: userName,date: date,box_num: "", win_place: "", deposit: "", odd: "", winned_money: "")] ;
   box.put("todayTicket",todayTicket ) as List<TicketDetail>;
    }
// todayTicket=box.get("todayTicket").cast<TicketDetail>();
//   for(int i=0;i<=ticketdetail.length-1;i++){
//   if(ticketdetail[i].date == today){
//  todayTicket.add(TicketDetail(ticketID:ticketID,username:ticketdetail[i].username ,date: ticketdetail[i].date,box_num:ticketdetail[i].box_num, 
//   win_place: ticketdetail[i].win_place, deposit: ticketdetail[i].deposit, odd: ticketdetail[i].odd , winned_money: ticketdetail[i].winned_money ));
//}
todayTicket=ticketdetail.where((ticket) => ticket.date.contains("${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}")).toList();
 
box.put("todayTicket", todayTicket);
//  }


  recentTotal.recentTotal=box.get("newTotal") ; 
 if (box.get("newTotal")==null) {
recentTotal.recentTotal="0" ;
  box.put("newTotal", recentTotal.recentTotal);
}

  
   // newTotal=recentTotal as Total;
   if(recentTotal.recentTotal!=null){
    recentTotal.recentTotal= (double.parse(recentTotal.recentTotal!)  + double.parse(ticketdetail[ticketdetail.length-1].deposit)).toString();
    //recentTotal=newTotal as Total;
 }
 else{
    
   recentTotal.recentTotal="0"   ;
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
void addid(int num){
  ticketID=(int.parse(ticketID)+num).toString();
}
void setEndGameStatus(bool status){
  endGame=status;
  notifyListeners();
}void setNewGameStatus(bool status){
  newGame=status;
  notifyListeners();
}
void filterWin(int? boxnum1,int? boxnum2,int? boxnum3, String ticketId){
  for(int i=0;i<ticketdetail.length;i++){
    
    if(ticketdetail[i].box_num==boxnum1.toString() && ticketdetail[i].ticketID==ticketId &&ticketdetail[i].win_place=="win"){
      winTicket.add(ticketdetail[i]);
    }

  }

for(int i=0;i<ticketdetail.length;i++){
    
    if(ticketdetail[i].box_num==boxnum2.toString() && ticketdetail[i].ticketID==ticketId &&ticketdetail[i].win_place=="place"){
      place1Ticket.add(ticketdetail[i]);
    }

  }

for(int i=0;i<ticketdetail.length;i++){
    
    if(ticketdetail[i].box_num==boxnum3.toString() && ticketdetail[i].ticketID==ticketId &&ticketdetail[i].win_place=="place"){
      place2Ticket.add(ticketdetail[i]);
    }

  }

for(int i=0;i<winTicket.length;i++){
  if(winTicket[i].box_num==boxnum1.toString() && winTicket[i].ticketID==ticketId &&winTicket[i].win_place=="win"){
        totalWinTicket.add(winTicket[i]);

    }
  }for(int i=0;i<place1Ticket.length;i++){
    if(place1Ticket[i].box_num==boxnum2.toString() && place1Ticket[i].ticketID==ticketId &&place1Ticket[i].win_place=="place"){
           totalWinTicket.add(place1Ticket[i]);

    }
  }for(int i=0;i<place2Ticket.length;i++){
    if(place2Ticket[i].box_num==boxnum3.toString() && place2Ticket[i].ticketID==ticketId &&place2Ticket[i].win_place=="place"){
               totalWinTicket.add(place2Ticket[i]);


    }
  }

box.put("totalwin", totalWinTicket);
//  winTicket.clear();
// place1Ticket.clear();
// place2Ticket.clear();
// totalWinTicket.clear();
// box.delete("totalwin");

}

 

 
 void totalWin(){

  for(int i=0;i<winTicket.length;i++){
     totalWinTicket.add(winTicket[i]);
  }for(int i=0;i<place1Ticket.length;i++){
     totalWinTicket.add(place1Ticket[i]);
  }for(int i=0;i<place2Ticket.length;i++){
     totalWinTicket.add(place2Ticket[i]);
  }

box.put("totalwin", totalWinTicket);

 }
 void errormessage(String errormessage){
  errorMessage=errormessage;
 }
}