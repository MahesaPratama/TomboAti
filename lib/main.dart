import 'package:aplikasi_kumpulan_doa/viewmodel/doa_api_provider.dart';
import 'package:aplikasi_kumpulan_doa/screen/splash_screen.dart';
import 'package:aplikasi_kumpulan_doa/screen/tabbar_page.dart';
import 'package:aplikasi_kumpulan_doa/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DoaApiProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          routes: {
            '/': (context) => const SplashScreen(),
            '/tabbar': (context) => const TabBarPage(),
          },
        );
      },
    );
  }
}
