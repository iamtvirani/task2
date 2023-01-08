import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> numberController = TextEditingController().obs;
  RxBool isLoad = false.obs;
  RxBool isPrev = false.obs;
  RxList data = [].obs;
  RxInt num = 0.obs;

  previousOnTap() {
    num.value = data.value.last;
    data.value = [];
    for (int i = 0; i < 4; i++) {
      if (num.value > 1) {
        int abc = isPrev.value == true ? 1 : 2;
        num.value = num.value - 1;
        data.add(num.value);
        print(data);
      } else {
        num.value = int.parse(numberController.value.text) - 1;
        num.value = num.value + 1;
        data.add(num.value);
        print(data);
      }
    }
    update();
  }

  nextOnTap() {
    data.value = [];
    for (int i = 0; i < 4; i++) {
      if (int.parse(numberController.value.text) <= num.value) {
        num.value = 0;
        num.value = num.value + 1;
        data.add(num.value);
        print(data);
      } else {
        num.value = num.value + 1;
        data.add(num.value);
        print(data);
      }
    }
    update();
  }
}
