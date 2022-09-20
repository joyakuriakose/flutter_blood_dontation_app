import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollOffsetController extends GetxController {
  late ScrollController scrollController;
  RxBool isFloatingButtonVisible = true.obs;
  RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    scrollController = ScrollController(initialScrollOffset: offset.value)
      ..addListener(() {
        offset.value = scrollController.offset;
      });
    super.onInit();
  }
}
