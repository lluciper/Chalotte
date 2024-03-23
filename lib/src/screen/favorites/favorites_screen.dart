import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/base_color.dart';
import '../../constants/app_text_style.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: LuColors.black,
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Mục yêu thích',
                  textAlign: TextAlign.left,
                  style: LuStyle.displayMediumBold.white,
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                   BoxShadow(
                      color: LuColors.red.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          width: 136,
                          height: 136,
                          imageUrl:
                              'https://img.freepik.com/free-vector/hand-drawn-emotes-element-collection_23-2149926869.jpg?t=st=1710837003~exp=1710837603~hmac=314b33e93a3e99fe05e3784196c98c0efdb1e613891a17e7af47e029425cac6a',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Column(
                      children: [],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
