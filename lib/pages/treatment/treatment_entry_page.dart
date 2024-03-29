// ignore_for_file: use_build_context_synchronously

import 'package:fish/pages/component/treatment_berat_input_card.dart';
import 'package:fish/pages/treatment/treatment_entry_controller.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TreatmentEntryPage extends StatefulWidget {
  const TreatmentEntryPage({Key? key}) : super(key: key);
  @override
  State<TreatmentEntryPage> createState() => _TreatmentEntryPageState();
}

class _TreatmentEntryPageState extends State<TreatmentEntryPage> {
  final TreatmentEntryController controller =
      Get.put(TreatmentEntryController());

  final TreatmentController treatmentTontroller =
      Get.put(TreatmentController());
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getHarvestedBool(controller.activation);
  }

  @override
  Widget build(BuildContext context) {
    Widget descInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: controller.descController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: Ikan Sakit',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Widget carbonTypeNullInput() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Deskripsi',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: TextFormField(
    //               style: primaryTextStyle,
    //               controller: controller.carbonTypeNullController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'ex: Ikan Sakit',
    //                 hintStyle: subtitleTextStyle,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget waterChangeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pergantian Air (%)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: controller.waterController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 100',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget saltDosisInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dosis Garam (Kg)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      style: primaryTextStyle,
                      controller: controller.saltController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'ex: 20',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stok Garam',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '100 gram',
                      textAlign: TextAlign.start,
                      style: headingText2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget treatmentTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Treatment',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Obx(() => DropdownButtonFormField<String>(
                      onChanged: (newValue) =>
                          controller.typeController.setSelected(newValue!),
                      value: controller.typeController.selected.value,
                      items:
                          controller.typeController.listtreatment.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
                            style: primaryTextStyle,
                          ),
                        );
                      }).toList(),
                      dropdownColor: backgroundColor5,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    Widget listTreatmentBeratInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return TreatmentBeratCard(
                fish: controller.activation.fishLive![index]);
          }),
          itemCount: controller.activation.fishLive!.length,
        ),
      );
    }

    Widget probioticInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kultur Probiotik (g/mL)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.probioticController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 2',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget carbonInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Karbon (gram)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      style: primaryTextStyle,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      controller: controller.carbonController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'ex: 2',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stok Karbon',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '100 gram',
                      textAlign: TextAlign.start,
                      style: headingText2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Widget carbonTypeInput() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Jenis Karbon',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: TextFormField(
    //               style: primaryTextStyle,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               controller: controller.carbonTypeController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'ex: molase',
    //                 hintStyle: subtitleTextStyle,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget carbonTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Carbon',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Obx(() => DropdownButtonFormField<String>(
                      onChanged: (newValue) => controller.carbonTypeController
                          .setSelected(newValue!),
                      value: controller.carbonTypeController.selected.value,
                      items: controller.carbonTypeController.listCarbon
                          .map((carbohydrateType) {
                        return DropdownMenuItem<String>(
                          value: carbohydrateType,
                          child: Text(
                            carbohydrateType,
                            style: primaryTextStyle,
                          ),
                        );
                      }).toList(),
                      dropdownColor: backgroundColor5,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    // Widget widthInput() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Lebar (meter)',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: TextFormField(
    //               style: primaryTextStyle,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               keyboardType: TextInputType.number,
    //               controller: controller.widthController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'ex: 2',
    //                 hintStyle: subtitleTextStyle,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Widget diameterInput() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Diameter (meter)',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: TextFormField(
    //               style: primaryTextStyle,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               keyboardType: TextInputType.number,
    //               controller: controller.diameterController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'ex: 2',
    //                 hintStyle: subtitleTextStyle,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            controller.saltController.text == "" &&
                    controller.carbonController.text == "" &&
                    controller.waterController.text == "" &&
                    controller.probioticController.text == ""
                ? null
                : await controller.postFishGrading(
                    context,
                    () {
                      Navigator.pop(context);
                      treatmentTontroller.getTreatmentData(context);
                    },
                  );
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Submit',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget submitBeratButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            await controller.postTreatmentBerat(
              context,
              () {
                Navigator.pop(context);
              },
            );
            treatmentTontroller.getTreatmentData(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Submit',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    // Widget persegiInput() {
    //   return Container(
    //       child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [widthInput(), lengthInput()],
    //   ));
    // }

    // Widget bundarInput() {
    //   return Container(
    //       child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [diameterInput()],
    //   ));
    // }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Entry Treatment"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              treatmentTypeInput(),
              descInput(),
              controller.typeController.selected.value == "berat"
                  ? listTreatmentBeratInput()
                  : waterChangeInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : probioticInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : carbonTypeInput(),
              controller.carbonTypeController.selected.value == "tidak ada"
                  ? Container()
                  : carbonInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : saltDosisInput(),
              controller.typeController.selected.value == "berat"
                  ? submitBeratButton()
                  : submitButton(),
              const SizedBox(
                height: 8,
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
