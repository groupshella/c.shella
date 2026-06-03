import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

/// نقطة دخول التطبيق
void main() {
    runApp(
          const ProviderScope(
                  child: ShellaApp(),
                ),
        );
}

class ShellaApp extends StatelessWidget {
    const ShellaApp({super.key});

    @override
    Widget build(BuildContext context) {
          return MaterialApp.router(
                  // اسم التطبيق
                  title: 'شِلّة',
                  // تعطيل شريط debug
                  debugShowCheckedModeBanner: false,
                  // دعم RTL والعربية
                  locale: const Locale('ar', 'SA'),
                  supportedLocales: const [
                            Locale('ar', 'SA'),
                            Locale('en', 'US'),
                          ],
                  localizationsDelegates: const [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                  // نظام التصميم
                  theme: AppTheme.lightTheme,
                  // نظام التوجيه
                  routerConfig: AppRouter.router,
                  // اتجاه النص: RTL
                  builder: (context, child) {
                            return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: child!,
                                      );
                  },
                );
    }
}
