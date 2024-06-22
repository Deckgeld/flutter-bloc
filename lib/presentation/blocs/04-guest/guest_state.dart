part of 'guest_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter=GuestFilter.all,
    this.guests=const [],
  });

  //Estos métodos son getters nos permiten obtener la cantidad de invitados y filtrarlos
  int get howManyGuests => guests.length;

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done ).toList();

      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done ).toList();

      case GuestFilter.all:
        return guests;

      default:
        throw Exception('Filter value not valid');
    }
  }
  int get howManyFilteredGuests => filteredGuests.length;


  //Este método nos permite copiar el estado actual y cambiar los valores que queramos
  //esto se hace para no mutar el estado actual
  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );
  
  @override
  List<Object> get props => [filter, guests];
}