import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testasd/ui/home.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {




  @override
  void initState() {
    splashFunc();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Center(
        child: Container(color: Colors.red,)
      ),
    );
  }

  Future splashFunc() async {
    Future.delayed(const Duration(seconds: 3), () {
      getSaveDate();
    });
  }
  Future<void> getSaveDate() async {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()));
  }
}
