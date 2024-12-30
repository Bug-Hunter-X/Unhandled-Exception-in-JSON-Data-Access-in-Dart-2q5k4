```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Assuming jsonData is a list of maps
      for (var item in jsonData) {
        // Access data using item['key']
        print(item['key']);
      }
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    // Rethrow to be caught by calling function if needed
    rethrow;
  }
}
```