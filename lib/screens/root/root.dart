import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taala_netkalm/models/user.dart';
import 'package:taala_netkalm/services/auth.dart';

import 'auth_screens/login_screen.dart';
import 'home_screen.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);
  static const String screenRoute = 'root';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const LoginScreen() : const HomeScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
