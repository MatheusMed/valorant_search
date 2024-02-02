import 'package:valorant_search/models/agente_model.dart';

abstract interface class IServicesAgentes {
  Future<List<ValorantModel>> getAllAgentes();
}
