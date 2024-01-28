import 'dart:math';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:fluffy_challenge_week_3/core/theme/theme.dart';
import 'package:fluffy_challenge_week_3/models/fixture.dart';
import 'package:fluffy_challenge_week_3/presentation/widgets/custom_annotated_region.dart';
import 'package:fluffy_challenge_week_3/presentation/widgets/custom_info_desc_card.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.color, required this.fixture});

  final Color color;
  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    //TODO: Add logic to check if teams are not the same
    var firstTeam = fixture.teams[0];
    var secondTeam = fixture.teams[1];
    return CustomAnnotatedRegion(
      statusBarColor: color,
      systemNavigationBarColor: Colors.red,
      child: Container(
          decoration: BoxDecoration(
              color: color,
              gradient: LinearGradient(
                  stops: const [0.8, 0.5],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [color, Colors.red])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 24,
                          child: Icon(
                            EneftyIcons.arrow_left_3_outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text.rich(
                    TextSpan(
                      text: 'THE BEST\nFOOTBALL\n',
                      style: TextStyle(fontSize: 72, height: 0),
                      children: [
                        TextSpan(
                          text: 'MATCH',
                          style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 72,
                              height: 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "PAST GAMES",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 24,
                                    height: 0),
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firstTeam.abbreviation,
                                    style: const TextStyle(
                                        fontSize: 24, height: 1),
                                  ),
                                  const PastGamesTile(),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    secondTeam.abbreviation,
                                    style: const TextStyle(
                                        fontSize: 24, height: 1),
                                  ),
                                  const PastGamesTile(),
                                ]),
                          )
                        ])),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 48,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemExtent: 5,
                          scrollDirection: Axis.horizontal,
                          itemCount: 88,
                          itemBuilder: (context, index) =>
                              const VerticalDivider(
                            color: Color(0xFF191717),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: firstTeam.winPossibility,
                            child: const SizedBox(),
                          ),
                          Expanded(
                            flex: (100 -
                                    (firstTeam.winPossibility +
                                        secondTeam.winPossibility))
                                .abs(),
                            child: Container(
                              height: 58,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                          ),
                          Expanded(
                            flex: secondTeam.winPossibility,
                            child: const SizedBox(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                "${firstTeam.winPossibility}%",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    height: 0),
                              ),
                              Text(
                                firstTeam.abbreviation,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 24,
                                    height: 0),
                              ),
                            ],
                          ))),
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                "${(100 - (firstTeam.winPossibility + secondTeam.winPossibility)).abs()}%",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    height: 0),
                              ),
                              Text(
                                "DRAW",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 24,
                                    height: 0),
                              ),
                            ],
                          ))),
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                "${secondTeam.winPossibility}%",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    height: 0),
                              ),
                              Text(
                                secondTeam.abbreviation,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 24,
                                    height: 0),
                              ),
                            ],
                          ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInfoDescCard(
                  color: AppColors.backgroundColor,
                  fixture: fixture,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Center(
                  child: Text(
                    'CHOOSE THE WiNNER',
                    style: TextStyle(fontSize: 20, height: 0),
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          )),
    );
  }
}

class PastGamesTile extends StatelessWidget {
  const PastGamesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 12,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Random().nextBool()
                      ? Colors.black
                      : Colors.black.withOpacity(0.25)),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 6),
          ),
        )
      ],
    );
  }
}
