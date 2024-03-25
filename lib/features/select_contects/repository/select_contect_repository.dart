// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/commun/utiles/utiles.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/features/chat/screens/mobile_chat_screen.dart';
final selectContactsRepositoryProvider =
    Provider((ref) => SelectContectRepository(
          firestore: FirebaseFirestore.instance,
        ));

class SelectContectRepository {
  final FirebaseFirestore firestore;

  SelectContectRepository({
    required this.firestore,
  });

  Future getContects() async {
    List<Contact> contects = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contects = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contects;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNum =
            selectedContact.phones[0].number.replaceAll(' ', '');

        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;
          Navigator.pushNamed(context, MobileChatScreen.routeName,
              arguments: {'name': userData.name, 'uid': userData.uid ,'isGroupChat' : false, 'profilePic':userData.profilePic});
        }
      }

      if (!isFound) {
        showSnackBar(
            context: context,
            content: 'This number dose not exist on this app.');
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
