import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:mydesktop2/widgets/sider_menu.dart';
import 'package:provider/provider.dart';
import 'package:marquee_widget/marquee_widget.dart';

class TodayTotal extends StatefulWidget {
  const TodayTotal({super.key});

  @override
  State<TodayTotal> createState() => _TodayTotalState();
}
 final _myBox = Hive.box('TicketDetailBox');
List<TicketDetail> Providerticketdetail=[];
List<TicketDetail> ticketdetail=[];

 int? trueTicketNum;

class _TodayTotalState extends State<TodayTotal> {
 //final _myBox = Hive.box('TicketDetailBox');
 
 
@override
 void initState() {

Providerticketdetail=Provider.of<PassData>(context,listen:false)
                                  .todayTicket;
    if (_myBox.get("newTickets")==null) {
   ticketdetail = [TicketDetail(username: "" ,date: "-",box_num: "0", win_place: "-", deposit: "0", odd: "0", winned_money: "0")];
   trueTicketNum=0;

   //_myBox.get("newTickets");

   //_myBox.put("newTicket",ticketdetail);
    } else {
//_myBox.clear();

      // there already exists data
  ticketdetail=_myBox.get("newTickets").cast<TicketDetail>() ;
  
String today= "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}";


  for(int i=0;i<=ticketdetail.length-1;i++){
  if(ticketdetail[i].date == today){
 Providerticketdetail.add(TicketDetail(username:ticketdetail[i].username ,date: ticketdetail[i].date,box_num:ticketdetail[i].box_num, 
  win_place: ticketdetail[i].win_place, deposit: ticketdetail[i].deposit, odd: ticketdetail[i].odd , winned_money: ticketdetail[i].winned_money ));
}
}
   trueTicketNum=ticketdetail.length;
  
    }
    

  

    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(width: 200, child: SiderMenu()),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color:  Color.fromRGBO(247, 206, 247, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
         Container(
                                        height: 100,
                                        width: double.infinity,
                                         child: Marquee(
                                          
                                          autoRepeat: true,
                                         direction: Axis.horizontal,
                                         textDirection : TextDirection.rtl,
                                         animationDuration: Duration(seconds: 25),
                                        // backDuration: Duration(milliseconds: 5000),
                                         pauseDuration: Duration(milliseconds: 2500),
                                         directionMarguee: DirectionMarguee.oneDirection,
                                         child:Row(
                                           children: [
                                             Container(
                                              height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl5.png",fit: BoxFit.cover,width: 100,)),
                                             Container(
                                              height: 100,
                                              width: 600,
                                              child:Image.asset("assets/gambl1.png",fit: BoxFit.cover,width: 100,)),
                                             Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl2.png",fit: BoxFit.cover,width: 100,)),
                                            Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl3.png",fit: BoxFit.cover,width: 100,)),
                                            Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl4.png",fit: BoxFit.cover,width: 100,)),
                                            Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl5.png",fit: BoxFit.cover,width: 100,)),
                                            Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/gambl6.png",fit: BoxFit.cover,width: 100,)),
                                            Container(
                                               height: 100,
                                              width: 600,
                                              child: Image.asset("assets/bet.jpg",fit: BoxFit.cover,width: 100,)),
                                           
                                           ],
                                         ),
                                       
                                       ),
                                       ),
                 SizedBox(
                           height: 20,
                                       ),
                  Container(
                    color: Colors.white,
                    height: 50,
                    width: 900,
                    child: const Row(
                      children: [
                        Text(
                          " Cashier",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "  Date",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Horse/Dog \n Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Win/Place",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Odd",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          "Deposit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: double.infinity,
                      width: 900,
                   //   color: Color.fromRGBO(236, 176, 236, 1),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:Providerticketdetail
                            .length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: Text(
                             Providerticketdetail[index].username,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                               SizedBox(
                                width: 90,
                                child: Text(
                                Providerticketdetail[index].date,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                 Providerticketdetail[index]
                                      .box_num,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              SizedBox(
                                width: 40,
                                child: Text(
                                Providerticketdetail[index]
                                      .win_place,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                               Providerticketdetail[index]
                                      .odd,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "${Providerticketdetail[index]
                                          .deposit} birr",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                 "${Providerticketdetail[index]
                                          .winned_money} birr",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            const SizedBox(width: 10,),
          Container(
              height: double.infinity,
              width: 250,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(253, 236, 227, 0.8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Total ticket",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          (Providerticketdetail
                            .length).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                     Row(
                      children: [
                        const Text(
                          "Total Income",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          "${Provider.of<PassData>(context, listen: false)
                            .todaytotal} birr",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                      const SizedBox(height: 40,),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
