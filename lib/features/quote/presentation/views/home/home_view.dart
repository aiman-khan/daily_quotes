import 'dart:async';

import 'package:daily_quotes/common/extensions/num.dart';
import 'package:daily_quotes/common/widgets/app_filled_button.dart';
import 'package:daily_quotes/features/quote/domain/models/photo/photo_model.dart';
import 'package:daily_quotes/features/quote/domain/models/quote/quote_model.dart';
import 'package:daily_quotes/features/quote/presentation/providers/get_random_photo_provider.dart';
import 'package:daily_quotes/features/quote/presentation/providers/get_random_quote_provider.dart';
import 'package:daily_quotes/gen/assets.gen.dart';
import 'package:daily_quotes/util/exceptions/message_exception.dart';
import 'package:daily_quotes/util/loading/loading.dart';
import 'package:daily_quotes/util/resources/r.dart';
import 'package:daily_quotes/util/styles/styles.dart';
import 'package:daily_quotes/util/toast/toast.dart';
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
  QuoteModel? quote;
  PhotoModel? photo;
  PhotoModel? bg;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _getQuote();
      _getPhoto();
    });
  }

  Future<void> _getQuote() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      loading(context);
      quote = await ref.read(getRandomQuoteProvider.future);
      if (!mounted) return;
      setState(() {});
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: 'Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  Future<void> _getPhoto() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      loading(context);
      photo = await ref.read(getRandomPhotoProvider.future);
      bg = await ref.read(getRandomPhotoProvider.future);

      if (!mounted) return;
      setState(() {});
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: 'Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  ImageProvider get bgImage {
    if (bg == null) {
      return AssetImage(Assets.pngs.splashBg.path);
    }

    return CachedNetworkImageProvider(bg!.urls.full);
  }

  @override
  Widget build(BuildContext context) {
    final randomFontStyle =
        fontStyles[math.Random().nextInt(fontStyles.length)]();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: bgImage),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        _getPhoto();
                        _getQuote();
                      },
                    ),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (photo != null)
                        SizedBox(
                          height: 450.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: photo!.urls.regular,
                            ),
                          ),
                        ),
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
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
