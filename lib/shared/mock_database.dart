import 'package:quotes/shared/database_repository.dart';

class MockDatabase implements Database_Repository {
  final List<Map<String, String>> _quotes = [];

  @override
  Future<List<Map<String, String>>> getAllQuotes() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _quotes;
  }

  @override
  Future<void> addQuote(Map<String, String> quote) async {
    if (quote['quote']!.isNotEmpty &&
        !_quotes
            .any((existingQuote) => existingQuote['quote'] == quote['quote'])) {
      _quotes.add(quote);
    }
  }

  @override
  Future<void> deleteQuote(int quote) async {
    _quotes.removeAt(quote);
  }

  @override
  Map<String, String>? getLastQuote() {
    // TODO: implement getLastQuote
    throw UnimplementedError();
  }

  @override
  List<Map<String, String>> getQuotes() {
    // TODO: implement getQuotes
    throw UnimplementedError();
  }
}
