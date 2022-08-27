import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nina_task/modules/home/bloc/auth_bloc/auth_bloc.dart';
import 'package:nina_task/modules/home/repositories/auth_repository.dart';
import 'package:nina_task/modules/home/screens/signIn_screen.dart';
import '/config/themes/theme_cubit/theme_cubit.dart';
import '/l10n/locale_cubit/cubit/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/modules/home/screens/home_screen.dart';

import 'config/routers/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appRouter,
  }) : super(key: key);

  final AppRouter appRouter;


  // Đây là widget gốc (root) của APP
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.select((ThemeCubit themeCubit) => themeCubit.state.theme),
      locale:
          context.select((LocaleCubit localeCubit) => localeCubit.state.locale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: appRouter.onGenerateRoute,
      home: BlocBuilder<AuthBloc,AuthState>(
        builder: (context, state) {
          if (state is Authenticated){
            return HomeScreen();
          }
          return SignIn();
        },
      ),
    );
  }
}
