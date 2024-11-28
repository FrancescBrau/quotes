abstract class DatabaseRepository {
  Future<List<Map<String, String>>> getAllQuotes();

  Future<void> addQuote(Map<String, String> quote);

  Future<void> deleteQuote(int quote);
}
