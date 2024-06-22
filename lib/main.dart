import 'package:blocs_app/presentation/blocs/04-guest/guest_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //si lazy es true, el bloc se creará la primera vez que se acceda a él
        //si lazy es false, el bloc se creará inmediatamente inicializando el widget
        BlocProvider(create: (context) => getIt<UsernameCubit>(), lazy: false,),
        BlocProvider(create: (context) => getIt<RouterSimpleCubit>() ),
        BlocProvider(create: (context) => getIt<CounterCubit>() ),
        BlocProvider(create: (context) => getIt<ThemeCubit>() ),
        BlocProvider(create: (context) => getIt<GuestBloc>() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RouterSimpleCubit>().state;
    final themeCubit = context.watch<ThemeCubit>().state.isDarkmode;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: themeCubit).getTheme(),
    );
  }
}
