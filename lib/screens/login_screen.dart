import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Widgets/text_field_input.dart';
import 'package:instagram_clone/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/instagram_logo.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),

            // text field for email
            TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your Email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),

            // text field for password
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Enter your Password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 16,
            ),

            InkWell(
              child: Container(
                child: Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(child: Container(), flex: 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('Don\'t have an account?'),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),

                GestureDetector(
                  onTap:(){},
                  child: Container(
                    child: Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold,),),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                )

              ],
            )
          ],
        ),
      )),
    );
  }
}
