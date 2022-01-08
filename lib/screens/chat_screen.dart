import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/ahmed.jpg'),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Icon(
                    Icons.trip_origin,
                    color: Colors.green,
                    size: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Ahmed Alaa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.videocam,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                //  color: Colors.red,
                ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              obscureText: false,
              autocorrect: true,
              enabled: true,
              cursorColor: Colors.blue,
              showCursor: true,
              onTap: () {
                print('Hi');
              },
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Write a message',
                suffixIcon: Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 30,
                ),
                icon: Icon(
                  Icons.attach_file,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
