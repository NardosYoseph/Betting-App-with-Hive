import 'package:flutter/material.dart';
import 'package:mydesktop2/pages/home_page.dart';
import 'package:mydesktop2/pages/lgin_page.dart';
import 'package:mydesktop2/pages/odd_page.dart';
import 'package:mydesktop2/pages/recent.dart';
import 'package:mydesktop2/pages/today_total_page.dart';

class SiderMenu extends StatelessWidget {
  const SiderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration( color: Color.fromRGBO(173, 55, 126, 1),
     boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),]),
      height: double.infinity,
      width: 150,
     
      child: Column(
        children: [
          SizedBox(height: 10,),
          CircleAvatar(
           radius: 60,
            foregroundImage: AssetImage( 'assets/bettinghorse.png')
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.white,),
            title: Text("Home",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white),),
            onTap:(){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                                  ),
                        );
            } ,
          ),
          ListTile(
            leading: Icon(Icons.note_add,color: Colors.white,),
            title: Text("Enter odds",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
            onTap: (){
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OddPage()
                                  ),
                        );
            },
          ),
          ListTile(
            leading: Icon(Icons.list,color: Colors.white,),
            title: Text("Today's Total",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
            onTap: (){
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodayTotal()
                                  ),
                        );
            },
          ),
          
          ListTile(
            leading: Icon(Icons.logout,color: Colors.white,),
            title: Text("Recent tickets",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
            onTap: (){
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Recent()
                                  ),
                        );
            },
          ),
        SizedBox(height: 300,),
         Container(
            height: 40,
            width: 110,
            decoration: BoxDecoration(color:Color.fromRGBO(233, 126, 38, 0.494), borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),

            child:FloatingActionButton(
              backgroundColor: Color.fromRGBO(64, 18, 139,0.8),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
          
                ],
              ),
      onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()
                                  ),
                        );},
     
      )), ],
      ),
    );
  }
}