// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c120397/utility/imagewidget.dart';

import '../utility/buttonWidget.dart';
import '../utility/mytext.dart';
import 'SignUp.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _signin() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
    }
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // image
            ImageWidget(
              ImageAsset: 'images/mylogin.png',
              ImageHeight: 250,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // login lable
                    
                    SizedBox(
                      height: 30,
                    ),

                    // input username/password
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email ID',
                          prefixIcon: Icon(Icons.alternate_email_outlined)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                     TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixText: 'Forget?',
                        suffixStyle: TextStyle(
                            color: Color.fromARGB(255, 26, 56, 247),
                            fontSize: 18),
                      ),
                    ),

                    // login button
                    SizedBox(
                      height: 30,
                    ),

                    MyButton(
                      onTap: _signin,
                      btnText: 'Login',
                    ),
                    // registor now
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New User Please ? ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => SignUp()),
                                ));
                          },
                          child: Text('Registor',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 28, 79, 248),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
