import 'package:flutter/material.dart';

import '../../config/base_color.dart';
import '../../constants/app_text_style.dart';
import '../../core/custom_library/salomon_bottom_bar_new.dart';
import '../account/account_screen.dart';
import '../favorites/favorites_screen.dart';
import 'body_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  Widget setBodyByIndex() {
    switch (_currentIndex) {
      case 0:
        return const BodyHome();
      case 1:
        return const FavoritesScreen();
      case 2:
        return const AccountScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuColors.black,
      body: SafeArea(
        child: setBodyByIndex(),
      ),
      bottomNavigationBar: SalomonBottomBarNew(
        margin: const EdgeInsets.all(16),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarNewItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? LuColors.purple : LuColors.white,
            ),
            title: const Text(
              'Trang chủ',
              style: LuStyle.textXSmallBold,
            ),
            selectedColor: LuColors.purple,
          ),
          SalomonBottomBarNewItem(
            icon: Icon(
              Icons.favorite_border,
              color: _currentIndex == 1 ? LuColors.pink : LuColors.white,
            ),
            title: const Text(
              'Yêu thích',
              style: LuStyle.textXSmallBold,
            ),
            selectedColor: LuColors.pink,
          ),
          SalomonBottomBarNewItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2 ? LuColors.teal : LuColors.white,
            ),
            title: const Text(
              'Tài khoản',
              style: LuStyle.textXSmallBold,
            ),
            selectedColor: LuColors.teal,
          ),
        ],
      ),
    );
  }
}
