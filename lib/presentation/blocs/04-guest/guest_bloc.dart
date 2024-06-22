import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const uuid = Uuid();

class GuestBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ]
            // HASTA AQUI, no hemos hecho nada nuevo, solo hemos creado un estado inicial con 5 invitados
            )) {
    //ESTOS SON LOS MANEJADORES DE EVENTOS, une los manejarores de eventos con los eventos
    //el primero maneja los filtros, el segundo agrega un invitado y tercero cambia el estado de un invitado
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuest>(_addGuestHandler);
    on<ToggleGuest>(_toggleGuestHandler);
  }


  //ESTAS SON LAS INTERFACES QUE SE LLAMAN DESDE EL UI
  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String name) {
    add(AddGuest(name));
  }

  void toggleGuest(String id) {
    add(ToggleGuest(id));
  }


  //ESTAS SON LAS IMPLEMENTACIONES DE LAS INTERFACES DE ARRIBA
  void _addGuestHandler(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);

    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuest event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }

      return guest;
    }).toList();

    emit(state.copyWith(guests: newGuests));
  }
}
