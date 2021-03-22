import 'package:ecommerce/constant.dart';
import 'package:ecommerce/pages/widgets/custom_input.dart';
import 'package:ecommerce/pages/widgets/password_input.dart';
import 'package:ecommerce/service/api.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> frm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: frm,
          child: Column(
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(color: redColor),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomInput(
                  controller: usernameController,
                  validator: validateEmail,
                  label: 'Username',
                  preIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PasswordInput(
                  controller: passwordController,
                  label: 'Password',
                  preIcon: Icon(Icons.lock),
                  validator: validatePassword,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    if(frm.currentState.validate()){
                        Api api =Api();
                        api.login(usernameController.text, passwordController.text);
                    }
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 String  validateEmail(value) {
    if (value.length < 3) {
      return "الاسم قصير";
    } else if (value.length > 10) {
      return "hghsl ',dg []h";
    }
    return null;
  }

  String  validatePassword(value) {
    if (value.length < 6) {
      return "كلمة المرور قصير";
    } else if (value.length > 20) {
      return "كلمة المرور طويلة";
    }
    return null;
  }
}
