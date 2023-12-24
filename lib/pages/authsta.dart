import 'package:c120397/pages/LoginPage.dart';
import 'package:c120397/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,user){
          if (user.hasData){
            return Homepage();
          }else{
            return LoginPage();
          }
  }), 
    );
  }
}