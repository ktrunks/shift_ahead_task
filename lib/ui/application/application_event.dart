//Base Class for Bloc Event extends Equatable to make it comparable
abstract class ApplicationBlocEvent {}

/// application initial event
class ApplicationInitialEvent extends ApplicationBlocEvent {
  List<Object> get props => [];
}

/// application loader display
class ApplicationLoadInProgress extends ApplicationBlocEvent {
  List<Object> get props => [];
}

/// application data success event
class ApplicationLoadSuccess extends ApplicationBlocEvent {
  Map<String, dynamic> contacts;

  ApplicationLoadSuccess(this.contacts);

  List<Object> get props => [contacts];
}

/// application  update searched contact event
class SearchedContactsEvent extends ApplicationBlocEvent {
  List<dynamic> contacts;

  SearchedContactsEvent(this.contacts);

  List<Object> get props => [contacts];
}

/// application search contacts
class SearchContact extends ApplicationBlocEvent {
  List<dynamic> contacts;

  SearchContact(this.contacts);

  List<Object> get props => [contacts];
}

/// application error event
class ApplicationErrorEvent extends ApplicationBlocEvent {
  final String errorMessage;

  ApplicationErrorEvent(this.errorMessage);

  List<Object> get props => [errorMessage];
}
