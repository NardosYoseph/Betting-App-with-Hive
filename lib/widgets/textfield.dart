
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  TextFields({super.key,required this.controller, });
TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 50,
                  width: 100,
                   child: TextFormField(
                    controller: controller,
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Can\'t be empty';
                       }
                 
                       
                       return null;
                     }
                     ,
                     style: TextStyle(color: Colors.black),
                     decoration: const InputDecoration(
                        

                      hintStyle: TextStyle(color: Color.fromARGB(255, 158, 149, 149)),
                            hintText: "enter odd",
                       enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(143, 25, 96, 1),
                       
                     ),)))
                     );
  }
}