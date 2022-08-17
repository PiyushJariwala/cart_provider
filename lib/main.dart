
import 'package:cart_provider/providers/phone_provider.dart';
import 'package:cart_provider/providers/theme_provider.dart';
import 'package:cart_provider/screen/home_page.dart';
import 'package:cart_provider/screen/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PhoneProvider>(create: (context)=> PhoneProvider(),),
        ChangeNotifierProvider<ThemeProvider>(create: (context)=> ThemeProvider(),),
      ],
      builder: (context, _) => MaterialApp(
        title: 'cart_provider',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          '/second': (context) => SecondPage(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black87
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).isDark==false)?ThemeMode.light:ThemeMode.dark,
      ),
    ),
  );
}
