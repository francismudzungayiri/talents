import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/views/widgets/text_input_field.dart';


class Payment extends StatefulWidget {
  const Payment({ Key? key }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _passcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
              child: const Text(
                'Donation Invoice',
                style:TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: buttonColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.payment,
              color: activeCardColor,
              size: 100,
            ),
            const SizedBox(height: 30),
             Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _amountController,
              label: 'Beneficiary name',
              icon: Icons.person,
            ),
          ),
          const SizedBox(height: 20),
      
            Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _amountController,
              label: 'Amount',
              icon: Icons.money,
            ),
          ),
          const SizedBox(height: 20),
           Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _nameController,
              label: 'Name on Card',
              icon: Icons.money,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _expiryDateController,
              label: 'Expiry date',
              icon: Icons.date_range
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              controller: _passcodeController,
              label: 'Password',
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          const SizedBox(height: 30),
           Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: const BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            child: InkWell(
              onTap: () {
                print('payment processing');
                authController.processPayment(_amountController.text, _nameController.text, 
                _cardNumberController.text, _expiryDateController.text, _passcodeController.text);
              },
              child: const Center(
                child: Text(
                  'Proceed with Donation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ]
          ),
      ),
    );
  }
}