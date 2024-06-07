// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasenotes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebasenotes/style/app_style.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NoteEditorScreen extends StatefulWidget {
  NoteEditorScreen(this.doc, {super.key, required this.userId});
  QueryDocumentSnapshot doc;
  final String userId;

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.doc["note_title"]);
    _contentController = TextEditingController(text: widget.doc["note_content"]);
  }

  void _saveChanges() async {
    await FirebaseFirestore.instance
        .collection('Notes')
        .doc(widget.doc.id)
        .update({
      'note_title': _titleController.text,
      'note_content': _contentController.text,
    });

  
    Get.snackbar('Success', 'Note updated successfully', snackPosition: SnackPosition.BOTTOM);

  
    Get.offAll(() => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
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
              TextField(
                controller: _titleController,
                style: AppStyle.mainTitle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Title',
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                widget.doc["creation_date"],
                style: AppStyle.dateTitle,
              ),
              const SizedBox(height: 28.0),
              TextField(
                controller: _contentController,
                style: AppStyle.mainContent,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Content',
                ),
                maxLines: null,
              ),
            ],
          ),
        )
      ),
    );
  }
}