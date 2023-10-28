import 'package:flutter/material.dart';

class PrintedRow extends StatefulWidget {
  const PrintedRow({super.key,required this.leadText,required this.tailText});
final String leadText;
final String tailText;

  @override
  State<PrintedRow> createState() => _PrintedRowState();
}

class _PrintedRowState extends State<PrintedRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    Text(widget.leadText,style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),),
                 Text(widget.tailText,style: TextStyle(
                 color: Colors.black,
                 
                 fontSize: 16,fontWeight: FontWeight.bold,
                 ),)
      ],),
    );
  }
}