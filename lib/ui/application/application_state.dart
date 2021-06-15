abstract class ApplicationBlocState {}

/// application state
class ApplicationDataState extends ApplicationBlocState {
  Map<String, dynamic> contacts;
  List<dynamic> tags;

  ApplicationDataState(this.contacts, this.tags);

  List<Object> get props => [contacts, tags];
}

/// application search state
/// which contains searched contacts
class SearchContactState extends ApplicationBlocState {
  List<dynamic> contacts;

  SearchContactState(this.contacts);

  List<Object> get props => [contacts];
}

/// application init state which is userd to display loader which loading data
class ApplicationInitialState extends ApplicationBlocState {
  List<Object> get props => [];
}


/// application error state
class ApplicationDateErrorState extends ApplicationBlocState {
  final String errorMessage;

  ApplicationDateErrorState(this.errorMessage);

  List<Object> get props => [errorMessage];
}
