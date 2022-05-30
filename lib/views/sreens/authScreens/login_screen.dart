
import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/views/sreens/authScreens/register_screen.dart';
import 'package:talents/views/widgets/text_input_field.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);
     
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Color beneficiaryCardColor = backgroundColor;
  Color entertainmentCardColor = backgroundColor;

// 1= beneficiary, 2= Entertainment
  void updateColor(int accountType) {
    if (accountType == 1) {
      if (beneficiaryCardColor == backgroundColor) {
        beneficiaryCardColor = activeCardColor;
      } else {
        beneficiaryCardColor = backgroundColor;
      }
    }
    if (accountType == 2) {
      if (entertainmentCardColor == backgroundColor) {
        entertainmentCardColor = activeCardColor;
      } else {
        entertainmentCardColor = backgroundColor;
      }
    }

    if(entertainmentCardColor == activeCardColor){
      beneficiaryCardColor= backgroundColor;
    }else if( beneficiaryCardColor == activeCardColor){
      entertainmentCardColor = backgroundColor;
    }else{}
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Zim Talents',
              style:TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: buttonColor,
              ),
            ),
            const SizedBox(height: 20),
             const Text(
            'Login',
            style: TextStyle(
              color:activeCardColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
          ),
          ),
          const SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _passwordController,
              label: 'Password',
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          const SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width-40,
            height: 50,
            decoration: const BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(
              Radius.circular(5),               
              )
            ),
            child: InkWell(
               onTap: () {
                 if(_emailController.text != 'admin@gmail.com'){
                   authController.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
                 }else{
                   authController.adminSignIn(_emailController.text, _passwordController.text);
                 }

               },
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
               InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                ),
                child: const Text(
                  'Register now',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor),
                ),
              ),
            ],
          ),              
          const SizedBox(height: 20),
          ],
        ),
      )
      
    );
  }
}