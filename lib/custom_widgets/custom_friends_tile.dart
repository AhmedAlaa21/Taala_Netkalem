import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFriendTile extends StatelessWidget {
  const CustomFriendTile(
      {
      //required this.imageUrl,
      required this.friendName,
      this.lastMessage,
      this.numberOfUnreadMessages = 0});

  //final String imageUrl;
  final String friendName;
  final String? lastMessage;
  final int? numberOfUnreadMessages;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'chat');
      },
      isThreeLine: false,
      hoverColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      enabled: true,
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          '21',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
      // will be the number of unread messages,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage('assets/images/ahmed.jpg'),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(
          friendName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      subtitle: Text(
        lastMessage!,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
