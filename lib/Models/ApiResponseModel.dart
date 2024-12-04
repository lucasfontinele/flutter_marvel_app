class ApiResponseModel<T> {
  final int code;
  final String status;
  final List<T> results;

  ApiResponseModel({
    required this.code,
    required this.status,
    required this.results,
  });

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonModel,
  ) {
    final results = (json['data']['results'] as List)
        .map((item) => fromJsonModel(item))
        .toList();

    return ApiResponseModel(
      code: json['code'],
      status: json['status'],
      results: results,
    );
  }
}
