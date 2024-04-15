import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:keyboard/model/getBanner_Module.dart';

import '../newAdded/api_constants.dart';

class GetBannersController extends GetxController {
  RxList<Banner> getBanner = RxList<Banner>([]);
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchBanners();
    get();
  }

  get() async {
    isLoading.value = true;

    var response = await http.get(Uri.parse(GET_ALL_BANNER_API));
    if (response.statusCode == 200) {
      print("Hit");
      var getpackage = jsonDecode(response.body)["banners"];
      this.getBanner = getpackage
          .map<Banner>((e) => Banner.fromJson(e))
          .toList();
      // isLoading.value = false;
      print(getpackage);
      isLoading.value = false;
      update();
    }
  }

  void fetchBanners() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(GET_ALL_BANNER_API));

      if (response.statusCode == 200) {
        isLoading.value = false;

        List<dynamic> bannersJson = jsonDecode(response.body)["banners"];
        List<Banner> banners = bannersJson
            .map((bannerJson) => Banner.fromJson(bannerJson))
            .toList();
        // Get.snackbar("", banners);
        print(banners);

        getBanner.assignAll(banners);
        update();
      } else {
        isLoading.value = false;

        throw Exception('Failed to fetch banners');
      }
    } catch (e) {
      isLoading.value = false;

      print('Error fetching banners: $e');
      // Handle error, show snackbar, etc.
    }
  }
}
