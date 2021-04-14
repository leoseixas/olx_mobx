import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:olx_mobx/stores/page_store.dart';
import 'package:olx_mobx/stores/user_manager_store.dart';
import 'package:olx_mobx/screens/base/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(AppWidget());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'fLO86x2ranAZxy91ISCKvAgfeowrCePTCusj52aR',
    'https://parseapi.back4app.com/',
    clientKey: 'DzuvyggirlFCdKHUy4MDBbcsKQPrGGE3by5m6ZZe',
    autoSendSessionId: true,
    debug: true,
  );
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),
      home: BaseScreen(),
    );
  }
}
