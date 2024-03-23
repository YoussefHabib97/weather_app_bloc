import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text("Search"),
              hintText: "Enter City Name",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_outlined),
              ),
            ),
            onSubmitted: (value) {},
          ),
        ),
      ),
    );
  }
}
