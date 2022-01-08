import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taala_netkalm/custom_widgets/custom_button.dart';
import 'package:taala_netkalm/custom_widgets/custom_text_button.dart';
import 'package:taala_netkalm/custom_widgets/custom_text_field.dart';
import 'package:taala_netkalm/screens/root/home_screen.dart';
import 'package:taala_netkalm/services/firebase.dart';

import '../../../services/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String username, email, password;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            CustomTextFormField(
              hint: 'username',
              isFocused: false,
              onChanged: (value) {
                username = value;
              },
            ),
            //E-mail Field..
            CustomTextFormField(
              hint: 'e-mail',
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null) {
                  return 'please enter a valid email';
                } else {
                  return 'good one!';
                }
              },
              onChanged: (value) {
                email = value;
              },
            ),
            //Password Field..
            CustomTextFormField(
              hint: 'password',
              isSecure: true,
              validator: (value) {
                if (value == null) {
                  return 'please enter a valid password';
                } else {
                  return 'good one!';
                }
              },
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSubmissionButton(
                buttonText: 'Sign Up',
                onTap: () async {
                  try {
                    await authService.createUserWithEmailAndPassword(
                        email, password);
                    await FirebaseUserDataHandler().userSetup(username);
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.screenRoute);
                  } catch (e) {
                    print(e.toString());
                  }
                }),
            const SizedBox(
              height: 8,
            ),
            CustomTextButton(
                questionText: 'Do you have an account?',
                choiceText: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                })
          ],
        ),
      ),
    );
  }
}
