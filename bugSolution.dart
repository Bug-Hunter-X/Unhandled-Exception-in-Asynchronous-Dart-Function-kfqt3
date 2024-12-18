```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
      print('Data fetched successfully: $jsonData');
    } else {
      //Specific error handling
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('JSON format error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```