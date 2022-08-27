import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/themes/theme_cubit/theme_cubit.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dark Theme:"),
        const SizedBox(
          width: 20,
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Switch(
              value: state.isDarkThemeOn,
              onChanged: (newValue) {
                context.read<ThemeCubit>().toggleSwitch(newValue);
              },
            );
          },
        ),
      ],
    );
  }
}
