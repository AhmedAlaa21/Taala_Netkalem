import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taala_netkalm/custom_widgets/custom_button.dart';
import 'package:taala_netkalm/custom_widgets/custom_text_button.dart';
import 'package:taala_netkalm/custom_widgets/custom_text_field.dart';
import 'package:taala_netkalm/screens/root/home_screen.dart';
import 'package:taala_netkalm/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String email, password;

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
                print(email);
              },
            ),
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
                print(password);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSubmissionButton(
                buttonText: 'Login',
                onTap: () async{
                  await authService.signInWithEmailAndPassword(email, password);
                  Navigator.pushReplacementNamed(context, HomeScreen.screenRoute);
                }),
            const SizedBox(
              height: 8,
            ),
            CustomTextButton(
                questionText: 'Do not have an account?',
                choiceText: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, 'signUp');
                })
          ],
        ),
      ),
    );
  }
}
