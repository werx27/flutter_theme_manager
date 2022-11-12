import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_manager/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_theme_manager/managers/theme_manager.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Theme manager',
            theme: ThemeManager.getTheme(state.isDark),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
