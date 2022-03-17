import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:very_good_cli_project/l10n/l10n.dart';
import 'package:very_good_cli_project/list_view/kiishi.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      //   colorScheme: ColorScheme.fromSwatch(
      //     accentColor: const Color(0xFF13B9FF),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TheAppCubit>(
        create: (context) => TheAppCubit()..favourite,
        child: IAmKiishi(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
