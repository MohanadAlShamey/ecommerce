import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

 class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType typeInput;
  final String label;
  final Icon preIcon;
  final  validator;

  const CustomInput({Key key, this.controller, this.typeInput, this.label, this.preIcon, this.validator});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: typeInput,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: preIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: redColor,width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: redColor,width: 1),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: redColor,width: 1),
          ),
        ),

        validator: validator,
      ),
    );
  }
}
