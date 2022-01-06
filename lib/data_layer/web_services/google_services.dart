import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panshimanager/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshimanager/data_layer/models/user_details.dart';
import 'package:panshimanager/data_layer/web_services/prepered_data/firebase_firestore_services.dart';
import 'package:panshimanager/presentation_layer/screens/controller_screen/controller_screen.dart';
import 'package:panshimanager/presentation_layer/widgets/popup/popup.dart';
import 'package:provider/provider.dart';

class GoogleService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  CollectionReference addUser = FirebaseFirestore.instance.collection("User");

  Future<UserDetails?> signInWithGoogle(context) async {
    int isUserExist = 0;
    String uid = "";
    String name = "";


    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
    await _auth.signInWithCredential(credential);

    final User? user = authResult.user;
    if (user != null) {
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);


      String? phone = user.phoneNumber ?? "00";
      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser?.uid);
      await FirebaseFirestore.instance
          .collection('User')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc['email'] == user.email) {
            uid = doc['uid'];
            name = doc['name'];
            isUserExist++;
          }
        }
      });
      if (isUserExist == 0) {
        name=user.displayName as String;
        phone=phone;
        await addUser.add({
          'email': user.email,
          'name': user.displayName,
          'phoneNumber': phone,
          'uid': "",
        }).then(
                (value) => value.get().then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                addUser
                    .doc(documentSnapshot.id)
                    .update({'uid': documentSnapshot.id});
                Provider.of<UserProvider>(context, listen: false).uid =
                    documentSnapshot.id;
                uid=documentSnapshot.id;
              }
            }));
        Future.delayed(const Duration(milliseconds: 20));
      }
      UserDetails newUser = UserDetails(
        name: name,
        email: user.email as String,
        phoneNumber: phone,
        uid: uid,
        isVerify: true,
      );
      Provider.of<UserProvider>(context, listen: false).email =
          user.email;
      Provider.of<UserProvider>(context, listen: false).name =
          name;
      Provider.of<UserProvider>(context, listen: false).uid =
          uid;
      Provider.of<UserProvider>(context, listen: false).loginType =
      "Google";
      Provider.of<UserProvider>(context, listen: false).number = phone;
      Provider.of<UserProvider>(context, listen: false)
          .isVerify = true;

      late QueryDocumentSnapshot userDoc;
      await FirebaseFirestore.instance
          .collection('User')
          .get()
          .then((QuerySnapshot querySnapshot)async {
        for (var doc in querySnapshot.docs) {
          if (doc['email'] ==
              Provider.of<UserProvider>(context, listen: false).email){
            userDoc=doc;
          }
        }
        Provider.of<UserProvider>(context, listen: false)
            .uid = userDoc['uid'];
        await FirebaseFirestoreServices().getOrdersData(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
            const ControllerScreen()));
      });
      return newUser;
    }
    return null;
  }


  Future<void> signOutGoogle(context) async {
    await googleSignIn.signOut();
    try{
      await _auth.signOut().then((value) async{
      });
    }on FirebaseAuthException catch (error){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PopUp(errorText: "Log out fail");
          });
    }
  }
}
