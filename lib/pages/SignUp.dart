import 'package:c120397/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utility/TextfieldWidget.dart';
import '../utility/buttonWidget.dart';
import '../utility/imagewidget.dart';
import '../utility/mytext.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    void _signup(BuildContext context) async {
  if (passwordController.text == confirmPassController.text) {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // User created successfully, navigate to the home page.
      print('User created successfully');
      Navigator.pushReplacementNamed(context, '/home'); // Replace '/home' with your actual home page route.
    } catch (e) {
      // Handle any errors that occurred during the user creation process.
      print('Error creating user: $e');
    }
  } else {
    // Password and confirm password do not match, show an error message.
    print('Password and confirm password do not match');
  }
}

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ImageWidget(
              ImageAsset: 'images/signup.png',
              ImageHeight: 250,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Container(
                width: double.infinity,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
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
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: confirmPassController,
                      decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                   
                    MyButton(
                    onTap: () => _signup(context),
                    btnText: 'Sign Up',
                     ),
                     
                     SizedBox(
                      height: 20,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I have A Account ! ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => LoginPage()),
                                ));
                          },
                          child: Text('Login',
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
