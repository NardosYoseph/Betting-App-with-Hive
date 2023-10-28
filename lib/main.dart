import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydesktop2/data/hivemodel.dart';
import 'package:mydesktop2/data/hiveodd.dart';
import 'package:mydesktop2/data/hivetotal.dart';
import 'package:mydesktop2/pages/lgin_page.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document= await getApplicationDocumentsDirectory();

 await Hive.initFlutter(document.path);
 
 Hive.ignoreTypeId(109);
Hive.registerAdapter<TicketDetail>(ticketAdapter());
 Hive.registerAdapter<odds>(winPlaceAdapter());
 Hive.registerAdapter<Total>(TotalAdapter());
 await Hive.openBox('TicketDetailBox');
 


  //Ticket ticket = Ticket();
  //print(ticket.ticketdetail.length);
  runApp( ChangeNotifierProvider(create: (context) => PassData(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBetting',   
      theme: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.purple,
   // primaryColor: Color.fromARGB(255, 89, 187, 243),
   ),

       debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

