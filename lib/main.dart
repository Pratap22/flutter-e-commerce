import 'package:e_commerce/constants/theme.dart';
import 'package:e_commerce/helpers/firebase_auth.dart';
import 'package:e_commerce/helpers/firebase_options.dart';
import 'package:e_commerce/provider/app_provider.dart';
import 'package:e_commerce/screens/auth/welcome/welcome.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LWP e-Commerce',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const Welcome();
            }
          },
        ),
      ),
    );
  }
}
