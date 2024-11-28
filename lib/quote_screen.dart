import 'package:flutter/material.dart';
import 'package:quotes/api_service.dart';
import 'package:quotes/quote_button.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late List<Map<String, String>> quotes;
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();
    quotes = [];
  }

  void _getNewQuote() async {
    try {
      final newQuote = await ApiService().getQuote();
      setState(() {
        quotes.add(newQuote);
        currentIndex = quotes.length - 1;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error. Something went wrong.')),
      );
    }
  }

  void _getPreviousQuote() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (currentIndex >= 0 && currentIndex < quotes.length) ...[
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '"${quotes[currentIndex]['quote']}"',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '- ${quotes[currentIndex]['author']}',
                  ),
                ],
              ),
            ),
          ] else ...[
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Press button "Get a new Quote" for a new Quote'),
                SizedBox(height: 32)
              ],
            )
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuoteButton(onPressed: _getNewQuote),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _getPreviousQuote,
                child: const Text('Back to last Quote'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
