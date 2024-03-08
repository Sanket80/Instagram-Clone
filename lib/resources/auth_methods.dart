import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model;


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String result = '';
    try{
      if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && bio.isNotEmpty && file != null) {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          uid: userCredential.user!.uid,
          email: email,
          username: username,
          bio: bio,
          photoUrl: photoUrl,
          following: [],
          followers: [],
        );

        await _firestore.collection('users').doc(userCredential.user!.uid).set(
        //   'username': username,
        //   'uid': userCredential.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'following': [],
        //   'followers': [],
        //   'photoUrl': photoUrl,
        // }
          user.toJson(),
        );
        result = 'User Created';
      } else {
        result = 'Please fill all the fields';
      }
    } catch(e) {
      result = e.toString();
    }
    return result;
  }

  // Login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = '';
    try{
      if(email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = 'User Logged In';
      } else {
        result = 'Please fill all the fields';
      }
    } catch(e) {
      result = e.toString();
    }
    return result;
  }
}
