import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info/screens/home_screens.dart';
import 'package:info/screens/login_screen.dart';
class UploadFile extends StatelessWidget {
  const UploadFile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Data Dukung"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Nama Alat",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 30, right: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Tipe",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 30,right: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Nomor Register",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: (){

                  },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2d8038)
                  ),
                    child: Text("Simpan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xcd05d0f3)
                  ),
                  child: Text('Clear',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),),)
                ],
              ),
            )



          ],
        ),
      ),

        );

  }
}
