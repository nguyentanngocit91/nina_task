class HandleException implements Exception {
  final String message;

  HandleException(this.message); // Pass your message in constructor.

  @override
  String toString() {
    return message;
  }
}