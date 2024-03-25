// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:whatsapp/commun/utiles/utiles.dart';
// import 'package:whatsapp/features/call/screens/call_screen.dart';
// import 'package:whatsapp/models/call.dart';
// import 'package:whatsapp/models/group.dart' as model;


// final callRepositoryProvider = Provider(
//   (ref) => CallRepository(
//     firestore: FirebaseFirestore.instance,
//     auth: FirebaseAuth.instance,
//   ),
// );

// class CallRepository {
//   final FirebaseFirestore firestore;
//   final FirebaseAuth auth;
//   CallRepository({
//     required this.firestore,
//     required this.auth,
//   });

//   Stream<DocumentSnapshot> get callStream =>
//       firestore.collection('call').doc(auth.currentUser!.uid).snapshots();

//   void makeCall(
//     Call senderCallData,
//     BuildContext context,
//     Call receiverCallData,
//   ) async {
//     try {
//       await firestore
//           .collection('call')
//           .doc(senderCallData.callerId)
//           .set(senderCallData.toMap());
//       await firestore
//           .collection('call')
//           .doc(senderCallData.receiverId)
//           .set(receiverCallData.toMap());

  
//     } catch (e) {
//       showSnackBar(context: context, content: e.toString());
//     }
//   }

 

//   void endCall(
//     String callerId,
//     String receiverId,
//     BuildContext context,
//   ) async {
//     try {
//       await firestore.collection('call').doc(callerId).delete();
//       await firestore.collection('call').doc(receiverId).delete();
//     } catch (e) {
//       showSnackBar(context: context, content: e.toString());
//     }
//   }

  
// }
