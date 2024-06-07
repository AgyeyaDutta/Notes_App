// // ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebasenotes/pages/note_editor.dart';
// import 'package:flutter/material.dart';
// import 'package:firebasenotes/style/app_style.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class NoteReaderScreen extends StatefulWidget {
//   NoteReaderScreen(this.doc, {super.key, required String userId});
//   QueryDocumentSnapshot doc;

//   @override
//   State<NoteReaderScreen> createState() => _NoteReaderScreenState();
// }

// class _NoteReaderScreenState extends State<NoteReaderScreen> {
  
//  User? userId = FirebaseAuth.instance.currentUser; 
//   @override
//   Widget build(BuildContext context) {
//     int color_id = widget.doc['color_id'];
//     return Scaffold(
//       backgroundColor: AppStyle.cardsColor[color_id],
//       appBar: AppBar(
//         title: const Text('Note'),
//         actions: [
//           GestureDetector(
//             onTap: (){
//               /Get.to(()=> NteEitorScr7yueen(doc, userId: userId?.uid ?? ''),
//       );fd
//             },
//             child: Icon(Icons.edit_note),
//           )
//         ],
//         titleTextStyle: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 20),
//           backgroundColor: AppStyle.cardsColor[color_id],
//         elevation: 0.0,
//       ),
//       body:  SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
        
//               Text(
//                 widget.doc["note_title"],
//                 style: AppStyle.mainTitle,
//                 overflow: TextOverflow.visible,
//                 maxLines: null,
//                 ),
                
//                 const SizedBox(height: 4.0,),
        
//               Text(
//                 widget.doc["creation_date"],
//                 style: AppStyle.dateTitle),
//                 const SizedBox(height: 28.0,),
        
        
//               Text(
//                 widget.doc["note_content"],
//                 style: AppStyle.mainContent,
//                 overflow: TextOverflow.visible,
//                  maxLines: null,),
//             ],
//           ),
//         ),
//       ),


//     //adding buttons

    
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasenotes/pages/home_page.dart';
import 'package:firebasenotes/pages/note_editor.dart';
import 'package:flutter/material.dart';
import 'package:firebasenotes/style/app_style.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key, required this.userId});
  QueryDocumentSnapshot doc;
  final String userId;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
  void _deleteNote() async {
    await FirebaseFirestore.instance
        .collection('Notes')
        .doc(widget.doc.id)
        .delete();
    
    Get.snackbar('Deleted', 'Note successfully deleted', snackPosition: SnackPosition.BOTTOM);
    
    Get.offAll(() => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
  
      appBar: AppBar(
        title: const Text('Note'),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => NoteEditorScreen(widget.doc, userId: userId?.uid ?? ''));
            },
            child: Icon(Icons.edit_note),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteNote,
),

        ],
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
                style: AppStyle.mainTitle,
                overflow: TextOverflow.visible,
                maxLines: null,
              ),
              const SizedBox(height: 4.0),
              Text(
                widget.doc["creation_date"],
                style: AppStyle.dateTitle,
              ),
              const SizedBox(height: 28.0),
              Text(
                widget.doc["note_content"],
                style: AppStyle.mainContent,
                overflow: TextOverflow.visible,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
