import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'HomeScreen.dart';
import 'layoutMaker.dart';
import 'loginScreen.dart';
User? cUser=FirebaseAuth.instance.currentUser;
class SignupScreen extends StatelessWidget {
  static String id="SignUpScreen";
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    double width=mediaQuery.size.width;
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController name=TextEditingController();
    TextEditingController phoneNo=TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Signup To Save Lives",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Lottie.asset("assests/blood.json",repeat: true,height: 100,width: 100),
            const Text("Please Enter Your Name",style: TextStyle(color: Colors.black,fontSize: 20),),
            Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child:  LayoutMaker.textField(name, "Enter Your Name", TextInputType.name, false)),
            const Text("Please Enter PhoneNo",style: TextStyle(color: Colors.black,fontSize: 20),),
            Padding(padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10):const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child:  LayoutMaker.textField(phoneNo, "+92311111111", TextInputType.phone, false)),
            const Text("Please Enter Email",style: TextStyle(color: Colors.black,fontSize: 20),),
            Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child:  LayoutMaker.textField(email, "someone@gmail.com", TextInputType.emailAddress, false)),
            const Text("Please Enter Your Password",style: TextStyle(color: Colors.black,fontSize: 20),),
            Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child:  LayoutMaker.textField(password, "Password", TextInputType.visiblePassword, true)),
            const SizedBox(
              height: 10,
            ),
            LayoutMaker.button(() {
              login(name.text.toString(),email.text.toString(),password.text.toString(),context,phoneNo.text.toString());
            }, "Sign Up", 15,Colors.red, Colors.white),
            const SizedBox(
              height: 10,
            ),
            RichText(text: const TextSpan( text: "Already have an account ? ",
              style: TextStyle(color: Colors.black,fontSize: 15), ),),
            InkWell(
                onTap: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                },
                child: const Text("Login",style: TextStyle(color: Colors.red,fontSize: 15),))
          ],
        ),
      ) ,
    );
  }
  Future<void> login(String name,String email,String password,BuildContext context,String phone)
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password).then((value) => FirebaseFirestore.instance.collection("UserData").doc(cUser!.uid).set(
            {
              'username':name,
              'Email':email,
              'phoneNo':phone,
              'userid':cUser!.uid,
            }
        )
        ).then((value) => EasyLoading.dismiss())
            .then((value) => Navigator.pushNamed(context, HomeScreen.id));
      }
      on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        LayoutMaker.dialog(context, e.code.toString(), () {

          Navigator.pop(context);
        }, 'OK');
      }
    }
  }
}
