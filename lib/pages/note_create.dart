// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:math';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasenotes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebasenotes/style/app_style.dart';
import 'package:get/get.dart';

class NoteEditoreScreen extends StatefulWidget {
  const NoteEditoreScreen({super.key});

  @override
  State<NoteEditoreScreen> createState() => _NoteEditoreScreenState();
}

class _NoteEditoreScreenState extends State<NoteEditoreScreen> {
  // ignore: non_constant_identifier_names
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title:const Text("Add a new Note",
        style: TextStyle(color: Colors.black),),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Title'
                ),
                style: AppStyle.mainTitle,
              ),
             const SizedBox(height: 8.0,),
              Text(date, style: AppStyle.dateTitle,),
              const SizedBox(height: 28.0,),
        
              TextField(
                controller: _mainController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note content'
                ),
                style: AppStyle.mainContent,
                
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection("Notes").doc()
          .set({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": color_id,
            "userId": userId?.uid,
            // }).then((value){
            //   print(value.id);
            //   Navigator.pop(context);
              }).catchError(
                // ignore: avoid_print
                (error)=> print("Failed to add a new NOte"));
                Get.to(()=> HomeScreen());
                },

         label:const Text("save"),
          icon: const Icon(Icons.save)),
    );
  }
}