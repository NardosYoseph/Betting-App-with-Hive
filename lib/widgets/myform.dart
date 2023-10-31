import 'dart:io';
import 'package:mydesktop2/pages/final_page.dart';
import 'package:xid/xid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

import '../pages/odd_page.dart';
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});



  
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State<MyCustomForm> {
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
 int? box_num=1;

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
      child:   Text("Dog/Horse \n Number",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
            
               
        
      // Center(child: DropdownButton<int>(
      // value: box_num,
      // icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
      // underline: Container(height: 2,color: Colors.black,),
      // items: const [
      //   DropdownMenuItem<int>(
      //   value: 1,
      //   child: Text("1",style: TextStyle(color: Colors.black))),
      //   DropdownMenuItem<int>(
      //   value: 2,
      //   child: Text("2",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
      //   value: 3,
      //   child: Text("3",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
      //   value: 4,
      //   child: Text("4",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
      //   value: 5,
      //   child: Text("5",style: TextStyle(color: Colors.black))), DropdownMenuItem<int>(
      //   value: 6,
      //   child: Text("6",style: TextStyle(color: Colors.black))),
      //   ],
        
      //    onChanged: (int? newValue){
      //   setState(() {
      // box_num=newValue;
      //   });
      // }),),
      Text(Provider.of<PassData>(context,listen: true).button_number.toString(),style: TextStyle(
      
      fontSize: 16,fontWeight: FontWeight.bold,
      ),),
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
      child:   Text("Win/Place",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
            
               
        
      // Center(child: DropdownButton<String>(
      // value: win_place_value,
      // icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
      // underline: Container(height: 2,color: Colors.black,),
      // items: const [
      //   DropdownMenuItem<String>(
      //   value: "win",
      //   child: Text("win",style: TextStyle(color: Colors.black))),
      //   DropdownMenuItem<String>(
      //   value: "place",
      //   child: Text("Place",style: TextStyle(color: Colors.black))),
      //   ],
        
      //    onChanged: (String? newValue){
      //   setState(() {
      // win_place_value=newValue;
      //   });
      // }),), 
Text(Provider.of<PassData>(context,listen: false).button_win_place.toString(),style: TextStyle(
      
      fontSize: 16,fontWeight: FontWeight.bold,
      ),),

      ] ,
           ),
            const SizedBox(
            height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
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
      child:   Text("Deposit",style: TextStyle(
      
      fontSize: 14,fontWeight: FontWeight.bold,
      ),),
        ),
      
           ),
           const SizedBox(
            width: 20,),
               SizedBox(
                height: 50,
                width: 100,
                 child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: deposit_controller,
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'fill deposit money';
                     }
                   // deposit=deposit_controller.text as int? ;
                   
                   },
                        decoration: const InputDecoration(labelText: "deposit money",
                     enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 3, 97, 238),
                     
                   ),))
                 ),
               ),
             ],
           ),
         
         const SizedBox(
            height: 20,),
      
          Row(
            children: [
              Container(
                height: 75,
                width: 150,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     
                    
                          Provider.of<PassData>(context,listen: false).final_print(deposit_controller.text , box_num,win_place_value,context);
                    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  FinalPrint(date: "${yearGenerator()}/${monthGenerator()}/${dateGenerator()}",deposit: deposit_controller.text,
        netDeposit: Provider.of<PassData>(context as BuildContext,listen: true).netdeposit.toString(),
        boxNumber: Provider.of<PassData>(context as BuildContext,listen: true).button_number.toString(),new_data:idGenerator(),
        odd: Provider.of<PassData>(context as BuildContext,listen: true).button_odd.toString(),
        win_place:  Provider.of<PassData>(context as BuildContext,listen: true).button_win_place.toString(),
        winned_money: Provider.of<PassData>(context as BuildContext,listen: false).fixed_winned_money.toString(),
        username: Provider.of<PassData>(context as BuildContext,listen: false).username.toString(), )));
       
                    
                   } },
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(143, 25, 96, 1),),
      
                  child: Icon(Icons.check,color:Colors.white,size: 24,)
                ),
              ),
              
               Container(
            height: 75,
            width: 150,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                deposit_controller.clear(); },
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(252, 41, 71,1),),
      
              child: Icon(Icons.cancel,color: Colors.white,size: 24,)
            ),
          )
            ],
          ),
             const SizedBox(
            height: 110,),
          Container(
            height: 75,
            width: 150,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<PassData>(context,listen: false).setEndGameStatus(true); },
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(131, 1, 21, 1),),
      
              child: const Center(
      child:   Text("End Game",style: TextStyle(
      color: Colors.white,
      fontSize: 16,fontWeight: FontWeight.bold,
      ),),
        ),
            ),
          )
        ],
      ),
    );
  }
}
