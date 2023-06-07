import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String url;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.url,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Order your food',
    caption:
        'Magna tempor ut nostrud esse sint consectetur culpa eu. Nulla occaecat elit enim sit eiusmod deserunt amet sunt minim et reprehenderit ea qui. Veniam aliqua occaecat commodo ut labore eiusmod do laborum consectetur magna minim enim consectetur fugiat.',
    url: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Your deliver will call you soon',
    caption:
        'Commodo do laborum labore nostrud dolore in amet dolor esse pariatur. Est pariatur enim est reprehenderit veniam qui aute sint eiusmod aliquip cupidatat est quis. Non aliquip commodo nisi ex ut sit veniam qui est dolore magna.',
    url: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Enjoy',
    caption:
        'Tempor ut excepteur esse non fugiat. Id esse eu deserunt in minim ea incididunt occaecat quis proident. Culpa ex dolore eu cillum.',
    url: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool reachedFinal = false;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final double currentPage = pageController.page ?? 0;
      if (!reachedFinal && currentPage >= (slides.length - 1.5)) {
        setState(() {
          reachedFinal = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slides(
                    title: slideData.title,
                    caption: slideData.caption,
                    url: slideData.url))
                .toList(),
          ),
          Positioned(
            top: 80,
            right: 20,
            child: TextButton(
              child: const Text('Exit!'),
              onPressed: () => context.pop(),
            ),
          ),
          reachedFinal
              ? Positioned(
                  bottom: 80,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Start!'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  final String title;
  final String caption;
  final String url;
  const _Slides({
    required this.title,
    required this.caption,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(url),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
