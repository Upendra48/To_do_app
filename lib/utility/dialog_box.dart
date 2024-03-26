// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/utility/my_buttons.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback OnSave;
  final VoidCallback OnCancel;

  // ignore: prefer_const_constructors_in_immutables
  DialogBox({
    Key? key, // Added 'Key' parameter for the constructor
    required this.controller,
    required this.OnSave,
    required this.OnCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 248, 242, 235),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input for task name
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter task name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),

                ),
                
              ),
            ),

            // Buttons: Save and Cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(text: "Save", onPressed: OnSave),

                const SizedBox(width: 10),

                // Cancel button
                MyButton(text: "Cancel", onPressed: OnCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
