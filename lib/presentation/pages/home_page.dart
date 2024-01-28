import 'dart:math';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:fluffy_challenge_week_3/core/theme/theme.dart';
import 'package:fluffy_challenge_week_3/data/static_data.dart';
import 'package:fluffy_challenge_week_3/models/fixture.dart';
import 'package:fluffy_challenge_week_3/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_annotated_region.dart';
import '../widgets/custom_info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomAnnotatedRegion(
      statusBarColor: AppColors.backgroundColor,
      systemNavigationBarColor: AppColors.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          'assets/images/pl-logo.png',
                        ),
                        radius: 24,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 24,
                        child: Icon(EneftyIcons.arrow_down_outline),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text.rich(
                    TextSpan(
                      text: 'PREMiER\n',
                      style: TextStyle(fontSize: 72, height: 0),
                      children: [
                        TextSpan(
                          text: 'LEAGUE',
                          style: TextStyle(
                              color: Color.fromRGBO(225, 206, 212, 1),
                              fontSize: 72,
                              height: 0),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    //TODO: Add scrollListener to change height of the last item
                    var fixture = Fixture(kickOffTime: DateTime.now(), teams: [
                      allTeams[Random().nextInt(10)],
                      allTeams[Random().nextInt(10)]
                    ]);
                    return Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.775,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailsPage(
                                    fixture: fixture, color: colors[index]),
                              ));
                        },
                        child: CustomInfoCard(
                          fixture: fixture,
                          color: colors[index],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
