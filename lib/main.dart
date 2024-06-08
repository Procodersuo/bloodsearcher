import 'package:bloodsearcher/provider.dart';
import 'package:bloodsearcher/sigunScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'donateScreen.dart';
import 'donnersResult.dart';
import 'firebase_options.dart';
import 'loginScreen.dart';
import 'myDonations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

User? user = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderScreen(),
      child: MaterialApp(
        initialRoute: user != null ? HomeScreen.id : LoginScreen.id,
        builder: EasyLoading.init(),
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          ResultScreen.id: (context) => const ResultScreen(),
          DonateScreen.id: (context) => const DonateScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignupScreen.id: (context) => const SignupScreen(),
          MyDonnerData.id: (context) => const MyDonnerData()
        },
      ),
    );
  }
}
