import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
    AppTheme._();
    static ThemeData get lightTheme {
          return ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                            seedColor: AppColors.primary,
                            primary: AppColors.primary,
                            surface: AppColors.surface,
                            error: AppColors.error,
                          ),
                  scaffoldBackgroundColor: AppColors.background,
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  textTheme: TextTheme(
                            displayLarge: GoogleFonts.cairo(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                            headlineLarge: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                            headlineMedium: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                            titleLarge: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                            bodyLarge: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimary),
                            bodyMedium: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textSecondary),
                            bodySmall: GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.textHint),
                            labelLarge: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textOnPrimary),
                          ),
                  appBarTheme: AppBarTheme(
                            backgroundColor: AppColors.surface,
                            elevation: 0,
                            centerTitle: true,
                            titleTextStyle: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                          ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.textOnPrimary,
                                        minimumSize: const Size(double.infinity, 52),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                        textStyle: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                          ),
                  inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: AppColors.surface,
                            border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: const BorderSide(color: AppColors.border),
                                      ),
                            enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: const BorderSide(color: AppColors.border),
                                      ),
                            focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                                      ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            hintStyle: GoogleFonts.cairo(color: AppColors.textHint, fontSize: 14),
                          ),
                  cardTheme: CardTheme(
                            color: AppColors.cardBackground,
                            elevation: 2,
                            shadowColor: AppColors.shadow,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                );
    }
}
