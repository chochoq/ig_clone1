import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ig_clone1/resources/storage_methods.dart';
import 'package:ig_clone1/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred =
            await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        String photoUrl = await StorageMethods().UploadImageToStorage('profilePic', file, false);

        model.UserModel user = model.UserModel(
          username: username,
          email: email,
          uid: cred.user!.uid,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore.collection('user').doc(cred.user!.uid).set(user.toJSON());
        res = "성공";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({required String email, required String password}) async {
    String res = '로그인 err occurred';
    try {
      if (email.isEmpty || password.isEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = '성공';
      } else {
        res = '이메일과 비밀번호를 입력해주세요';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
