import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../config/base_color.dart';
import '../../config/routers/name_router.dart';
import '../../gen/assets.gen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: LuColors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(58),
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  color: LuColors.grey,
                  borderRadius: BorderRadius.circular(58),
                ),
              ),
              const Gap(16),
              const Text(
                'Name',
                style: TextStyle(color: LuColors.white),
              ),
              const Gap(58),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) {
                  return const Gap(16);
                },
                itemBuilder: (context, index) {
                  return ItemFeatureAccount(
                    label: 'name',
                    icon: Assets.iconsLogOut.svg(),
                    onTap: () {
                      context.pop();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemFeatureAccount extends StatelessWidget {
  const ItemFeatureAccount({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  final String label;
  final SvgPicture icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: LuColors.red.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Row(
            children: [
              icon,
              const Gap(8),
              Text(
                label,
                style: const TextStyle(
                  color: LuColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
