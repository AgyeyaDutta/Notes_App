// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasenotes/Pages/note_reader.dart';
import 'package:firebasenotes/pages/loginpage.dart';
import 'package:firebasenotes/pages/note_create.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebasenotes/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  User? userId= FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 14, 25),
      appBar: AppBar(
        title: const Text("FireNotes"),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Get.to(()=> LoginPage());
              },
              child: Icon(Icons.logout),
          )
        ],
        titleTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 14, 25)
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Recent Notes",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ), 
          ),
           const SizedBox( 
            height: 20.0,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Notes").
                  where('userId', isEqualTo: userId?.uid).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
               if (snapshot.hasData) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var note = snapshot.data!.docs[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NoteReaderScreen(note, userId: '',),
                ));
              },
              child: Card(
                color: Color.fromARGB(255, 181, 165, 236),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note['note_title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            note['note_content'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      Text(
                        note['creation_date'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
                return Text("There are no Notes", style: GoogleFonts.nunito(color: Colors.white),);
            
              },
              ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(()=> NoteEditoreScreen());
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NoteEditoreScreen()));
        },
        label:const Text("Add Notes"),
        icon: const Icon(Icons.add)),
    );
  }
}