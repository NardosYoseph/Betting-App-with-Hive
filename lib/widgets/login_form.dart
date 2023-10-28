import 'package:flutter/material.dart';
import 'package:mydesktop2/pages/odd_page.dart';
import 'package:mydesktop2/widgets/pass_data.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible=false;
  TextEditingController username_controler= TextEditingController();
  TextEditingController password_controler= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 300,
            child: 
            TextFormField(
              controller: username_controler,
          decoration: const InputDecoration(labelText: "username",
          
                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 239, 194, 245),),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 239, 194, 245)))
                )
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: 300,
            child: 
            TextFormField(
              obscureText: !_passwordVisible,
              controller: password_controler,
          decoration:  InputDecoration(
          //  fillColor: Colors.white,
            labelText: "password",
               enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 239, 194, 245),),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 239, 194, 245))),
               suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color:Colors.black ,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),)
            ),
          ),
          SizedBox(height: 20,),
          Container(
             
            child: SizedBox(
height: 50,
              width: 300,
              child: ElevatedButton(onPressed: (){


                if(username_controler.text=="cashier1" && password_controler.text=="1234"||username_controler.text=="cashier2" && password_controler.text=="5678"){                  
               Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => HomePage(),
              ),
            );
             Provider.of<PassData>(context,listen: false).passUsername(username_controler.text, password_controler.text);

                }
              },
              style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color.fromARGB(255, 87, 58, 99)),
          
               child: Text("LogIn",style: TextStyle(fontSize: 20,color: Colors.black),))),
          )
        ],
      ),
    );
  }
}