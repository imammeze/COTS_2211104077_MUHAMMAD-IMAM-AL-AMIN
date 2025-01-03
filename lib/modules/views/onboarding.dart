import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../design_system/app_colors.dart';
import '../controllers/onboarding_controller.dart';
import 'login.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller =
      Get.put(OnboardingController()); // Register controller

  final List<Map<String, String>> onboardingData = [
    {
      "image": 'assets/illustration/illustration1.png',
      "title": "Transportasi & logistik",
      "description":
          "Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~",
    },
    {
      "image": 'assets/illustration/illustration2.png',
      "title": "Pesan makanan",
      "description": "Lapar? Pesan makanan langsung diantarkan ke depan pintu.",
    },
    {
      "image": 'assets/illustration/illustration3.png',
      "title": "Pembayaran mudah",
      "description":
          "Bayar lebih cepat dan aman menggunakan dompet digital kami.",
    },
    {
      "image": 'assets/illustration/illustration4.png',
      "title": "Belanja online",
      "description": "Temukan kebutuhan harianmu langsung di aplikasi kami.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo/gojek_logo.png', height: 24),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/logo/indonesia.png', height: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ilustrasi dan Deskripsi
            Expanded(
              child: PageView.builder(
                onPageChanged: controller.updatePage,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Column(
                    children: [
                      Image.asset(
                        item['image']!,
                        height: 200,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Indikator Halaman
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? Colors.green
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                )),
            // Tombol Aksi
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginScreen()); // Navigasi menggunakan GetX
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Tambahkan navigasi ke halaman registrasi
                    },
                    child: Text(
                      'Belum ada akun?, Daftar dulu',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                    ),
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
