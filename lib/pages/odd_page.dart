import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydesktop2/pages/home_page.dart';
import 'package:mydesktop2/widgets/odd_form.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:mydesktop2/widgets/row.dart';
import 'package:mydesktop2/widgets/sider_menu.dart';
import 'package:mydesktop2/widgets/text.dart';
import 'package:mydesktop2/widgets/textfield.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:marquee_widget/marquee_widget.dart';
class OddPage extends StatefulWidget {
  const OddPage({super.key});

 
  @override
  State<OddPage> createState() => _OddPageState();
}

class _OddPageState extends State<OddPage> {
//final _myBox = Hive.box('mybox');

 





  final _oddformKey1 = GlobalKey<FormState>();
  final _oddformKey2 = GlobalKey<FormState>();
  final _oddformKey3 = GlobalKey<FormState>();
  final _oddformKey4 = GlobalKey<FormState>();
  final _oddformKey5 = GlobalKey<FormState>();
  final _oddformKey6 = GlobalKey<FormState>();


 int? boxNumber;
   
  
  TextEditingController win_controller1 = TextEditingController();
  TextEditingController place_controller1 = TextEditingController();
  TextEditingController win_controller2 = TextEditingController();
  TextEditingController place_controller2 = TextEditingController();
  TextEditingController win_controller3 = TextEditingController();
  TextEditingController place_controller3 = TextEditingController();
  TextEditingController win_controller4 = TextEditingController();
  TextEditingController place_controller4 = TextEditingController();
  TextEditingController win_controller5 = TextEditingController();
  TextEditingController place_controller5 = TextEditingController();
  TextEditingController win_controller6 = TextEditingController();
  TextEditingController place_controller6 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
        body: Row(
          children: [
            SizedBox(
              width: 200,
              child: SiderMenu()),
           
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                //  borderRadius: BorderRadius.circular(20),
                    color:Color.fromRGBO(247, 206, 247, 1),
                    
                    ),
                height: double.infinity,
                width: 700,
                child: Center(
                  child: ListView(
                    children: [
                      Column(
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
                                    height: 40,
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
                                  ),
                                ],
                              ),
                     
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 1, win_controller: win_controller1, place_controller: place_controller1,oddformKey: _oddformKey1,),
                                ],
                              ),
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 2, win_controller: win_controller2, place_controller: place_controller2,oddformKey: _oddformKey2,),
                                ],
                              ),
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 3, win_controller: win_controller3, place_controller: place_controller3,oddformKey: _oddformKey3,),
                                ],
                              ),
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 4, win_controller: win_controller4, place_controller: place_controller4,oddformKey: _oddformKey4,),
                                ],
                              ),
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 5, win_controller: win_controller5, place_controller: place_controller5,oddformKey: _oddformKey5,),
                                ],
                              ),
                              Row(
                                children: [
                                   SizedBox(
                                width: 30,
                              ),
                                  OddForm(boxNumber: 6, win_controller: win_controller6, place_controller: place_controller6,oddformKey: _oddformKey6,),
                                ],
                              ),
                                       SizedBox(
                    height: 100,
                  ),
                             
                            ],
                          ),
 Container(
                                          height: 70,
                                width: 300,
                                padding: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_oddformKey1.currentState!.validate() &&_oddformKey2.currentState!.validate() &&_oddformKey3.currentState!.validate()
                                     &&_oddformKey4.currentState!.validate()&&_oddformKey5.currentState!.validate()&&_oddformKey6.currentState!.validate()) {
                                
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()
                                              ),
                                    );
                                    Provider.of<PassData>(context,listen: false).assign_odd(win_controller1.text  , 
                                    place_controller1.text,win_controller2.text,place_controller2.text,win_controller3.text,place_controller3.text ,
                                    win_controller4.text,place_controller4.text,win_controller5.text,place_controller5.text,win_controller6.text,place_controller6.text );
                                    
                                    
                                  }},
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                   backgroundColor:Color.fromRGBO(143, 25, 96, 1),
                                   //elevation:100,
                                ),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),


                        ],
                      ),
                          ]),
                ),
              ),
            ),
            
          ],
        ));
  }
}
