import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/data/hivetotal.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:mydesktop2/widgets/sider_menu.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marquee_widget/marquee_widget.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
 final _myBox = Hive.box('TicketsBox');
 //Ticket ticket = Ticket();
List<TicketDetail> ticketdetail=[];
Total total=Total();

@override
 void initState() {
//_myBox.clear();
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("newTickets")==null) {
   ticketdetail = [TicketDetail(ticketID: Provider.of<PassData>(context,listen: false).ticketID.toString(),username:"", date: "-",box_num: "0", win_place: "-", deposit: "0", odd: "0", winned_money: "0")];
    } else {
      // there already exists data
  ticketdetail=_myBox.get("newTickets").cast<TicketDetail>() ;
    }
    if (_myBox.get("recentTotal")==null) {
  total.recentTotal=0.toString();}
  else{
 total.recentTotal= _myBox.get("recentTotal");
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
              color: Color.fromRGBO(218, 215, 218, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ Container(
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
                    height: 50,
                    width: 900,
                    color: Colors.white,
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
                          width: 30,
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
                          width: 60,
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
                      width: 1000,
                   //   color: Color.fromRGBO(218, 215, 218, 1),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:ticketdetail
                            .length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                               SizedBox(
                                width: 90,
                                child: Text(
                             ticketdetail[index].username,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                               SizedBox(
                                width: 90,
                                child: Text(
                                 ticketdetail[index]
                                      .date,
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
                                 ticketdetail[index]
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
                                 ticketdetail[index]
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
                                width: 60,
                                child: Text(
                              ticketdetail[index]
                                      .odd,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  "${ticketdetail[index]
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
                                 "${ticketdetail[index]
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
                color: Color.fromRGBO(252, 236, 246, 1),
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
                         ( ticketdetail
                            .length-1).toString(),
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
                          total.recentTotal.toString()+ "birr",
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
