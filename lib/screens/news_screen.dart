import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mostbet_3/app/navigator/navigator.dart';
import 'package:mostbet_3/core/data/news_data.dart';
import 'package:mostbet_3/core/extensions/align_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/mediaquery_ext_on_context.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';
import 'detail_news_screen.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(8, 40 + context.padding.top, 8, 25),
      children: [
        const Text(
          'NEWS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w600,
          ),
        ).paddingOnly(bottom: 30).align(),
        ...List.generate(
          news.length,
          (index) {
            final item = news[index];
            return GestureDetector(
              onTap: () {
                AppNavigator.push(context, page: DetailNewsPage(item: item));
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFFE84E0F)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: CachedNetworkImage(
                        imageUrl: item.imgUrl,
                        cacheKey: item.imgUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 200,
                      ),
                    ).paddingOnly(bottom: 8),
                    const Text(
                      'NEWS',
                      style: TextStyle(
                        color: Color(0xFFA2A5B1),
                        fontFamily: 'Montserrat',
                      ),
                    ).paddingOnly(bottom: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ).paddingOnly(bottom: 30);
          },
        ),
      ],
    );
  }
}
