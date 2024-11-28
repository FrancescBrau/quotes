import 'package:flutter/material.dart';
import 'package:quotes/api_service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<Map<String, String>> quote;

  @override
  void initState() {
    super.initState();
    quote = ApiService().getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Quotes')),
        body: FutureBuilder(
          future: quote,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.hasError}'),
              );
            } else if (snapshot.hasData) {
              return const Center(
                child: Text('Quotes not found'),
              );
            } else {
              final quoteData = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('"${quoteData['quote']}"'),
                    const SizedBox(height: 24),
                    Text('- ${quoteData['author']}')
                  ],
                ),
              );
            }
          },
        ));
  }
}
