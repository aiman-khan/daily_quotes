import 'package:daily_quotes/common/extensions/num.dart';
import 'package:daily_quotes/features/quote/domain/models/photo/photo_model.dart';
import 'package:daily_quotes/features/quote/presentation/providers/get_random_photo_provider.dart';
import 'package:daily_quotes/features/quote/presentation/providers/get_random_quote_provider.dart';
import 'package:daily_quotes/features/splash/presentation/splash_view.dart';
import 'package:daily_quotes/gen/assets.gen.dart';
import 'package:daily_quotes/util/resources/r.dart';
import 'package:daily_quotes/util/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool isLoading = false;

  ImageProvider getBgImage(PhotoModel? bg) {
    if (bg == null) {
      return AssetImage(Assets.pngs.splashBg.path);
    }

    return CachedNetworkImageProvider(
      bg.urls.regular,
    );
  }

  @override
  Widget build(BuildContext context) {
    final randomFontStyle =
        fontStyles[math.Random().nextInt(fontStyles.length)]();

    final photoAsync = ref.watch(getRandomPhotoProvider);
    final quoteAsync = ref.watch(getRandomQuoteProvider);

    if (!photoAsync.hasValue || !quoteAsync.hasValue) {
      return const SplashView();
    }

    final photo = photoAsync.value;
    final quote = quoteAsync.value;

    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getBgImage(photo),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        ref.invalidate(getRandomPhotoProvider);
                        ref.invalidate(getRandomQuoteProvider);
                      },
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 280.w,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: R.colors.black.withOpacity(0.55),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              quote?.content ?? '',
                              textAlign: TextAlign.center,
                              style: randomFontStyle,
                            ),
                            12.hb,
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '~ ${quote?.author ?? ''}',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.dancingScript(
                                  fontSize: 18.sp,
                                  color: R.colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
