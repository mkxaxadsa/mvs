// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mostbet_3/core/extensions/align_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/expanded_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/mediaquery_ext_on_context.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';

import 'package:mostbet_3/data/models/match.dart';
import 'package:mostbet_3/gen/assets.gen.dart';

class DetailMatchPage extends StatefulWidget {
  const DetailMatchPage({
    Key? key,
    required this.match,
  }) : super(key: key);
  final Match match;
  @override
  State<DetailMatchPage> createState() => _DetailMatchPageState();
}

class _DetailMatchPageState extends State<DetailMatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003A79),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Assets.images.statHeader.image(fit: BoxFit.cover),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                          child: Assets.icons.chevronLeft.image(width: 8),
                        ),
                      ).paddingLTRB(16, 0, 0, 16),
                      Container(
                        constraints: const BoxConstraints(minHeight: 160),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Color(0xFFE84E0F)),
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
                                        imageUrl: widget.match.htLogo,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ).paddingOnly(bottom: 10),
                                    Text(
                                      widget.match.htTitle,
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
                                      widget.match.leagueName,
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
                                      '${widget.match.hGoals}:${widget.match.aGoals}',
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
                                        imageUrl: widget.match.atLogo,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ).paddingOnly(bottom: 10),
                                    Text(
                                      widget.match.atTitle,
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
                            Container(
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
                          ],
                        ),
                      ).paddingOnly(bottom: 16).paddingLTRB(22, 0, 14, 0),
                    ],
                  ).paddingOnly(top: context.padding.top),
                ],
              ),
              Assets.images.gameScheme
                  .image(width: double.maxFinite)
                  .paddingSymetric(horizontal: 30, vertical: 30),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "7",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Shot",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "16",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "35%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Shots on target",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "65%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "35%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Possession",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "65%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "219",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Passes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "158",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "77%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Pass accuracy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "89%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "12",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Fouls",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "8",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Yellow cards",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Red cards",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "5",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Offsides",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15),
               Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                  const Text(
                    "Corners",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A5B1),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ).align().expanded(),
                  SizedBox(
                    width: 60,
                    child: const Text(
                      "6",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ).align(),
                  ),
                ],
              ).paddingLTRB(30, 0, 30, 15)
                  .paddingOnly(bottom: 30),
            ],
          ),
        ),
      ),
    );
  }
}
