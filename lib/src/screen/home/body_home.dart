import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../../config/base_color.dart';
import '../../constants/app_text_style.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final List<String> items = [
    '759 You should wrap your Container in a Flexible to let your Row know that its ok for the Container to be narrower than its intrinsic width',
    'asdasda\nsdasdas',
    'Item 3 with long text',
    'asdasda',
    'Item 5 with long text \n fdsfsdfdsfdsf \nsdfsdfsd',
    'Item \nsdfsdfsd',
    'Item 5 with long text \n fdsfsdfdsfdsf \nsdfsdfsd',
    'Item 5 with long text \n fdsfsdfdsfdsf \nsdfsdfsd',
    'Item 5 with long text \n fdsfsdfdsfdsf \nsdfsdfsd',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(8).copyWith(bottom: 0),
      color: LuColors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: Text(
                'Đề xuất',
                textAlign: TextAlign.left,
                style: LuStyle.displayMediumBold.white,
              ),
            ),
            const Gap(16),
            MasonryGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: LuColors.red.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
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
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'name char',
                          textAlign: TextAlign.left,
                          style: LuStyle.textMediumBold,
                        ),
                      ),
                      const Gap(4),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          items[index],
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: LuStyle.textSmall,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
