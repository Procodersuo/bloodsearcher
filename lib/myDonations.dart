import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'layoutMaker.dart';
User? cUser=FirebaseAuth.instance.currentUser;
class MyDonnerData extends StatefulWidget {
  static const String id="MyDonnerData";

  const MyDonnerData({Key? key}) : super(key: key);

  @override
  State<MyDonnerData> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<MyDonnerData> {
  @override
  Widget build(BuildContext context) {

    List<Color> colorsList = [
      Colors.yellow.shade100,
      Colors.pinkAccent.shade100,
      Colors.greenAccent.shade100,
      Colors.purpleAccent.shade100,
      Colors.cyanAccent.shade100,
      Colors.tealAccent.shade100,
      Colors.brown.shade50,
      Colors.greenAccent.shade100,
      Colors.orange.shade100,
      Colors.cyan,
      Colors.deepOrangeAccent,
      Colors.teal.shade100
    ];
    return   Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Donner's Data",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
        ),

        body: StreamBuilder(stream:FirebaseFirestore.instance.collection("Donner's Data").where("userid",isEqualTo: cUser!.uid).snapshots()
            , builder:(context, AsyncSnapshot<QuerySnapshot> snapshot)
            {

              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if(snapshot.data!.docs.isEmpty)
              {

                return  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset("assests/blood.json",repeat: true,height: 100,width: 100),
                        const Text("You have not enter data for \n donation",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 18,),),
                      ],
                    )
                );

              }
              if(snapshot.hasData)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Random random = Random();
                      Color backcolor =
                      colorsList[random.nextInt(colorsList.length)];
                      String id=snapshot.data!.docs[index].id;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Card(
                          color: backcolor,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  children: [
                                    const Text(
                                      "Name:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        snapshot.data!.docs[index]['donner name'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "City:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        snapshot.data!.docs[index]['donner city'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Blood Group:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        snapshot.data!.docs[index]['donner bloodGroup'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Phone No:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        snapshot.data!.docs[index]['donner phoneNo'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Email:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        snapshot.data!.docs[index]['email'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: ()
                                      {
                                        LayoutMaker.dialog2(context, "Are you sure to delete", () {
                                          FirebaseFirestore.instance.collection("Donner's Data").doc(id).delete();
                                        }, "yes", "no");

                                      },
                                      child: const Icon(CupertinoIcons.delete)),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Container();

            })

    );
  }
}

