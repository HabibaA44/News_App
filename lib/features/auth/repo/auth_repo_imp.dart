import 'package:flutter_application_1/features/auth/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAuthImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireBaseFireStore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await newUser.user?.updateDisplayName(name);
      await newUser.user?.reload();
      final userId = newUser.user?.uid ?? "";


       await _fireBaseFireStore.collection('user').doc(userId).set({
        "userEmail": email,
        "userName": name,
        "userId": userId,
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
