import 'package:flutter/material.dart';
import 'package:stock_square_app/splash_screen.dart';
import 'package:provider/provider.dart';

import 'news_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => NewsProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
