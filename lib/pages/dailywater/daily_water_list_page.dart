import 'package:fish/pages/component/daily_water_card.dart';
import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:fish/pages/dailywater/daily_water_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import 'daily_water_avg.dart';

class DailyWaterPage extends StatefulWidget {
  const DailyWaterPage({Key? key}) : super(key: key);

  @override
  State<DailyWaterPage> createState() => _DailyWaterPageState();
}

class _DailyWaterPageState extends State<DailyWaterPage> {
  final DailyWaterController controller = Get.put(DailyWaterController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getDailyWaterData(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget fishDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kolam ${controller.pond.alias!}",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: heavy,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const DailyWaterAvgPage(), arguments: {
                  "pond": controller.pond,
                  "activation": controller.activation
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Rata-Rata/Minggu ',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget listDailyWater() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.listDailyWater
                .map(
                  (dailyWaterList) => DailyWaterCard(
                      dailyWaterList: dailyWaterList,
                      activation: controller.activation,
                      pond: controller.pond),
                )
                .toList(),
          ));
    }

    Widget emptyList() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              const SizedBox(height: 35),
              const Image(
                image: AssetImage("assets/unavailable_icon.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 20),
              Text(
                "Kolam belum pernah dilakukan treatment",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text(
                "Silahkan masukan treatment",
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
          ));
    }

    // Widget submitButton() {
    //   return Container(
    //     height: 50,
    //     width: double.infinity,
    //     margin: EdgeInsets.only(
    //         top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
    //     child: TextButton(
    //       onPressed: () {
    //         Get.to(() => const DailyWaterAvgPage(), arguments: {
    //           "pond": controller.pond,
    //           "activation": controller.activation
    //         });
    //       },
    //       style: TextButton.styleFrom(
    //         backgroundColor: primaryColor,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(12),
    //         ),
    //       ),
    //       child: Text(
    //         'Submit',
    //         style: primaryTextStyle.copyWith(
    //           fontSize: 16,
    //           fontWeight: medium,
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => DailyWaterEntryPage(), arguments: {
                "pond": controller.pond,
                "activation": controller.activation
              });
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              // submitButton(),
              controller.listDailyWater.isEmpty
                  ? emptyList()
                  : listDailyWater(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );
      }
    });
  }
}
