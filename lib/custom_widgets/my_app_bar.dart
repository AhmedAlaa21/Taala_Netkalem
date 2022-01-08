import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taala_netkalm/screens/root/auth_screens/login_screen.dart';
import 'package:taala_netkalm/services/auth.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () async {
            try {
              authService.signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.screenRoute);
              print('signed out');
            } catch (e) {
              print(e);
            }
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
      title: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Taala',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65.0);
}
