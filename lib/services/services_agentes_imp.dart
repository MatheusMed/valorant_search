import 'package:dio/dio.dart';
import 'package:valorant_search/core/consts.dart';
import 'package:valorant_search/models/agente_model.dart';
import 'package:valorant_search/services/i_services_agentes.dart';

class ServicesAgentesImp implements IServicesAgentes {
  final Dio _dio;

  ServicesAgentesImp(this._dio);

  @override
  Future<List<ValorantModel>> getAllAgentes() async {
    try {
      final Response response = await _dio.get(BASEURL);
      final data = response.data as List;

      final valorantModelList =
          data.map((e) => ValorantModel.fromJson(e)).toList();

      return valorantModelList;
    } on DioException catch (e) {
      throw Exception(e.message.toString());
    }
  }
}
