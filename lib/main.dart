import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

import 'responsive/mobile_screen_layout.dart';
import 'responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String storageBucketUrl = 'gs://insta-clone-28d85.appspot.com';
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBy4tKBLtGC78nm1CPDlCVKg4HIx1n2cpA',
      appId: '1:346052458455:android:fd93eb4f75e3dca4183d92',
      messagingSenderId: '346052458455',
      projectId: 'insta-clone-28d85',
      storageBucket: storageBucketUrl,
    ),
  )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLayout(
      //   webScreenLayout: const WebScreenLayout(),
      //   mobileScreenLayout: const MobileScreenLayout(),
      // ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return ResponsiveLayout(
                webScreenLayout: const WebScreenLayout(),
                mobileScreenLayout: const MobileScreenLayout(),
              );
            } else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error} occurred'),
              );
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const LoginScreen();
        }
      ),
    );
  }
}

