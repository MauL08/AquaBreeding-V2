import 'package:fish/models/grading_chart_model.dart';
import 'package:fish/pages/component/grading_card.dart';
import 'package:fish/pages/grading/grading_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/grading/grading_constanta_edit_page.dart';
import 'package:fish/pages/grading/grading_entry_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GradingPage extends StatelessWidget {
  const GradingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GradingController controller = Get.put(GradingController());

    Widget chartGrading() {
      return SfCartesianChart(
        enableAxisAnimation: true,
        tooltipBehavior: TooltipBehavior(enable: true),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
        ),
        title: ChartTitle(
            text: 'Rekap Grading',
            textStyle: const TextStyle(color: Colors.white)),
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            textStyle: const TextStyle(color: Colors.white)),
        primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(color: Colors.white),
            autoScrollingDelta: 4),
        primaryYAxis: NumericAxis(
            labelFormat: '{value}Kg',
            labelStyle: const TextStyle(color: Colors.white)),
        series: <ChartSeries>[
          LineSeries<GradingChartData, dynamic>(
              enableTooltip: true,
              color: Colors.blue,
              dataSource: controller.charLeleData,
              xValueMapper: (GradingChartData grading, _) => grading.getDate(),
              yValueMapper: (GradingChartData grading, _) => grading.avg_weight,
              name: 'Lele'),
          LineSeries<GradingChartData, dynamic>(
              enableTooltip: true,
              color: Colors.pink,
              dataSource: controller.charNilaMerahData,
              xValueMapper: (GradingChartData grading, _) => grading.getDate(),
              yValueMapper: (GradingChartData grading, _) => grading.avg_weight,
              name: 'Nila Merah'),
          LineSeries<GradingChartData, dynamic>(
              enableTooltip: true,
              color: Colors.green,
              dataSource: controller.charNilaHitamData,
              xValueMapper: (GradingChartData grading, _) => grading.getDate(),
              yValueMapper: (GradingChartData grading, _) => grading.avg_weight,
              name: 'Nila Hitam'),
          LineSeries<GradingChartData, dynamic>(
              enableTooltip: true,
              color: Colors.amber,
              dataSource: controller.charMasData,
              xValueMapper: (GradingChartData grading, _) => grading.getDate(),
              yValueMapper: (GradingChartData grading, _) => grading.avg_weight,
              name: 'Mas'),
          LineSeries<GradingChartData, dynamic>(
              enableTooltip: true,
              color: Colors.pink.shade100,
              dataSource: controller.charPatinData,
              xValueMapper: (GradingChartData grading, _) => grading.getDate(),
              yValueMapper: (GradingChartData grading, _) => grading.avg_weight,
              name: 'Patin'),
        ],
      );
    }

    Widget gradingDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "kolam ${controller.pond.alias}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget entryGradingButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => const GradingEntryPage(), arguments: {
              "pond": controller.pond,
              "activation": controller.activation
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Entry Grading',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    // Widget detail() {
    //   return Container(
    //     width: double.infinity,
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "Lokasi Kolam",
    //               style: primaryTextStyle.copyWith(
    //                 fontSize: 14,
    //                 fontWeight: medium,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //               maxLines: 1,
    //             ),
    //             Text(
    //               "Blok A",
    //               style: secondaryTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //               maxLines: 1,
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "Musim Budidaya",
    //               style: primaryTextStyle.copyWith(
    //                 fontSize: 14,
    //                 fontWeight: medium,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //               maxLines: 1,
    //             ),
    //             Text(
    //               "12-09-2022 sampai 01-19-2022",
    //               style: secondaryTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //               maxLines: 1,
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget recapTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
        child: Text(
          "Rekapitulasi Grading",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget listMonthFeed() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.list_fishGrading
                .map(
                  (fishGrading) => GradingCard(
                      activation: controller.activation,
                      pond: controller.pond,
                      fishGrading: fishGrading),
                )
                .toList(),
          ));
    }

    Widget sizingSec() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
          color: transparentColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Oversize",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${controller.activation.consOver} x avg',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Undersize",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${controller.activation.consUnder} x avg',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 80,
                      // margin: EdgeInsets.only(
                      //     top: defaultMargin,
                      //     right: defaultMargin,
                      //     left: defaultMargin),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const ConstantaGradingPage(),
                              arguments: {
                                "activation": controller.activation,
                                "pond": controller.pond
                              });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Edit',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        // print('object');
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Rekapitulasi Grading"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              chartGrading(),
              gradingDataRecap(),
              // detail(),
              sizingSec(),
              entryGradingButton(),
              recapTitle(),
              // chartRecap(),
              listMonthFeed(),
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
