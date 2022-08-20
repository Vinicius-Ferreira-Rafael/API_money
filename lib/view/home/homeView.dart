import 'package:flutter/material.dart';
import 'package:money/model/moneyModel.dart';

import '../../data/dataController.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  moneyModel model = moneyModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder<moneyModel?>(
              future: DataController().getMoney(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.error == true) {
                  return Text("Erro ao carregar!");
                }

                /// moneyModel
                model = snapshot.data ?? model;
                return Text(model.bTCBRL?.name ?? "");
              })
        ],
      ),
    );
  }
}
