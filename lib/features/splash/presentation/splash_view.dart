import 'package:daily_quotes/gen/assets.gen.dart';
import 'package:daily_quotes/util/resources/r.dart';
import 'package:daily_quotes/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), navigate);
  }

  Future<void> navigate() async {
    if (!mounted) return;

    GoRouter.of(context).pushReplacement(RoutePaths.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngs.splashBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
            vertical: 24.h,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              child: Text(
                'Daily\nQuotes',
                style: TextStyle(
                  fontSize: 46.sp,
                  color: R.colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
