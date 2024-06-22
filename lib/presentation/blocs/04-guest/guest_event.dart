part of 'guest_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}


//Metodo para cambiar el filtro de los invitados
final class SetCustomFilterEvent extends GuestsEvent{
  final GuestFilter newFilter;
  const SetCustomFilterEvent(this.newFilter);
}

//Metodo para agregar un invitado
final class AddGuest extends GuestsEvent{
  final String name;
  const AddGuest( this.name );
}

//Metodo para eliminar un invitado
final class ToggleGuest extends GuestsEvent {
  final String id;
  const ToggleGuest( this.id );
}
