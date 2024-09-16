import 'package:flutter/material.dart';
import 'package:mostbet_3/core/extensions/expanded_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/mediaquery_ext_on_context.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';
import 'matches_screen.dart';
import 'news_screen.dart';
import 'quiz_page.dart';
import 'package:mostbet_3/screens/settings_screen.dart';
import 'package:mostbet_3/gen/assets.gen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  final tabs = [
    const MatchesPage(),
    const NewsPage(),
    const QuizPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff003266),
      body: Column(
        children: [
          tabs[currentTab].expanded(),
          Container(
            width: double.maxFinite,
            height: 55 + context.padding.bottom,
            decoration: const BoxDecoration(
              color: Color(0xffFB4E01),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Container(
                    height: 47,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.matches
                            .image(
                              height: 24,
                              fit: BoxFit.fitHeight,
                              color: 0 == currentTab
                                  ? const Color(0xFF003A79)
                                  : const Color(0xFFFAFAFA),
                            )
                            .paddingOnly(bottom: 4),
                        Text(
                          "Matches",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: 0 == currentTab
                                ? const Color(0xFF003A79)
                                : const Color(0xFFFAFAFA),
                            fontSize: 10,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ).expanded(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  child: Container(
                    height: 47,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.news
                            .image(
                              height: 24,
                              fit: BoxFit.fitHeight,
                              color: 1 == currentTab
                                  ? const Color(0xFF003A79)
                                  : const Color(0xFFFAFAFA),
                            )
                            .paddingOnly(bottom: 4),
                        Text(
                          "News",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: 1 == currentTab
                                ? const Color(0xFF003A79)
                                : const Color(0xFFFAFAFA),
                            fontSize: 10,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ).expanded(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  child: Container(
                    height: 47,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.quiz
                            .image(
                              height: 24,
                              fit: BoxFit.fitHeight,
                              color: 2 == currentTab
                                  ? const Color(0xFF003A79)
                                  : const Color(0xFFFAFAFA),
                            )
                            .paddingOnly(bottom: 4),
                        Text(
                          "Quiz",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: 2 == currentTab
                                ? const Color(0xFF003A79)
                                : const Color(0xFFFAFAFA),
                            fontSize: 10,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ).expanded(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 3;
                    });
                  },
                  child: Container(
                    height: 47,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.settings
                            .image(
                              height: 24,
                              fit: BoxFit.fitHeight,
                              color: 3 == currentTab
                                  ? const Color(0xFF003A79)
                                  : const Color(0xFFFAFAFA),
                            )
                            .paddingOnly(bottom: 4),
                        Text(
                          "Settings",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: 3 == currentTab
                                ? const Color(0xFF003A79)
                                : const Color(0xFFFAFAFA),
                            fontSize: 10,
                            fontFamily: 'SF UI Display',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ).expanded(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
