import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType typeInput;
  final String label;
  final Icon preIcon;
  final Function validator;

  const PasswordInput({Key key, this.controller, this.typeInput, this.label, this.preIcon, this.validator});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool scure=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: scure,
        controller: widget.controller,
        keyboardType: widget.typeInput,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.preIcon,
          suffixIcon: IconButton(
            icon: Icon(scure?Icons.visibility_off:Icons.visibility),
            onPressed: (){
              setState(() {
                scure=!scure;
              });
            },
          ),
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
        validator: widget.validator,
      ),
    );
  }
}
