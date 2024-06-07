
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebasenotes/pages/loginpage.dart';
import 'package:firebasenotes/services/singup_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

Future redirect() async{
   Get.to(()=>(LoginPage()));
}

Future signUp() async{
   var userName = userNameController.text.trim();
   var userEmail = userEmailController.text.trim();
   var userPassword = userPasswordController.text.trim();
   FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: userEmail , password: userPassword).then((value)=>{
      signUpUser(userName, userEmail, userPassword,)});
}
  //text controllers

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  
  User? currentUser = FirebaseAuth.instance.currentUser;


@override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 233, 233),
      body:  SafeArea(
        child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(Icons.android_rounded,
            size: 150,),
           const SizedBox(height: 20,),
              //welcome msg
          
               Text("Hey there!!! ^_^ ",
              style: GoogleFonts.bebasNeue(
                fontSize: 50
              ),
                ),
                const SizedBox(height: 10,),
                const Text("Welcome to Firebase Notes",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50,),
          
                //email colum
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Padding(
                    padding:const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              
              //password column
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: userEmailController,
                      decoration:const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 20,),
          
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:  TextFormField(
                      controller: userPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password, atleast 6 characters',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                 ),
               ),
                const SizedBox(height: 20,),
          
               //adding button
            //  ElevatedButton(
            //   onPressed:() async{
            //     // ignore: unused_local_variable
            //     var userName = userNameController.text.trim();
            //     var userEmail = userEmailController.text.trim();
            //     var userPassword = userPasswordController.text.trim();
          
            //     FirebaseAuth.instance.createUserWithEmailAndPassword(
            //       email: userEmail , password: userPassword).then((value)=>{
            //         signUpUser(userName, userEmail, userPassword,)
            //       });
            //   }, child: const Text('Sign Up')),
            //    const SizedBox(height: 25,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: signUp,
                child: Container( 
                  padding:EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: Center(
                    child: Text('Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 18,
                    ),),
                  )
                  ),
              ),
              ),
          
              //new member
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You our Homie? ",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  ),
                  ),
                  GestureDetector(
                    onTap: redirect,
                    child: Text("Sign in",
                    style: TextStyle(fontWeight:  FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepPurple )
                      ),
                      ),
                      ]
                  )
                ],
              ),
               
          
                
          
    
          ),
        ),
      )
    );
  }
}

