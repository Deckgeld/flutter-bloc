import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart'; 

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  // Función que se encarga de obtener el nombre de un Pokémon por su ID
  final Future<String> Function(int id) _fetchPokemonName;  

  // Constructor que recibe una función para obtener el nombre de un Pokémon y la asigna a _fetchPokemonName
  PokemonBloc({ 
    required Future<String> Function(int id) fetchPokemon  
  }) : _fetchPokemonName = fetchPokemon,  // Asigna la función pasada al campo _fetchPokemonName
      super(const PokemonState()) {  // Inicializa el estado inicial usando el constructor de PokemonState

    // Define el manejador de eventos, se agrega un nuevo Pokémon al estado al emitir un evento
    on<PokemonAdded>((event, emit) {
      // Crea una copia del mapa actual de pokémons en el estado
      final newPokemons = Map<int, String>.from(state.pokemons);

      newPokemons[event.id] = event.name;  // Agrega el nuevo Pokémon al mapa

      // Emite un nuevo estado con el mapa de pokémons actualizado
      emit(state.copyWith(pokemons: newPokemons));
    });
  }


  // Método para obtener el nombre de un Pokémon, con caché, 
  //ESTE ES EL METODO QUE SE LLAMA DESDE EL UI Y QUE ACTIVARA EL EVENTO
  Future<String> fetchPokemonName(int id) async {
    // Si el Pokémon ya está en el estado (caché), retorna su nombre directamente
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      // Si no está en caché, obtiene el nombre del Pokémon usando la función _fetchPokemonName
      final pokemonName = await _fetchPokemonName(id);
      // Emite un evento para agregar el nuevo Pokémon al estado
      add(PokemonAdded(id, pokemonName));

      return pokemonName;  // Retorna el nombre del Pokémon
    } catch (e) {
      // Si hay un error, lanza una excepción
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
