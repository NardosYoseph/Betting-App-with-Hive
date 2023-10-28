import 'package:flutter/material.dart';
import 'package:image/image.dart';


class BoxRow extends StatefulWidget {
  const BoxRow({super.key,required this.box_text2,required this.box_text3});

  
  final String box_text2;
  final String box_text3;

  @override
  State<BoxRow> createState() => _BoxRowState();
}

class _BoxRowState extends State<BoxRow> {
  @override
  Widget build(BuildContext context) {
    return 
     Card(
      shadowColor: Colors.black,
       child: Container(
        height: 50,
        width: 500,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
         children: [
            SizedBox(
        
             width: 200,),
           Text(widget.box_text2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color:  Colors.black
           ),),
            SizedBox(
        
             width: 150,),
           Text(widget.box_text3,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
           
           
         ],
          ),
       ),
     );
  }
}