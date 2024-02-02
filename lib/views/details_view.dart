import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_search/models/agente_model.dart';

class DetailsView extends StatelessWidget {
  final ValorantModel valorantModel;
  const DetailsView({super.key, required this.valorantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(valorantModel.displayName!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Image.network(valorantModel.displayIcon!),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(valorantModel.role!.displayName!),
              ),
              const SizedBox(width: 10),
              Center(
                child: Image.network(
                  valorantModel.role!.displayIcon!,
                  height: 30,
                  width: 30,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            valorantModel.description!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4 / 2,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemCount: valorantModel.abilities!.length,
              itemBuilder: (context, index) {
                final habilidade = valorantModel.abilities![index];
                return habilidade.displayIcon == null
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text(habilidade.displayName!),
                                content: Column(
                                  children: [
                                    Center(
                                      child: Image.network(
                                        habilidade.displayIcon!,
                                        height: 70,
                                        width: 70,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      habilidade.description!,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                habilidade.displayIcon!,
                                width: 80.0,
                                height: 80.0,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                habilidade.displayName!,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
