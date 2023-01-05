import 'package:etornam_vpn/screens/home_page.dart';
import 'package:etornam_vpn/screens/shared_widgets/server_selection.dart';
import 'package:etornam_vpn/utils/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ServerSelectionData serverSelectionData = new ServerSelectionData(flagAsset: "", label:"");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etornam VPN',
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(context),
      darkTheme: customDarkTheme(context),
      themeMode: ThemeMode.system,
      home: HomePage(
        data: serverSelectionData,
      )
      //home: HomePage(),
    );
  }
}
