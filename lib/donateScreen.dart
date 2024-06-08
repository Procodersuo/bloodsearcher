import 'package:bloodsearcher/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'layoutMaker.dart';
User? cUser=FirebaseAuth.instance.currentUser;
class DonateScreen extends StatefulWidget {
  static String id="DonateScreen";
  const DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    double width=mediaQuery.size.width;
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phoneNo = TextEditingController();


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Donate Blood ", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<ProviderScreen>(builder: (context, p, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Lottie.asset(
                    "assests/blood.json", repeat: true, height: 80, width: 80),
                const Text("Please Enter Your Name",
                  style: TextStyle(color: Colors.black, fontSize: 15),),
                Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                    child: LayoutMaker.textField(
                        name, "Enter Your Name", TextInputType.name, false)),
                const Text("Please Enter PhoneNo",
                  style: TextStyle(color: Colors.black, fontSize: 15),),
                Padding(padding:width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                    child: LayoutMaker.textField(
                        phoneNo, "+92311111111", TextInputType.phone, false)),
                const Text("Please Enter Email",
                  style: TextStyle(color: Colors.black, fontSize: 15),),
                Padding(padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10):const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                    child: LayoutMaker.textField(
                        email, "someone@gmail.com", TextInputType.emailAddress,
                        false)),
                Center(child: LayoutMaker.text(
                    "Please Select Blood Group", 15, Colors.black),),
                Padding(
                  padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 15):const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    child: DropdownButton<String>(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        enableFeedback: false,
                        focusColor: Colors.white,
                        underline: Container(),
                        value: p.bloodGroupD,
                        items: p.bloodGroupList.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value));
                        }).toList(),
                        onChanged: (String? updateValue) {
                          p.bloodGroupUpdate(updateValue!);
                        }),
                  ),
                ),
                Center(child: LayoutMaker.text(
                    "Select City or Nearest One", 15, Colors.black),),
                Padding(
                  padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25):const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    child: DropdownButton<String>(
                        hint: const Text("City Or Nearest One"),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        enableFeedback: false,
                        focusColor: Colors.white,
                        underline: Container(),

                        value: p.city,
                        items: p.cityNameList.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value));
                        }).toList(),
                        onChanged: (String? updateValue) {
                          p.cityUpdater(updateValue!);
                        }),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                LayoutMaker.button(() {
                  addData(name.text.toString(), phoneNo.text.toString(),
                      email.text.toString(), p.bloodGroupD.toString(), p.city.toString());
                }, "Donate", 15, Colors.red, Colors.white),
                const SizedBox(
                  height: 10,
                ),

              ],
            );
          },),
        )


    );
  }

  Future<void> addData(String name, String phoneNo, String email,
      String bloodGroup, String city) async {
    if (name
        .toString()
        .isEmpty || phoneNo
        .toString()
        .isEmpty || email
        .toString()
        .isEmpty) {
      LayoutMaker.dialog(context, "Please Fill ALL Data", () {
        Navigator.pop(context);
      }, "ok");
    }
    else {
      try {
        EasyLoading.show();
        await FirebaseFirestore.instance.collection("Donner's Data").doc().set({
          "donner name": name,
          'donner phoneNo': phoneNo,
          'email': email,
          "donner bloodGroup": bloodGroup,
          "donner city": city,
          "userid": cUser!.uid
        }).then((value) => EasyLoading.dismiss()).then((value) =>
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false));
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