

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:petpal/user%20registration/services/google_auth.dart';


import 'package:petpal/user%20registration/login.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
 
  

  




  

  // Logout function
  Future<void> _logout() async {
    print("button clicked");
    await FirebaseServices().googleSignOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
  body: Column(
    children: [
      Expanded(
        child: Center(
          child: IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: _logout,
          ),
        ),
      ),
    ],
  ),
);
}
}
