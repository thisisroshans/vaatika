import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrksh_vaatika/pages/home.dart';
import 'package:vrksh_vaatika/pages/login.dart';
import 'package:vrksh_vaatika/pages/plant_detail.dart';
import 'package:vrksh_vaatika/pages/profile.dart';
import 'package:vrksh_vaatika/provider/auth_provider.dart';
import 'package:vrksh_vaatika/provider/homeprovider.dart';
import 'package:vrksh_vaatika/provider/profile_provider.dart';

import 'provider/plant_detail_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          child: HomePage(),
          create: (c) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          child: PlantDetailPage(),
          create: (c) => PlantDetailProvider(c),
        ),
        ChangeNotifierProvider(
          child: LoginPage(),
          create: (c) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          child: ProfilePage(),
          create: (c) => ProfileProvider(c),
        )
      ],
      child: MaterialApp(
        title: 'Vrksh Vaatika',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}