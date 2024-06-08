import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'donateScreen.dart';
import 'donnersResult.dart';
import 'layoutMaker.dart';
import 'loginScreen.dart';
import 'myDonations.dart';
User? cUser=FirebaseAuth.instance.currentUser;
class HomeScreen extends StatefulWidget {
  static const String id="HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String bloodGroup = "All";
  String cityName = "All";
  String userName = '';
  String email = '';
  String phone = '';
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    double width= mediaQuery.size.width;
    List<String> bloodGroupList = ["All", "A+", "A-","B+","B-","AB+", "AB-", "O+", "O-"];
    List<String> cityNameList = [
      "All",
      "Abbottabad",
      "Adezai",
      "Ahmed Nager",
      "Ahmadpur East",
      "Ali Khan",
      "Alipur",
      "Arifwala",
      "Attock",
      "Awaran",
      "Ayubia",
      "Badin",
      "Bahawalnagar",
      "Bahawalpur" "Banda Daud",
      "Bannu",
      "Barkhan",
      "Batkhela",
      "Battagram",
      "Bhera",
      "Bhirkan",
      "irote",
      "Burewala",
      "Chagai",
      "Chak",
      "Chakdara",
      "Chakwal",
      "Chaman",
      "Charsadda",
      "Chillianwala",
      "Chiniot",
      "Chishtian",
      "Chitral",
      "Dadu",
      "Daggar",
      "Dargai",
      "Darya Khan",
      "Daska",
      "Dera Bugti",
      "Dera Ghazi",
      "dera Ismail",
      "Digri",
      "Dina",
      "Dinga",
      "Dipalpur",
      "Diplo",
      "Dokri",
      "Doaba",
      "Dir",
      "Drosh",
      "Faisalabad",
      "Fateh Jhang",
      "Ghakhar Mandi",
      "Ghotki",
      "Gojra",
      "Gujranwala",
      "Gujrat",
      "Gujar Khan",
      "Gwadar",
      "Hafizabad",
      "Hangu",
      "Haripur",
      "Haroonabad",
      "Harnai",
      "Hasilpur",
      "Haveli",
      "Hyderabad",
      "Islamabad",
      "Islamkot",
      "Jacobabad",
      "Jamshoro",
      "Jampur",
      "Jaranwala",
      "Jattan",
      "Jhang",
      "Jhelum",
      "Jhal Magsi",
      "Jungshahi",
      "Kacchi",
      "Kandhkot",
      "Kandiaro",
      "Karachi",
      "Karor Lal",
      "Kashmore",
      "Kasur",
      "Kech",
      "Keti Bandar",
      "Khairpur",
      "Kharian",
      "Khuzdar",
      "Killa Abdullah",
      "Killa Saifullah",
      "Kohat",
      "Kohlu",
      "Kot Adu",
      "Kotri",
      "Kulachi",
      "Kurram Agency",
      "Lahore",
      "Lakki Marwat",
      "Lalamusa",
      "Larkana",
      "Latamber",
      "Layyah",
      "Lehri",
      "Liaquat Pur",
      "Lodhran",
      "Loralai",
      "Malakwal",
      "Mamoori",
      "Mailsi",
      "Mandi Bahauddin",
      "Mansehra",
      "Mardan",
      "Mastuj",
      "Mastung",
      "Matiari",
      "Mehar",
      "Mehrabpur",
      "Mian Channu",
      "Mianwali",
      "Mianwali Bangla",
      "Mingora",
      "Mirpur Khas",
      "Mithani",
      "Mithi",
      "Moro",
      "Multan",
      "Murree",
      "Muridke",
      "Muzaffargarh",
      "Nagarparkar",
      "Nankana Sahib",
      "Narowal",
      "Nasirabad",
      "Naudero",
      "Naushahro Feroze",
      "Naushara",
      "Nawabshah",
      "Nazimabad",
      "Nowshera",
      "Okara",
      "Pabbi",
      "Paharpur",
      "Pakpattan",
      "Panjgur",
      "Pattoki",
      "Peshawar",
      "Pishin valley",
      "Pir Mahal",
      "Quetta",
      "Qaimpur",
      "Qambar",
      "Qasimabad",
      "Rabwah",
      "Rahim Yar",
      "Rajanpur",
      "Ranipur",
      "Ratodero",
      "Rawalpindi",
      "Renala Khurd",
      "Rohri",
      "Sadiqabad",
      "Safdarabad",
      "Sahiwal",
      "Sakrand",
      "Sanghar",
      "Sangla Hill",
      "Sarai Alamgir",
      "Sargodha",
      "Shahbandar",
      "Shahdadkot",
      "Shahdadpur",
      "Shahpur Chakar",
      "Shakargarh",
      "Sheikhupura",
      "Shikarpaur",
      "Shewa Adda",
      "Shikarpaur",
      "Sialkot",
      "Sibi",
      "Sohawa",
      "Soianwala",
      "Sukkur",
      "Swabi",
      "Swat",
      "Tangi",
      "Tank",
      "Talagang",
      "Tando Adam",
      "Tando Allahyar",
      "Tando Muhammad",
      "Tangwani",
      "Taxila",
      "Thall",
      "Thatta",
      "Timergara",
      "Toba Tek",
      "Tordher",
      "Umerkot",
      "Vehari",
      "Wah Cantonment",
      "Warah",
      "Washuk",
      "Wazirabad",
      "Zhob",
      "Ziarat"
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("UserData")
                .where("userid", isEqualTo: cUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var name = snapshot.data!.docs[index]['username'];
                      var email = snapshot.data!.docs[index]['Email'];
                      var phone = snapshot.data!.docs[index]['phoneNo'];
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          UserAccountsDrawerHeader(
                              decoration: const BoxDecoration(
                                  color: Colors.red
                              ),
                              currentAccountPicture: const Icon(Icons
                                  .bloodtype_rounded, color: Colors.white,
                                size: 40,),
                              accountName: Text(name),
                              accountEmail: Text(email)),
                          ListTile(
                              title: Text(phone), leading: const Icon(Icons
                              .phone)),
                          InkWell(
                            onTap: () async {
                              try {
                                EasyLoading.show();
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) => EasyLoading.dismiss())
                                    .then((value) =>
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        LoginScreen.id, (route) => false));
                              } on FirebaseException catch (e) {
                                Text(e.code.toString());
                                EasyLoading.dismiss();
                              }
                            },
                            child: const ListTile(
                              title: Text("Logout"),
                              leading: Icon(Icons.logout),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, DonateScreen.id);
                            },
                            child: const ListTile(
                              title: Text("Donate"),
                              leading: Icon(Icons.bloodtype_rounded),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyDonnerData.id);
                            },
                            child: const ListTile(
                              title: Text("My Donner Data"),
                              leading: Icon(Icons.bloodtype_rounded),
                            ),
                          ),


                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              height: 20,
                              color: Colors.red,
                            ),
                          ),
                          const ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            title: Text("Developer info"),
                            leading: Icon(Icons.info),
                          ),
                          const ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            title: Text("Talha Shoaib"),
                            leading: Icon(Icons.person),
                          ),
                          const ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            title: Text("talhashoaib192@gmail.com"),
                            leading: Icon(Icons.email),
                          ),
                          const ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            title: Text("+923114795308"),
                            leading: Icon(Icons.phone_android),
                          )
                        ],
                      );
                    });
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              return Container();
            },
          )),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Blood Donner Finder", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const Text("Donate Blood \n Save Lives",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "bubble"),),
          Lottie.asset(
              "assests/blood.json", repeat: true, height: 100, width: 100),
          Center(child: LayoutMaker.text(
              "Please Select Blood Group", 20, Colors.black),),
          Padding(
            padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10):const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                  value: bloodGroup,
                  items: bloodGroupList.map<DropdownMenuItem<String>>((
                      String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                  }).toList(),
                  onChanged: (String? updateValue) {
                    setState(() {
                      bloodGroup = updateValue!;
                    });
                  }),
            ),
          ),
          Center(
            child: LayoutMaker.text("Please Select City", 20, Colors.black),),
          Padding(
            padding: width>600? EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.25,vertical: 10): const EdgeInsets.symmetric( horizontal: 40, vertical: 15),
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

                  value: cityName,
                  items: cityNameList.map<DropdownMenuItem<String>>((
                      String value1) {
                    return DropdownMenuItem(
                        value: value1,
                        child: Text(value1));
                  }).toList(),
                  onChanged: (String? updateValue1) {
                    setState(() {
                      cityName = updateValue1!;
                    });
                  }),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          LayoutMaker.button(() {
            Navigator.pushNamed(context, ResultScreen.id,
                arguments: {
                  'bloodGroup': bloodGroup,
                  'city': cityName
                });
          }, "Find", 18, Colors.red, Colors.white),
        ],
      ),
    );
  }
}
