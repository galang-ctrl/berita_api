import 'package:flutter/material.dart';
import 'package:info/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldPassWidget extends StatefulWidget {
  const TextfieldPassWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextfieldPassWidget> createState() => _TextfieldPassWidget();
}

class _TextfieldPassWidget extends State<TextfieldPassWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthLogg>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        const SizedBox( height: 20,),
        TextFormField(
          controller: widget.controller ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          validator: (value) {
            if(value!.trim().isEmpty || value == ""){
              return "Password Tidak Boleh Kosong";
            }else if(value.trim().length < 6) {
              return "Minimal Password 6 karakter";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredPassword = value!;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Masukkan Password..",
            suffixIcon: IconButton(onPressed: (){
              setState(() {
                obscureText = !obscureText;
              });

            },
                icon: const Icon(Icons.remove_red_eye_rounded)),
          ),
        )
      ],
    );
  }
}
