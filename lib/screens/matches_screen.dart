import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mostbet_3/app/navigator/navigator.dart';
import 'package:mostbet_3/core/extensions/align_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/expanded_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';
import 'package:mostbet_3/data/apis/matches_api.dart';
import 'package:mostbet_3/data/models/match.dart';
import 'detail_match_page.dart';
import 'package:mostbet_3/gen/assets.gen.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  List<Match> data = [];

  Future<void> init() async {
    try {
      data = await MatchesApi().getMatches(DateTime.now());
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 200,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Assets.images.matchesHeader.image(
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Matches',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ).paddingAll(16),
            ],
          ),
        ),
        if (data.isEmpty)
          const CircularProgressIndicator().paddingOnly(top: 200).align()
        else
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final match = data[index];
              return Container(
                constraints: const BoxConstraints(minHeight: 160),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFFE84E0F)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl: match.htLogo,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ).paddingOnly(bottom: 10),
                            Text(
                              match.htTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 3,
                              ),
                              textAlign: TextAlign.center,
                            ).paddingOnly(bottom: 2),
                            const Text(
                              "Home",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ).expanded(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              match.leagueName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFE84E0F),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.07,
                              ),
                            ).paddingOnly(bottom: 8),
                            const Text(
                              '10 week',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.06,
                              ),
                            ).paddingOnly(bottom: 8),
                            Text(
                              '${match.hGoals}:${match.aGoals}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFE84E0F),
                                fontSize: 34,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                letterSpacing: 8.50,
                              ),
                            )
                          ],
                        ).expanded(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl: match.atLogo,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ).paddingOnly(bottom: 10),
                            Text(
                              match.atTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 3,
                              ),
                              textAlign: TextAlign.center,
                            ).paddingOnly(bottom: 2),
                            const Text(
                              "Away",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ).expanded()
                      ],
                    ).paddingOnly(top: 16),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.push(context,
                            page: DetailMatchPage(match: match));
                      },
                      child: Container(
                        width: 132,
                        padding: const EdgeInsets.all(5.90),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFB4E01),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.42),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Game stats',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(bottom: 16);
            },
          ),
      ],
    );
  }
}
