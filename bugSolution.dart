```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        for (final item in jsonData) {
          if (item is Map && item.containsKey('key')) {
            print(item['key']);
          } else {
            print('Invalid JSON structure encountered: $item');
          }
        }
      } else {
        print('Unexpected JSON format. Expected a List but got: $jsonData');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}
```