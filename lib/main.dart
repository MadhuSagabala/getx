import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: Messages(),
      fallbackLocale: Locale('en', 'US'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

int selectindex = 0;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ToggleSwitch(
            totalSwitches: 2,
            initialLabelIndex: selectindex,
            labels: ['ENG', 'TEL'],
            activeBgColor: [Colors.teal],
            onToggle: (index) {
              if (index == 0) {
                final locale = Locale('en', 'Us');
                Get.updateLocale(locale);
                setState(() {
                  selectindex = 0;
                });
              } else if (index == 1) {
                final locale = Locale('tel', 'TE');
                Get.updateLocale(locale);
                setState(() {
                  selectindex = 1;
                });
              }
            },
          )
        ],
      ),
      body: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'welcome'.tr,
              style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent),
            ),
          ),
          TextButton.icon(
              style: ButtonStyle(),
              iconAlignment: IconAlignment.end,
              icon: Icon(
                size: 30,
                Icons.forward,
                color: Colors.teal,
              ),
              onPressed: () {},
              label: Text(
                'Get Started',
                style: TextStyle(fontSize: 24, color: Colors.teal),
              ))
        ],
      ),
    );
  }
}

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'welcome',
        },
        'tel_TE': {
          'welcome': 'స్వాగతం',
        }
      };
}
