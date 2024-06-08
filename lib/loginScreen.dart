import 'package:bloodsearcher/sigunScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'HomeScreen.dart';
import 'layoutMaker.dart';
class LoginScreen extends StatelessWidget {
  static String id="LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    double width=mediaQuery.size.width;
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Login",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Donate Blood \n Save Lives",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "bubble"),),
          Lottie.asset("assests/blood.json",repeat: true,height: 100,width: 100),

          const Text("Please Enter Email",style: TextStyle(color: Colors.black,fontSize: 20),),
          Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child:  LayoutMaker.textField(email, "someone@gmail.com", TextInputType.emailAddress, false)),
          const SizedBox(
            height: 20,
          ),
          const Text("Please Enter Your Password",style: TextStyle(color: Colors.black,fontSize: 20),),
          Padding(padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10):const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child:  LayoutMaker.textField(password, "Password", TextInputType.visiblePassword, true)),
          const SizedBox(
            height: 10,
          ),
          LayoutMaker.button(() {
            login(email.text.toString(),password.text.toString(),context);
          }, "Signin", 15,Colors.red, Colors.white),
          const SizedBox(
            height: 10,
          ),
          RichText(text: const TextSpan( text: "Don't have any account ? ",
            style: TextStyle(color: Colors.black,fontSize: 15), ),
          ),
          InkWell(
              onTap: ()
              {
                Navigator.pushNamedAndRemoveUntil(context, SignupScreen.id, (route) => false);
              },
              child: const Text("Sign-up",style: TextStyle(color: Colors.red,fontSize: 15),))
        ],
      ) ,
    );
  }
  Future<void> login(String email,String password,BuildContext context)
  async {
    if(email.toString().isEmpty || password.toString().isEmpty)
    {
      LayoutMaker.dialog(context, "Please Fill All The Fields", () {
        Navigator.pop(context);
      }, "ok");
    }
    else {
      try {
        EasyLoading.show();
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password).then((value) => EasyLoading.dismiss())
            .then((value) => Navigator.pushNamed(context, HomeScreen.id));
      }
      on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        LayoutMaker.dialog(context, e.code.toString(), () {
          Navigator.pop(context);
        }, "OK");
      }
    }
  }
}
