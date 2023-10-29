import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pbs_admin/pages/login.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCX6CuOcmOhLBXHxWGTkUzePK4hUUT3twI",
          authDomain: "pbssystem-8e742.firebaseapp.com",
          databaseURL: "https://pbssystem-8e742-default-rtdb.firebaseio.com",
          projectId: "pbssystem-8e742",
          storageBucket: "pbssystem-8e742.appspot.com",
          messagingSenderId: "590647446037",
          appId: "1:590647446037:web:167252dadbd2e0f6f45c1c",
          measurementId: "G-681RHHNW5F"
      )
    );
  }
  else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PBS Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      // home: SubscriptionDetails(),
    );
  }
}

