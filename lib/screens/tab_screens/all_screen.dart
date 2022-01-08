import 'package:flutter/material.dart';
import 'package:taala_netkalm/custom_widgets/custom_friends_tile.dart';
import 'package:taala_netkalm/models/friend.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  //TODO fetch the friends list in the list view below
  List<Friend?>? friendsList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: friendsList!.isEmpty
          ? const Center(
              child:
                  Text('You have no friends, add new friends to appear here.',style: TextStyle(fontSize: 18,height: 1.8),textAlign: TextAlign.center,),)
          : ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, index) {
                return const Text('I am good');
              }),
    );
  }
}
