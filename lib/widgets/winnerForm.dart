import 'dart:io';
import 'package:mydesktop2/pages/final_page.dart';
import 'package:mydesktop2/pages/totalWinPage.dart';
import 'package:xid/xid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

import '../pages/odd_page.dart';
class WinnerForm extends StatefulWidget {
  const WinnerForm({super.key});



  
  @override
  WinnerFormState createState() {
    return WinnerFormState();
  }
}
class WinnerFormState extends State<WinnerForm> {
 int? deposit;
  OddPage _oddPage=new OddPage();
  final _formKey = GlobalKey<FormState>();
 bool? win;
 bool? place;
 String text='';
 int counter=1;
 //String odd='';
  //bool? checkBoxValue= false;
  
  TextEditingController deposit_controller=TextEditingController();
  TextEditingController boxNum_controller=TextEditingController();
 
 Object? selected ;
 bool? win_value;
 bool? place_value;
 String? win_place_value="place";
 int? box_num1=1;
 int? box_num2=2;
 int? box_num3=3;


var xid = Xid();

String idGenerator() {
    final data = DateTime.now();
   return data.microsecondsSinceEpoch.toString();
  }

String dateGenerator() {
    final data = DateTime.now();
   return data.day.toString();
  }
  String monthGenerator() {
    final data = DateTime.now();
   return data.month.toString();
  } String yearGenerator() {
    final data = DateTime.now();
   return data.year.toString();
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100,width: 200,child: Image.asset('assets/dog.png'),),
           SizedBox(
            height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [const SizedBox(
            width: 40,),
              Container(
            
        decoration: BoxDecoration(color:Color.fromARGB(255, 201, 90, 235),
         boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),]
        ),
         
        height: 50,
        width: 100,
        child: const Center(
      child:   Text("Win",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
     
      Center(child: DropdownButton<int>(
      value: box_num1,
      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
      underline: Container(height: 2,color: Colors.black,),
      items: const [
        DropdownMenuItem<int>(
        value: 1,
        child: Text("1",style: TextStyle(color: Colors.black))),
        DropdownMenuItem<int>(
        value: 2,
        child: Text("2",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 3,
        child: Text("3",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 4,
        child: Text("4",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 5,
        child: Text("5",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 6,
        child: Text("6",style: TextStyle(color: Colors.black))),
        ],
        
         onChanged: (int? newValue){
        setState(() {
      box_num1=newValue;
        });
      }),),
      // Text(Provider.of<PassData>(context,listen: true).button_number.toString(),style: TextStyle(
      
      // fontSize: 16,fontWeight: FontWeight.bold,
      // ),),
       ],
           ), SizedBox(
            height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [const SizedBox(
            width: 40,),
              Container(
            
        decoration: BoxDecoration(color:Color.fromARGB(255, 201, 90, 235),
        boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),]),
         
        height: 50,
        width: 100,
        child: const Center(
      child:   Text("Place2",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
            
                  
      Center(child: DropdownButton<int>(
      value: box_num2,
      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
      underline: Container(height: 2,color: Colors.black,),
      items: const [
        DropdownMenuItem<int>(
        value: 1,
        child: Text("1",style: TextStyle(color: Colors.black))),
        DropdownMenuItem<int>(
        value: 2,
        child: Text("2",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 3,
        child: Text("3",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 4,
        child: Text("4",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 5,
        child: Text("5",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 6,
        child: Text("6",style: TextStyle(color: Colors.black))),
        ],
        
         onChanged: (int? newValue){
        setState(() {
      box_num2=newValue;
        });
      }),),
// Text(Provider.of<PassData>(context,listen: true).button_number.toString(),style: TextStyle(
      
//       fontSize: 16,fontWeight: FontWeight.bold,
//       ),),

      ] ,
           ),
            const SizedBox(
            height: 10,),
         
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [const SizedBox(
            width: 40,),
              Container(
            
        decoration: BoxDecoration(color:Color.fromARGB(255, 201, 90, 235),
        boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),]),
         
        height: 50,
        width: 100,
        child: const Center(
      child:   Text("Place3",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
 Center(child: DropdownButton<int>(
      value: box_num3,
      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
      underline: Container(height: 2,color: Colors.black,),
      
      items: const [
        DropdownMenuItem<int>(
        value: 1,
        child: Text("1",style: TextStyle(color: Colors.black))),
        DropdownMenuItem<int>(
        value: 2,
        child: Text("2",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 3,
        child: Text("3",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 4,
        child: Text("4",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 5,
        child: Text("5",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
        value: 6,
        child: Text("6",style: TextStyle(color: Colors.black))),
        ],
        
         onChanged: (int? newValue){
        setState(() {
      box_num3=newValue;
        });
      }),),
// Text(Provider.of<PassData>(context,listen: true).button_number.toString(),style: TextStyle(
      
//       fontSize: 16,fontWeight: FontWeight.bold,
//       ),),

      ] ,
           ),
         
         const SizedBox(
            height: 20,),
           
            Text(Provider.of<PassData>(context,listen: true).errorMessage,style: TextStyle(color: Colors.red,fontSize: 12)),
      const SizedBox(
            height: 20,),
          Center(
            child: Container(
              height: 75,
              width: 150,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                 if(box_num1!=box_num2&&box_num1!=box_num3&&box_num2!=box_num3){
                   
                        Provider.of<PassData>(context,listen: false).filterWin(box_num1, box_num2,box_num3 ,Provider.of<PassData>(context,listen: false).ticketID);
                      // Provider.of<PassData>(context,listen: false).totalWin();
                     
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OddPage()));
                  
              Provider.of<PassData>(context,listen: false).setEndGameStatus(false);
              Provider.of<PassData>(context,listen: false).addid(1); 
              print(Provider.of<PassData>(context,listen: false).ticketID);
              
                 }else{
          Provider.of<PassData>(context,listen:false).errormessage("Same box number is not allowed");
                 }
                 
                   Provider.of<PassData>(context,listen: false).ticketID=(double.parse(Provider.of<PassData>(context,listen: false).ticketID) + 1).toString();
                 } },
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(143, 25, 96, 1),),
                
                child: Icon(Icons.check,color:Colors.white,size: 24,)
              ),
            ),
          ),
             const SizedBox(
            height: 110,),
          
        ],
      ),
    );
  }
}
