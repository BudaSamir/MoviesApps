class ErrorMessageModel {
  final int statusCode;
  final String statusMessage;
  final bool success;
  ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorMessageModel &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          statusMessage == other.statusMessage &&
          success == other.success;

  @override
  int get hashCode =>
      statusCode.hashCode ^ statusMessage.hashCode ^ success.hashCode;
}
