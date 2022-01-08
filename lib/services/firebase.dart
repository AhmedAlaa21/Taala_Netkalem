import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserDataHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String usersCollection = 'Users';

  Future<void> userSetup(String? displayName) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(usersCollection);
      String? uid = _auth.currentUser!.uid.toString();
      String? email = _auth.currentUser!.email;
      await users.add({
        'display name': displayName,
        'uid': uid,
        'email': email,
      });
      return;
    } catch (e) {
      return;
    }
  }

  Future<String> getCurrentUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return 'not found';
  }

// to find the friend email..
  Future<bool> getUserEmail(String? email) async {
    var  querySnapshot =
         await FirebaseFirestore.instance.collection(usersCollection).where('email',isEqualTo: email).get();// get will execute query
    if(querySnapshot.docs.isNotEmpty) {
      print('hhhh');
      return true;
    }
    // for (int i = 0; i < docs.length; i++) {
    //   String e = docs[i].get('email');
    //   if (e == email) {
    //     return true;
    //   }
    // }
    return false;
  }

  Future<void> friendSetup(String? email) async {
    CollectionReference friendsCollection =  FirebaseFirestore.instance
        .collection(usersCollection)
        .firestore
        .collection('friends');
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection(usersCollection).get();
    var docs = querySnapshot.docs;
    for (int i = 0; i < docs.length; i++) {
      String e = docs[i].get('email');
      if (e == email) {
        friendsCollection.add({
          'name': docs[i].get('display name'),
        });
        print(friendsCollection);
      }
    }
  }
}
