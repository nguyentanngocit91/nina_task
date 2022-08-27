import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nina_task/modules/home/bloc/auth_bloc/auth_bloc.dart';
import 'package:nina_task/modules/home/repositories/auth_repository.dart';
import '/config/themes/theme_cubit/theme_cubit.dart';
import '/core/debug/app_bloc_observer.dart';
import '/l10n/locale_cubit/cubit/locale_cubit.dart';
import '/modules/home/repositories/user_repository.dart';
import '/utils/helpers/mongodb/dbconnection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'config/routers/app_router.dart';
import 'firebase_options.dart';
import 'utils/services/local_storage_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  LocalStorageService localStorageService =
      LocalStorageService(sharedPreferences: sharedPreferences);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await DBConnection.connect();
  Bloc.observer = AppBlocObserver();
  runApp(NinaApp(
    appRouter: AppRouter(),
    authRepository: AuthRepository(),
    localStorageService: localStorageService,
  ));
}

class NinaApp extends StatelessWidget {
  const NinaApp({
    Key? key,
    required this.localStorageService,
    required this.appRouter,
   required this.authRepository,
  }) : super(key: key);

  final AppRouter appRouter;
  final LocalStorageService localStorageService;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => UserRepository()),
        RepositoryProvider.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          // Bloc xử lý Lang
          BlocProvider<LocaleCubit>(
              create: (BuildContext context) =>
                  LocaleCubit(localStorageService)),
          // Bloc xử lý theme
          BlocProvider(
              create: (BuildContext context) =>
                  ThemeCubit(localStorageService)),
          
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context)),)
        ],
        child: App(appRouter: appRouter,),
      ),
    );
  }
}
