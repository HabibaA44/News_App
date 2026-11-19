import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/ui/widget/custome_getSaved.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreen();
}

class _SavedScreen extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomeGetSavedarticle(title: "No Saved Articles"),
    );
  }
}