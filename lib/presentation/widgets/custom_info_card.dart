import 'package:fluffy_challenge_week_3/data/static_data.dart';
import 'package:fluffy_challenge_week_3/models/fixture.dart';
import 'package:fluffy_challenge_week_3/presentation/widgets/custom_clip_icon.dart';
import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  const CustomInfoCard({
    super.key,
    required this.color,
    required this.fixture,
  });

  final Color color;
  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    var kickOffTime = fixture.kickOffTime;
    //TODO: Add logic to check if teams are not the same
    var firstTeam = fixture.teams[0];
    var secondTeam = fixture.teams[1];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          ClipPath(
            clipper: TopRightCornerClipper(),
            child: Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: color.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          ClipPath(
            clipper: CardClipper(),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(16)),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomClipIcon(
                              logo: firstTeam.logo,
                            ),
                            const SizedBox(width: 12),
                            CustomClipIcon(
                              logo: secondTeam.logo,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(
                            text: '${kickOffTime.day}\n',
                            style: const TextStyle(fontSize: 18, height: 0),
                            children: [
                              TextSpan(
                                text: months[kickOffTime.month - 1],
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 18,
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: Text("")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 48),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(
                            text: '${kickOffTime.hour}',
                            style: const TextStyle(fontSize: 42, height: 0),
                            children: [
                              TextSpan(
                                text: ':${kickOffTime.minute}',
                                //TODO: Add formatting for time like 13:1 to be 13:01
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 42,
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(
                            text: '${firstTeam.name}\n',
                            style: const TextStyle(fontSize: 24, height: 0),
                            children: [
                              TextSpan(
                                text: firstTeam.followName,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.25),
                                    fontSize: 24,
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(
                            text: '${secondTeam.name}\n',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.25),
                                fontSize: 24,
                                height: 0),
                            children: [
                              TextSpan(
                                text: secondTeam.followName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    height: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.17);
    path.quadraticBezierTo(
        size.width, size.height * 0.17, size.width * 0.87, 0);
    path.lineTo(size.width * 0.87, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopRightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.325);
    path.lineTo(size.width * 0.88, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
