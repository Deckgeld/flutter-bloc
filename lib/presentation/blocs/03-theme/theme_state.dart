part of 'theme_cubit.dart';

//borramos la propiedad sealed
class ThemeState extends Equatable {
  final bool isDarkmode;

  const ThemeState({
    required this.isDarkmode
  });

  //Propiedades para que sea considerado un nuevo estado, por parte de Equatable
  @override
  List<Object> get props => [ isDarkmode ];
}

//Estas son instancias de la clase ThemeState, podriamos crear mas si asi lo necesitamos,
//pero no las usaremos en este ejemplo
//final class ThemeInitial extends ThemeState {}
