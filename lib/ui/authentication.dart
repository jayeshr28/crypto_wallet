import 'package:crypto_wallet/firebase/flutterfire.dart';
import 'package:crypto_wallet/ui/home_page.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xF5E9D4E9),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            // Image.asset(""),
            SizedBox(height: 10,),
            TextFormField(
              controller: _emailController,
              decoration:const  InputDecoration(
                hintText: "example@gmail.com",
                hintStyle: TextStyle(color: Colors.blueGrey),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration:const  InputDecoration(

                hintText: "password",
                hintStyle: TextStyle(color: Colors.blueGrey),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: width*0.8,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(onPressed: () async {
                bool shouldNavigate = await register(_emailController.text, _passwordController.text);
              if(shouldNavigate){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
                },
                child: Text("Register", style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: width*0.8,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(onPressed: () async{
                bool shouldNavigate = await signIn(_emailController.text, _passwordController.text);
                if(shouldNavigate){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
                child: Text("Login", style: TextStyle(color: Colors.white),),
              ),
            ),


          ],
        )
      ),
    );
  }
}
