# task
This is application which demonstrates :
 1. reading contacts from assets file .
 2. Ordering contacts with respect to alphabetic order.
 3. Grouping with fist letter of the name.
 4. On click of name navigating to detail screen.
 5. search features which helps to filter according to typed text.
 6. on click of character which will scroll to position where  name contains with first letter of character.


Application Structure:
 1. route :  screens which is available in the application.
 2. application : which contains application level data handling.
 3. ui : which contains screens ui of the application.
 4. util : which contains colors,enums,style which is used for the ui.
 5. assets : which contains application internal files (image ,locale, data).
 6. Used Flutter Bloc - State management plugin


why a “scroll to index” behaviour is not as straightforward?
ListView or scroll widget doesn't contain internal method  navigate to index or jump to,
since listview doesn't know the height of total widget and  listview  only build visual viewport of
the application.
To handle Scroll to index or jump to position
we should know the height of the each item to achieve it.


plugin used:
flutter_bloc - state management.
fluro - screen navigation.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


