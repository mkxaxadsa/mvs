import 'package:flutter/material.dart';
import 'package:mostbet_3/core/extensions/align_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/expanded_ext_on_widget.dart';
import 'package:mostbet_3/core/extensions/mediaquery_ext_on_context.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';
import 'package:mostbet_3/gen/assets.gen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'SF Pro Text',
          ),
        ).paddingOnly(bottom: 60, top: context.padding.top + 20).align(),
        Container(
          width: double.maxFinite,
          height: 1,
          color: Colors.white.withOpacity(.4),
        ),
        InkWell(
          onTap: () async {
            if (await canLaunch(
                'https://docs.google.com/document/d/1MvNTceoOZdEa0Lnu5CcI0ZlACJ3BlfSap7iYv6r1H_w/edit?usp=sharing')) {
              await launch(
                  'https://docs.google.com/document/d/1MvNTceoOZdEa0Lnu5CcI0ZlACJ3BlfSap7iYv6r1H_w/edit?usp=sharing');
            } else {
              throw 'Could not launch';
            }
          },
          child: SizedBox(
            width: double.maxFinite,
            height: 46,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Image.asset(
                    Assets.icons.privacy.path,
                    height: 21,
                  ).align(Alignment.centerLeft),
                ),
                Text(
                  "Privacy Policy",
                  style: const TextStyle(
                    color: Color(0xFFFB4E01),
                    fontSize: 11.97,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ).expanded(),
                Assets.icons.chevronRight
                    .image(
                      width: 8,
                    )
                    .paddingSymetric(horizontal: 8),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: Colors.white.withOpacity(.4),
        ),
        InkWell(
          onTap: () async {
            if (await canLaunch(
                'https://docs.google.com/document/d/1ISnhPnLC_rs5kOPG_tj5mI63x7Y2t4WSNUg5jvNknxs/edit?usp=sharing')) {
              await launch(
                  'https://docs.google.com/document/d/1ISnhPnLC_rs5kOPG_tj5mI63x7Y2t4WSNUg5jvNknxs/edit?usp=sharing');
            } else {
              throw 'Could not launch';
            }
          },
          child: SizedBox(
            width: double.maxFinite,
            height: 46,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Image.asset(
                    Assets.icons.privacy.path,
                    height: 21,
                  ).align(Alignment.centerLeft),
                ),
                Text(
                  "Terms of use",
                  style: const TextStyle(
                    color: Color(0xFFFB4E01),
                    fontSize: 11.97,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ).expanded(),
                Assets.icons.terms
                    .image(
                      width: 8,
                    )
                    .paddingSymetric(horizontal: 8),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: Colors.white.withOpacity(.4),
        ),
        GestureDetector(
          onTap: () {
            Share.share(
              'Check out The Mavest First Sport app on the App Store!',
              subject: 'The Mavest First Sport - All Matches in one app',
            );
          },
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Image.asset(
                  'assets/icons/share.png',
                  height: 21,
                ),
              ),
              Expanded(
                child: Text(
                  "Share with friends",
                  style: TextStyle(
                    color: Color(0xFFFB4E01),
                    fontSize: 11.97,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'assets/icons/terms.png',
                  width: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    ).paddingSymetric(horizontal: 16);
  }
}
