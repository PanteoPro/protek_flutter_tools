import 'package:dio/dio.dart';
import 'package:protek_flutter_tools/api/request/base_request.dart';

class FormRequestFile {
  const FormRequestFile({
    required this.bytes,
    required this.nameFile,
    required this.fieldName,
  });
  final List<int> bytes;
  final String nameFile;
  final String fieldName;
}

abstract class BaseFormRequest implements BaseRequest {
  List<FormRequestFile> get files;

  @override
  String get contentType => Headers.multipartFormDataContentType;
}
