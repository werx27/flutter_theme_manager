import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme_cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar')),
      body: SwitchListTile(
        title: const Text('Change theme'),
        value: theme.state.isDark,
        onChanged: (value) {
          theme.changeTheme(value);
        },
      ),
    );
  }
}
