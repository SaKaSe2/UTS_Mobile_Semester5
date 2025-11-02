import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/location_service.dart';

class UserProfileController extends GetxController {
  final LocationService _locationService = LocationService();
  
  final currentCity = 'MEDAN'.obs;
  final isLoadingLocation = false.obs;
  
  final RxList<Cinema> cinemas = <Cinema>[
    Cinema(name: 'XI CINEMA', isExpanded: false),
    Cinema(name: 'PONDOK KELAPA 21', isExpanded: false),
    Cinema(name: 'CGV', isExpanded: false),
    Cinema(name: 'CINEPOLIS', isExpanded: false),
    Cinema(name: 'CP MALL', isExpanded: false),
    Cinema(name: 'HERMES', isExpanded: false),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    isLoadingLocation.value = true;

    try {
      final city = await _locationService.getCurrentCity();
      currentCity.value = city.toUpperCase();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error getting location: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingLocation.value = false;
    }
  }

  void toggleCinemaExpansion(int index, bool expanded) {
    cinemas[index].isExpanded = expanded;
    cinemas.refresh();
  }

  void selectCity(String city) {
    currentCity.value = city;
  }

  void showCityDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Select City'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.my_location),
              title: const Text('Use Current Location'),
              onTap: () {
                Get.back();
                getCurrentLocation();
              },
            ),
            _buildCityTile('MEDAN'),
            _buildCityTile('JAKARTA'),
            _buildCityTile('SURABAYA'),
            _buildCityTile('BANDUNG'),
          ],
        ),
      ),
    );
  }

  Widget _buildCityTile(String city) {
    return ListTile(
      title: Text(city),
      onTap: () {
        selectCity(city);
        Get.back();
      },
    );
  }

  void goToLogin() {
    Get.offAllNamed('/login');
  }
}

class Cinema {
  final String name;
  bool isExpanded;

  Cinema({required this.name, required this.isExpanded});
}