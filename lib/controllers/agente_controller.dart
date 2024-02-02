import 'package:flutter/material.dart';
import 'package:valorant_search/models/agente_model.dart';
import 'package:valorant_search/services/i_services_agentes.dart';

class AgenteController {
  final IServicesAgentes _servicesAgentes;

  AgenteController({
    required IServicesAgentes servicesAgentes,
  }) : _servicesAgentes = servicesAgentes;

  final listaAgentes = ValueNotifier(<ValorantModel>[]);

  final searchController = TextEditingController();

  Future<List<ValorantModel>> getAgentes() async {
    final lista = await _servicesAgentes.getAllAgentes();

    listaAgentes.value = List.from(lista);

    return listaAgentes.value;
  }

  searchAgentes(String search) async {
    final listaOriginal = await _servicesAgentes.getAllAgentes();

    if (search.isEmpty) {
      listaAgentes.value = List.from(listaOriginal);
    } else {
      final listaFiltrada = listaOriginal
          .where((agente) => agente.displayName!
              .toLowerCase()
              .contains(search.toLowerCase().toString()))
          .toList();

      listaAgentes.value = listaFiltrada.isEmpty ? [] : listaFiltrada;
    }
  }
}
