import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/views/sreens/authScreens/login_screen.dart';
import 'package:talents/views/widgets/text_input_field.dart';

class BeneficiaryInfo extends StatelessWidget {
  BeneficiaryInfo({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Zim Talents',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: buttonColor,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'For donations add more info',
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
                    controller: _usernameController,
                    label: 'ID Number',
                    icon: Icons.add_card,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _emailController,
                    label: 'Home address',
                    icon: Icons.location_city,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _passwordController,
                    label: 'Phone Nmber',
                    icon: Icons.phone,
                    
                  ),
                ),
                 const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _emailController,
                    label: 'Occupation',
                    icon: Icons.join_full,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _passwordController,
                    label: 'Gender',
                    icon: Icons.male,
                  ),
                ),
                 const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _emailController,
                    label: 'Archievements',
                    icon: Icons.book
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    controller: _passwordController,
                    label: 'Diability',
                    icon: Icons.sick_outlined,
                    
                  ),
                ),
                const SizedBox(height: 35),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  child: InkWell(
                    onTap: () => authController.addMoreInfo(),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
