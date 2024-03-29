import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uny/logic/user_provider.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final photoUrl = context.select<UserProvider, String>((provider) => provider.user.photoUrl);
    final rating = context.select<UserProvider, double>((provider) => provider.user.rating);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'assets/images/rating_back.png',
          height: 128,
          width: 128,
        ),
        Image.asset(
          'assets/images/rating.png',
          height: 128,
          width: 128,
        ),
        Positioned(
          top: 24,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: AssetImage(photoUrl),
          ),
        ),
        Positioned(
          bottom: -1,
          child: Container(
            //color: Colors.green,
            padding: const EdgeInsets.fromLTRB(8.5, 2, 7.5, 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(16, 165, 19, 1),
                    Color.fromRGBO(32, 223, 17, 1),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.15, 1.0],
                  tileMode: TileMode.clamp),
            ),

            child: Row(
              children: [
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 3),
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  color: Colors.white,
                  width: 9,
                  height: 9,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
