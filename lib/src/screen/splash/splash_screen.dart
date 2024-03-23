import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/base_color.dart';
import '../../config/routers/name_router.dart';
import '../../gen/assets.gen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushNamed(context, NameRouter.LOGIN_SCREEN);
      context.push('/${NameRouter.LOGIN_SCREEN}',
          extra: TestClass(test: 'aaaaa', test2: 'bbbbbbbbb'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.imagesSplashImgSplash.image(),
        ],
      ),
    );
  }
}
