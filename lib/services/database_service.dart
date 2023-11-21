import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as devTools;

class DatabaseService {
  final String? userId;
  DatabaseService(this.userId);
//Collection REferences

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  //updating user data ankit
  Future addUserData(
      {required String fullName,
      required String email,
      required String phone}) async {
    await userCollection.doc(userId).set({
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "groups": [],
    });
  }

  Future updateUserData({String? fullName, String? email}) async {}

  //Get User data
  Future<bool> checkUserDataExists() async {
    var doc = await userCollection.doc(userId).get();
    devTools.log(doc.exists.toString());

    return doc.exists;
  }
}
