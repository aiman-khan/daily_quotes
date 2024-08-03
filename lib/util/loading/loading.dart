import 'package:daily_quotes/common/extensions/num.dart';
import 'package:daily_quotes/util/resources/r.dart';
import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: R.colors.primary1,
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void loadingWithText(BuildContext context, String text) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white.withOpacity(0.5),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: R.colors.primary1,
              ),
              12.hb,
              Text(text)
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
