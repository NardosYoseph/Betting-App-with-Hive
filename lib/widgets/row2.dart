import 'package:flutter/material.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:provider/provider.dart';

class BoxRow2 extends StatefulWidget {
  const BoxRow2({super.key,required this.boxNumber, required this.place_odd, required this.win_odd});

  final int boxNumber;

  final String win_odd;

  final String place_odd;

  @override
  State<BoxRow2> createState() => _BoxRow2State();
}

class _BoxRow2State extends State<BoxRow2> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
          SizedBox(height: 10,),

          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(color:Color.fromRGBO(64, 18, 139,0.5), borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),topRight: Radius.circular(30))
           , ),
            child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(64, 18, 139,0.8),
              child: Center(child: Text(widget.win_odd, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),
            ))
           , onPressed: (){
            Provider.of<PassData>(context,listen: false).win_place_button("Win", widget.win_odd, widget.boxNumber.toString(),true);
           },
            )),
          SizedBox(height: 20,),
           Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(color:Color.fromRGBO(64, 18, 139,0.5), borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),

            child:FloatingActionButton(
              backgroundColor: Color.fromRGBO(64, 18, 139,0.8),
              child:Center(child: Text(widget.place_odd,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
      onPressed: (){
             Provider.of<PassData>(context,listen: false).win_place_button("Place", widget.place_odd, widget.boxNumber.toString(),true);
      },
     
      ))],
      ),
    );
  }
}