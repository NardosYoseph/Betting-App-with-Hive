import 'package:flutter/material.dart';

class TicketRow extends StatefulWidget {
  const TicketRow({super.key,required this.id,required this.dateTime,required this.win_place,required this.odd,required this.deposit});
final int id;
 final DateTime dateTime;
 final String win_place;
final double odd,deposit;

  @override
  State<TicketRow> createState() => __TicketRowState();
}

class __TicketRowState extends State<TicketRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: Color.fromARGB(255, 200, 198, 204),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(widget.id.toString(),style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
        const SizedBox(width: 70,),
        Text(widget.dateTime.toString(),style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
        SizedBox(width: 90,),
        Text(widget.win_place,style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
        SizedBox(width: 70,),
        Text(widget.odd.toString(),style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
        SizedBox(width: 50,),
        Text(widget.deposit.toString(),style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
        SizedBox(width: 20,),
        ],
      ),
    );
  }
}