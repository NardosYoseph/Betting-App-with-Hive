import 'package:flutter/material.dart';
import 'package:mydesktop2/widgets/textfield.dart';

class OddForm extends StatefulWidget {
  OddForm(
      {super.key,
      required this.boxNumber,
      required this.win_controller,
      required this.place_controller,
      required this.oddformKey});
  final int boxNumber;
  final TextEditingController win_controller;
  final TextEditingController place_controller;
  final GlobalKey<FormState> oddformKey ;

  @override
  State<OddForm> createState() => _OddFormState();
}

class _OddFormState extends State<OddForm> {
   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: widget.oddformKey,
        child: Column(
          children: [
            SizedBox( width: 100,),
             Container(
            
            height: 50,
            width: 100,
             decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
           
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.boxNumber.toString(),style: TextStyle(
                color: Colors.black,
                fontSize: 30,fontWeight: FontWeight.bold,
                ),),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Image.asset("assets/dog1.png",height: 30,width: 50,)],)
              ],
            ),
          ),
            SizedBox( height: 20,),
            TextFields(controller: widget.win_controller),
            SizedBox( height: 20,),
            TextFields(controller: widget.place_controller),
          ],
        ),
      ),
    );
  }
}
