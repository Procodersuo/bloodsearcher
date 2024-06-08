import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ResultScreen extends StatefulWidget {
  static const String id="ResultScreen";
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments=ModalRoute.of(context)!.settings.arguments as Map;
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
    String bloodGroup=arguments['bloodGroup'];
    String city=arguments['city'];
    Stream<QuerySnapshot> myStream()
    {
      if(bloodGroup=="All"&&city=="All")
      {
        return FirebaseFirestore.instance.collection("Donner's Data").snapshots();
      }
      else if(bloodGroup=="All"&&city!="All")
      {
        return FirebaseFirestore.instance.collection("Donner's Data").where("city",isEqualTo: city).snapshots();
      }
      else if(bloodGroup!="All"&&city=="All")
      {
        return FirebaseFirestore.instance.collection("Donner's Data").where("bloodGroup",isEqualTo: bloodGroup).snapshots();
      }
      else if(bloodGroup!="All"&&city!="All")
      {
        return FirebaseFirestore.instance.collection("Donner's Data").where("city",isEqualTo: city).where("bloodGroup",isEqualTo:bloodGroup).snapshots();
      }
      else
      {
        return FirebaseFirestore.instance.collection("Donner's Data").snapshots();
      }

    }
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

        body: StreamBuilder(stream:myStream()
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
                        const Text("Sorry!!!  We Currently Don't have any donner\n for this filter",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 18,),),
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
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap:()
                                      async {
                                        // String phone=snapshot.data!.docs[index]['donner phoneNo'];
                                        //

                                      },
                                      child: const Icon(CupertinoIcons.phone_arrow_up_right)),
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