import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_search/controllers/agente_controller.dart';
import 'package:valorant_search/services/services_agentes_imp.dart';
import 'package:valorant_search/views/details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final agenteController =
      AgenteController(servicesAgentes: ServicesAgentesImp(dio: Dio()));

  @override
  void initState() {
    agenteController.getAgentes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agentes'),
      ),
      body: ValueListenableBuilder(
        valueListenable: agenteController.listaAgentes,
        builder: (context, lista, child) {
          return CupertinoScrollbar(
            child: CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 0),
                    child: CupertinoTextField(
                      controller: agenteController.searchController,
                      onChanged: (search) =>
                          agenteController.searchAgentes(search),
                      placeholder: "Pesquisar Agente",
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final agente = lista[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoListTile(
                        leading: Image.network(agente.displayIconSmall!),
                        title: Text(agente.displayName!),
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => DetailsView(
                                        valorantModel: agente,
                                      )));
                        },
                        subtitle: Text(
                          agente.description!,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    );
                  }, childCount: lista.length),
                ),
              ],
              shrinkWrap: true,
            ),
          );
        },
      ),
    );
  }
}


// ListView.builder(
//             shrinkWrap: true,
//             itemCount: lista.length,
//             itemBuilder: (context, index) {
//               final agente = lista[index];
//               return Card(
//                 child: ListTile(
//                   title: Text(agente.displayName!),
//                   leading: Image.network(agente.displayIconSmall!),
//                   subtitle: Text(agente.description!),
//                 ),
//               );
//             },
//           );