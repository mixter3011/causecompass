import 'dart:async';
import 'package:causecompass/components/my_bottom_bar.dart';
import 'package:causecompass/themes/glass_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bottom bar navigation 
  int _currentBottomIndex = 0;
  void _handleBottomIndexChange(int? index) {
    setState(() {
      _currentBottomIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Image Carousel'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: const ImageCarousel(),
      bottomNavigationBar: GlassBox(
        child: MyBottomBar(
          index: _currentBottomIndex, 
          onTap: _handleBottomIndexChange,
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  List<String> imagePaths = [
    'lib/assets/Carousel_1.png',
    'lib/assets/Carousel_2.png',
    'lib/assets/Carousel_3.png',
    'lib/assets/Carousel_4.png',
  ];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Set up an automatic scroll
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < imagePaths.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 1000), // Adjust the duration
        curve: Curves.easeInOut, // Use Curves.easeInOut for a smoother transition
      );
    });

    // Listen to page changes to implement wrap-around
    _pageController.addListener(() {
      if (_pageController.page == imagePaths.length - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _pageController.jumpToPage(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            );
          },
          onPageChanged: (int index) {
            currentPage = index;
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
