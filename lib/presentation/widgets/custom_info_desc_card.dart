import 'package:fluffy_challenge_week_3/data/static_data.dart';
import 'package:fluffy_challenge_week_3/models/fixture.dart';
import 'package:fluffy_challenge_week_3/presentation/widgets/custom_clip_icon.dart';
import 'package:flutter/material.dart';

class CustomInfoDescCard extends StatelessWidget {
  const CustomInfoDescCard({
    super.key,
    required this.color,
    required this.fixture,
  });

  final Color color;
  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    var kickOffTime = fixture.kickOffTime;
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
                      const Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/images/pl-logo.png',
                              ),
                              radius: 20,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  '${kickOffTime.day} ${months[kickOffTime.month - 1].substring(0, 3)}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.25),
                                  fontSize: 18,
                                  height: 0),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: Text("")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomClipIcon(
                        logo: firstTeam.logo,
                      ),
                      Text.rich(
                        TextSpan(
                          text: '${kickOffTime.hour}',
                          style: const TextStyle(fontSize: 72, height: 0),
                          children: [
                            TextSpan(
                              text: ':${kickOffTime.minute}',
                              //TODO: Add formatting for time like 13:1 to be 13:01
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.25),
                                  fontSize: 72,
                                  height: 0),
                            ),
                          ],
                        ),
                      ),
                      CustomClipIcon(
                        logo: secondTeam.logo,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text.rich(
                            TextSpan(
                              text: '${firstTeam.name}\n',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.25),
                                  fontSize: 24,
                                  height: 0),
                              children: [
                                TextSpan(
                                  text: firstTeam.followName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      height: 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text.rich(
                            TextSpan(
                              text: 'PREMiER LEAGUE',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.25),
                                  fontSize: 16,
                                  height: 0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomRight,
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
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(size.width * 0.58, 10);
    path.lineTo(size.width * 0.42, 10);
    path.lineTo(size.width * 0.4, 0);
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
    path.lineTo(size.width, size.height * 0.38);
    path.lineTo(size.width * 0.885, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
