import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taala_netkalm/screens/chat_screen.dart';
import 'package:taala_netkalm/screens/root/auth_screens/login_screen.dart';
import 'package:taala_netkalm/screens/root/auth_screens/signup_screen.dart';
import 'package:taala_netkalm/screens/root/home_screen.dart';
import 'package:taala_netkalm/screens/root/root.dart';
import 'package:taala_netkalm/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(
          create: (_) => AuthServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تعالى نتكلم',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        initialRoute: 'root',
        routes: {
          Root.screenRoute: (context) => const Root(),
          SignUpScreen.screenRoute: (context) => const SignUpScreen(),
          LoginScreen.screenRoute: (context) => const LoginScreen(),
          HomeScreen.screenRoute: (context) => const HomeScreen(),
          ChatScreen.screenRoute: (context) => const ChatScreen(),
        },
      ),
    );
  }
}
