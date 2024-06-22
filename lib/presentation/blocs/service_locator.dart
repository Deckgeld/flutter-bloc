import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/04-guest/guest_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( UsernameCubit() );
  getIt.registerSingleton( RouterSimpleCubit() );
  getIt.registerSingleton( CounterCubit() );
  getIt.registerSingleton( ThemeCubit() );
  
  getIt.registerSingleton( GuestBloc() );

  /*
  final usernameCubit = getIt.registerSingleton( UsernameCubit() );
  final user = usernameCubit.state;

  getIt.registerSingleton( RouterSimpleCubit(user) );
  */
}
