import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';

class DataCredit extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const DataCredit({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
