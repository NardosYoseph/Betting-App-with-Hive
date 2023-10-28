import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/purple.png",fit: BoxFit.cover,)),
            Container(height: double.infinity,width: double.infinity,
            decoration: BoxDecoration(
              
              gradient: LinearGradient(
             begin: Alignment.centerLeft,
              end: Alignment.centerRight
              ,colors: [Colors.white.withOpacity(0.5),Colors.black.withOpacity(0.8),],),
              ),
              )
            ,
                 Center(child: LoginForm()),
                    
        
     ] ),
    );
  }
}