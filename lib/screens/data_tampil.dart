import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info/screens/login_screen.dart';
import 'package:info/screens/upload_file.dart';
class DataTampil extends StatefulWidget {
  const DataTampil({super.key});

  @override
  State<DataTampil> createState() => _DataTampilState();
}

class _DataTampilState extends State<DataTampil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Tampil',
        ),
       actions: [

         IconButton(onPressed: (){
           Navigator.push(context,
           MaterialPageRoute(builder: (context)=> UploadFile()));
         },
         icon: const Icon(Icons.upload_file),)
       ],
      ),
    );
  }
}
