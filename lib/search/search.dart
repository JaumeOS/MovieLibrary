import 'package:flutter/material.dart';

class Prova extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    print('buildActions');
  }

  @override
  Widget? buildLeading(BuildContext context) {
    print('buildActions');
  }

  @override
  Widget buildResults(BuildContext context) {
    print('buildResults');
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('buildSuggestions');
    throw UnimplementedError();
  }

}