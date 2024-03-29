// ignore_for_file: unrelated_type_equality_checks

import 'package:fish/pages/fish/fish_death_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'fish_recap_controller.dart';

class FishDeathEntryPage extends StatelessWidget {
  const FishDeathEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FishDeathEntryController controller =
        Get.put(FishDeathEntryController());

    final FishRecapController deathcontroller = Get.put(FishRecapController());
    Widget fishTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Ikan',
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
                          controller.fishTypeController.setSelected(newValue!),
                      value: controller.fishTypeController.selected.value,
                      items: controller.fishTypeController.listFish.map((fish) {
                        return DropdownMenuItem<String>(
                          value: fish,
                          child: Text(
                            fish,
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

    Widget fishDeathAmountInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Kematian Ikan (Ekor)',
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
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.fishamountChanged,
                  onTap: controller.valfishamount,
                  controller: controller.formDeathController,
                  decoration: controller.validatefishamount.value == true
                      ? controller.fishamount == ''
                          ? const InputDecoration(
                              errorText: 'jumlah ikan tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : InputDecoration.collapsed(
                          hintText: 'ex: 22', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            controller.formDeathController.text == ""
                ? null
                : Navigator.pop(context);
            controller.postFishDeath();
            deathcontroller.getFishDeaths(
                activation_id: controller.activation.id.toString());
            deathcontroller.getcharData(
                activation_id: controller.activation.id.toString());
            // print(deathcontroller.charData);
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

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Entry Kematian Ikan"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishTypeInput(),
              fishDeathAmountInput(),
              submitButton(),
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
