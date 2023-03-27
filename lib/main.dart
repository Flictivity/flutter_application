import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/auth/service.dart';
import 'package:flutter_application/landing.dart';
import 'package:flutter_application/pages/authPage.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/iphonePage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppThemeMaterial());
}

class AppThemeMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        routes: {
          '/':(context) => const LandingPage(),
          '/auth':(context) => const AuthPage(),
          '/home':(context) => const Home(),
          '/iphone':(context) => const IphonePage(),
          '/landing':(context) => const LandingPage()
        },
        
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
