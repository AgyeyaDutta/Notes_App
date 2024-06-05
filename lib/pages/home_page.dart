import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasenotes/pages/note_editor.dart';
import 'package:firebasenotes/pages/note_reader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:firebasenotes/style/app_style.dart';
import 'package:firebasenotes/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 14, 25),
      appBar: AppBar(
        title: const Text("FireNotes"),
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
                  FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData){
                  return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: snapshot.data!.docs
                  .map((note)=> noteCard(() {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=> NoteReaderScreen(note),));
                  }, note))
                  .toList(),
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NoteEditoreScreen()));
        },
        label:const Text("Add Note"),
        icon: const Icon(Icons.add)),
    );
  }
}