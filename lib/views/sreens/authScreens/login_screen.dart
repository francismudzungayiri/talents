
import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/views/sreens/authScreens/register_screen.dart';
import 'package:talents/views/sreens/donator/d_login.dart';
import 'package:talents/views/widgets/text_input_field.dart';


class Login extends StatelessWidget {
   Login({ Key? key }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 25),
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
               onTap: () => authController.loginUser(
                _emailController.text,
                _passwordController.text,
              ),
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