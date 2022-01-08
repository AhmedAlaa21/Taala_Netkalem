import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taala_netkalm/services/firebase.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  final FirebaseUserDataHandler _handler = FirebaseUserDataHandler();

  late String friendEmail;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //add new friend..
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Add Friend'),
                  content: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'What is your friend email ?',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      friendEmail = value;
                    },
                  ),
                  actions: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          bool exist = await _handler.getUserEmail(friendEmail);
                          _handler.friendSetup(friendEmail);
                          print(friendEmail);
                          if (friendEmail == user.toString()) {
                            print(
                                'you can not add your self, go find a friend!');
                          } else if (exist == true) {
                            //TODO add friend to friend list
                            print('tmam');
                            Navigator.pop(context);
                          } else {
                            print('noooo');
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Add Friend',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ));
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'New Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
