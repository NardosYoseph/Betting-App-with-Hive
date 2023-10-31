import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/data/hiveodd.dart';
import 'package:mydesktop2/pages/lgin_page.dart';
import 'package:mydesktop2/pages/odd_page.dart';
import 'package:mydesktop2/widgets/pass_data.dart';

import 'package:mydesktop2/widgets/row.dart';
import 'package:mydesktop2/widgets/row2.dart';
import 'package:mydesktop2/widgets/sider_menu.dart';
import 'package:mydesktop2/widgets/winnerForm.dart';
import 'package:provider/provider.dart';
import '../widgets/myform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marquee_widget/marquee_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final _myBox = Hive.box('TicketsBox');
 //Ticket ticket = Ticket();
 late odds win_place_odd;
  @override
 void initState() {
  //_myBox.clear();
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("ticketOdds")==null) {
    win_place_odd = odds(win_odd1:"0", place_odd1: "0", win_odd2: "0", place_odd2: "0", win_odd3: "0", 
    place_odd3: "0", win_odd4: "0", place_odd4: "0", win_odd5: "0", place_odd5: "0", win_odd6: "0", place_odd6: "0") ;

   _myBox.put("newTicket",win_place_odd);
    } else {
      // there already exists data
   win_place_odd=_myBox.get("ticketOdds") ;
  
                               
    }
  

    super.initState();
    
  }

  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
       
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: SiderMenu()),
             //SizedBox(width: 50,),
             Expanded(
            //  flex: 2,
              child: Container(
                color:Color.fromRGBO(247, 206, 247, 1),
                child: ListView(
                  children: [Column(
                    children: [
    Container(
                                        height: 100,
                                        width: double.infinity,
                                         child: Marquee(
                                          forwardAnimation: Curves.easeIn,
                                          backwardAnimation: Curves.easeOut,
                                          autoRepeat: true,
                                         direction: Axis.horizontal,
                                         textDirection : TextDirection.rtl,
                                         animationDuration: Duration(seconds: 25),
                                         backDuration: Duration(milliseconds: 2500),
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
                      Row(
                        children: [
                          const Row(
                                     
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                   SizedBox(
                                         width: 10,
                                       ),
                                       Column(                                        
                                         children: [
                                            SizedBox(
                                         height: 60,
                                       ),
                                           Text('Win', style: TextStyle(
                                               color: Colors.black,
                                               fontSize: 20,
                                               fontWeight: FontWeight.bold,
                                             ),),
                                             SizedBox(
                                         height: 30,
                                       ),
                                          Text('Place', style: TextStyle(
                                               color: Colors.black,
                                               fontSize: 20,
                                               fontWeight: FontWeight.bold,
                                             ),), 
                                         ],
                                       ),  ],
                                   ),
                           SizedBox(width: 15,),
                           BoxRow2(boxNumber: 1,  win_odd: win_place_odd.win_odd1.toString(),
                           place_odd: win_place_odd.place_odd1.toString(),),
                           SizedBox(width: 15,),
                           BoxRow2(boxNumber: 2,  win_odd: win_place_odd.win_odd2.toString(),
                           place_odd: win_place_odd.place_odd2.toString(),),
                           SizedBox(width: 15,),
                           BoxRow2(boxNumber: 3,  win_odd: win_place_odd.win_odd3.toString(),
                           place_odd:win_place_odd.place_odd3.toString(),),
                           const SizedBox(width: 15,),
                           BoxRow2(boxNumber: 4,  win_odd: win_place_odd.win_odd4.toString(),
                           place_odd: win_place_odd.place_odd4.toString(),),
                           SizedBox(width: 15,),
                           BoxRow2(boxNumber: 5,  win_odd: win_place_odd.win_odd5.toString(),
                           place_odd: win_place_odd.place_odd5.toString(),),
                           SizedBox(width: 15,),
                           BoxRow2(boxNumber: 6,  win_odd: win_place_odd.win_odd6.toString(),
                           place_odd: win_place_odd.place_odd6.toString(),),
                        ],
                      ),
                      
                    ],
                  ),
                        ]  ),
              )
            ),
                 // SizedBox(width: 100,),
          
            Container(
              height: double.infinity,
              width: 300,
               decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(253, 236, 227, 0.8),
         
          ),
         
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 15,),
                      
      SizedBox(height: 100,),
      

                  Center(child: Provider.of<PassData>(context,listen: true).endGame==true ? WinnerForm(): MyCustomForm()),
                ],
              ))
              ])
      ),
    );
  }
}