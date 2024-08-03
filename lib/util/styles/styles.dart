import 'package:daily_quotes/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final quoteStyle = TextStyle(
  fontSize: 24.sp,
  color: R.colors.white,
  fontWeight: FontWeight.bold,
);

final List<TextStyle Function()> fontStyles = [
  () => GoogleFonts.oswald(textStyle: quoteStyle),
  () => GoogleFonts.pacifico(textStyle: quoteStyle),
  () => GoogleFonts.raleway(textStyle: quoteStyle),
  () => GoogleFonts.ptSerif(textStyle: quoteStyle),
  () => GoogleFonts.merriweather(textStyle: quoteStyle),
  () => GoogleFonts.playfairDisplay(textStyle: quoteStyle),
  () => GoogleFonts.dancingScript(textStyle: quoteStyle),
  () => GoogleFonts.indieFlower(textStyle: quoteStyle),
  () => GoogleFonts.cinzel(textStyle: quoteStyle),
  () => GoogleFonts.poppins(textStyle: quoteStyle),
  () => GoogleFonts.nunito(textStyle: quoteStyle),
  () => GoogleFonts.abrilFatface(textStyle: quoteStyle),
  () => GoogleFonts.bitter(textStyle: quoteStyle),
  () => GoogleFonts.courgette(textStyle: quoteStyle),
  () => GoogleFonts.amaticSc(textStyle: quoteStyle),
  () => GoogleFonts.permanentMarker(textStyle: quoteStyle),
];
