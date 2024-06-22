part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

//Estas son las clases que representan los eventos que se pueden dar en la aplicación
class PokemonAdded extends PokemonEvent {
  final int id;
  final String name;

  const PokemonAdded(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}
