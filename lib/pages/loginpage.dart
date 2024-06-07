// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasenotes/pages/home_page.dart';
import 'package:firebasenotes/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

//text controller
Future redirect() async{
   Get.to(()=>(SignupPage()));
}

final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();

Future signIn() async{
  
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text.trim(), 
    password: _passwordcontroller.text.trim() );
    Get.to(()=>HomeScreen());
}
@override
void dispose(){
  _emailcontroller.dispose();
  _passwordcontroller.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          
               Text("Hey there! ^_^ ",
              style: GoogleFonts.bebasNeue(
                fontSize: 50
              ),
            ),
            SizedBox(height: 15,),
            Text("Welcome again, We've missed you :( ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            
            //email column
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email" 
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
          
            //password colmn
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container( decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password"
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: signIn,
                child: Container( 
                  padding:EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: Center(
                    child: Text('Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 18,
                    ),),
                  )
                  ),
              ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" Wanna join us? ",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  ),
                  ),
                  GestureDetector(
                    onTap: redirect,
                    child: Text("Register Now!",
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

    )
    ),
    );


  }
}