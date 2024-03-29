import 'package:flutter/material.dart';
import 'package:fish/theme.dart';

class DailyWaterCardAvg extends StatelessWidget {
  final Map<String, dynamic> sol;
  const DailyWaterCardAvg({Key? key, required this.sol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Minggu ke - ${sol['week']}",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            const Divider(color: Colors.black),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "pH rata-rata:",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    sol['ph'].toString(),
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "Do rata-rata :",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    sol['numDo'].toStringAsFixed(1),
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "Suhu rata-rata:",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${sol['temperature'].toStringAsFixed(1)} °C",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
