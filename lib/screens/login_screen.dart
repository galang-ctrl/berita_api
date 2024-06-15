import 'package:flutter/material.dart';
import 'package:info/provider/auth_provider.dart';
import 'package:info/widget/textfield/textfield_email_widget.dart';
import 'package:info/widget/textfield/textfield_pass_widget.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthLogg>(context);
       return Scaffold(
         body: Container(
           child: SafeArea(
             child: SingleChildScrollView(
               scrollDirection: Axis.vertical,
               child: Stack(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         padding: EdgeInsets.only(top: 12, left: 130),
                         child: Text('News API',
                             style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 30,
                                 fontWeight: FontWeight.bold)),),
                       Container(
                         padding: EdgeInsets.only(top: 1, left: 110),
                         child: Image.asset("images/bgftl.png",
                           height: 150,
                           width: 150,),
                       ),
                       Container(
                         margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                         child: Form(
                           key: loadAuth.form,
                           child: Column(
                             children: [
                               Text(loadAuth.islogin ? "Silahkan Login" : "Register Akun",
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 25, color: Colors.brown),),
                               const SizedBox( height: 15,),
                               TextfieldEmailWidget(controller: email),
                               const SizedBox( height: 15,),
                               TextfieldPassWidget(controller: password),
                               const SizedBox(
                                 height: 10,
                               ),
                               Container(
                                 padding: EdgeInsets.only(top: 10),
                                 height: 60,
                                 width: 300,
                                 child: ElevatedButton(onPressed: (){
                                   loadAuth.submit();
                                 },style: ElevatedButton.styleFrom(
                                     backgroundColor: Color(0xffeeb82c)
                                 ),
                                   child: Text(loadAuth.islogin ? "Log-In" : "Register",
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 22,
                                         color: Colors.black),
                                   ),
                                 ),
                               ),
                               const SizedBox(height: 20,),
                               TextButton(onPressed: (){
                                 setState(() {
                                   loadAuth.islogin = !loadAuth.islogin;
                                 });
                               }, child: Text(loadAuth.islogin ? "Buat Akun Baru" : "Sudah Punya Akun")),
                             ],
                           ),
                         ),
                       )

                     ],
                   )
                 ],
               ),
       ),
    ),
         ),

       );

  }
}
