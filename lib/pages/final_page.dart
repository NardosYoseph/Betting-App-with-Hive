

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/widgets/printed_row.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:barcode_widget/barcode_widget.dart' ; 
import 'package:flutter/material.dart';
import 'package:mydesktop2/pages/home_page.dart';
import 'package:mydesktop2/widgets/myform.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:provider/provider.dart';


class FinalPrint extends StatefulWidget {
   FinalPrint({super.key,required this.date,required this.deposit,required this.netDeposit,required this.boxNumber,required this.new_data,required this.odd,required this.win_place,required this.winned_money,required this.username});
final String date;
final String deposit;
final String netDeposit;
final String boxNumber;
final String new_data;
final String odd;
final String win_place;
final String winned_money;
final String username;
  

  @override
  State<FinalPrint> createState() => _FinalPrintState();
}

class _FinalPrintState extends State<FinalPrint> {
 // List<TicketDetail> ticketDetail = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
       // appBar: AppBar(title: Text(widget.title)),
        body: Row(
          children: [
             SizedBox(width: 450,),
             Expanded(
             
              child: PdfPreview(
                useActions: false,
              actions: [PdfPrintAction()],
                build: (format) => _generatePdf(format),
              ),
            ),
          
            Expanded(
            // flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                    Provider.of<PassData>(context,listen: false).addTicket(widget.date,widget.boxNumber,widget.win_place, 
                    widget.deposit,widget.odd , widget.winned_money,widget.username);
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HomePage()));},
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 87, 58, 99),),
                            
                          child: const Text("Back",style: TextStyle(fontSize: 16,color: Colors.white),)
                        ),
                      ),
                       SizedBox(
                        width: 10,),
                     
                    ],
                  ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_4, compress: true);
   // final font = await PdfGoogleFonts.nunitoExtraLight();
   final image = await imageFromAssetBundle('assets/bettinghorse.png');

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(72 *(72/25.4),297*(72/25.4), marginLeft:15,),

        build: (context ) {
          return pw.Container(
                              padding: pw.EdgeInsets.all(10),
                              height:double.infinity,
                              width: 350,
                              //color: Colors.white,
                               child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                              
                                 children:[ 
                                 
                                  pw.SizedBox(
                                    height: 100,
                                    width:100,
                                    child: pw.Image(image),
                                    ),
                                    pw.Text("StarBetting",style: pw.TextStyle(
                 fontSize: 16,
                 ),),
                                    pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Deposit",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.deposit, style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                 // Provider.of<PassData>(context as BuildContext,listen: false).Mydeposit.toString(),
                 
      ],),
    ),
      
      pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Tax",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text("15%",style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                 // Provider.of<PassData>(context as BuildContext,listen: false).boxNum.toString()
      ],),
    ),
     pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Net Deposit",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.netDeposit,style: const pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                 // Provider.of<PassData>(context as BuildContext,listen: false).boxNum.toString()
      ],),
    ),
                               // pw.SizedBox(height: 5,),
 pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Horse/Dog Number",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.boxNumber,style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                 // Provider.of<PassData>(context as BuildContext,listen: false).boxNum.toString()
      ],),
    ),

                               //  pw.SizedBox(height: 15,),
                                 pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Odd",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.odd,style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                  //Provider.of<PassData>(context as BuildContext,listen: false).odd.toString()
      ],),
    ),

                                // pw.SizedBox(height: 5,),
                                 pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Win/Place",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.win_place,style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                  //Provider.of<PassData>(context as BuildContext,listen: false).win_place.toString()
      ],),
    ),

                        //  pw.SizedBox(height: 10,),
                           
                                pw.Text("---------------------------------------",style: pw.TextStyle(fontSize: 12),),
                                 //(leadText: "Winned money",tailText: "2000",),
                           
                                                      pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
    pw.Text("Total money",style: pw.TextStyle(
                 //color: pw.Colors.black,
                 fontSize: 12,
                 ),),
                 pw.Text(widget.winned_money,style: pw.TextStyle(
                 //color: Colors.black,
                 
                 fontSize: 12,
                 ),)
                  //Provider.of<PassData>(context as BuildContext,listen: false).winned_money.toString()
      ],),
    ),
                               pw.SizedBox(height: 5,),
               pw.SizedBox(
                                  height: 70,
                                  width: 300,
                                  child: pw.BarcodeWidget(data: widget.new_data, barcode: Barcode.code128(),drawText: true,)
                                ),
                              
                               // PrintedRow(leadText: "Winned Money",tailText:  Provider.of<PassForm>(context,listen:false).winned_money.toString()),
                                  
                                ]),
                             );
        },
      ),
    );

    return pdf.save();
    
  }
}
