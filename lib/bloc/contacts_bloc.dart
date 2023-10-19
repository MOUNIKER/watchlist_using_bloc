import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watchlist_using_bloc/contact_repository.dart';
import 'contacts_event.dart';
import 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactRepository _contactRepository;

  ContactsBloc(this._contactRepository) : super(ContactLoadingState()) {
    on<LoadContactEvent>(_onLoadContactEvent);
  }

  void _onLoadContactEvent(
      LoadContactEvent event, Emitter<ContactsState> emit) async {
    emit(ContactLoadingState());
    try {
      final users =
          await _contactRepository.getContacts(event.startId, event.endId);
      emit(ContactLoadedState(users));
    } catch (e) {
      emit(ContactErrorState());
    }
  }
}
