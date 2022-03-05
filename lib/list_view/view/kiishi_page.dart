// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:very_good_cli_project/l10n/l10n.dart';
import 'package:very_good_cli_project/list_view/cubit/kiishi_cubit.dart';
import 'package:very_good_cli_project/model/kiishi_model.dart';

class IAmKiishi extends StatelessWidget {
  IAmKiishi({Key? key}) : super(key: key);

  final List<String> _elementsOfKiishi = [
    'My Name',
    'Car Name',
    'Favourite Colour',
    'Favourite Outfit',
    'Favourite Shoes',
    'Favourite Instrument',
    'FrameWork',
  ];

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('I Am Kiishi'),
      ),
      body: BlocBuilder<TheAppCubit, List<Kiishi>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red.shade400,
                color: Colors.red.shade800,
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: _screenSize.height * 0.02,
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(
                          '$_elementsOfKiishi[0] + :  + $state[0].name',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[1] + :  + $state[0].carName',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[2] + :  + $state[0].favouriteColour',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[3] + :  + $state[0].favouriteOutfit',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[4] + :  + $state[0].favouriteShoes',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[5] + :  + $state[0].favouriteInstrument',
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        title: Text(
                          '$_elementsOfKiishi[6] + :  + $state[0].frameWork',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
