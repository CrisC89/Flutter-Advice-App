import 'package:advice_app/application/core/services/theme.service.dart';
import 'package:advice_app/application/pages/advice/widgets/advice-field.widget.dart';
import 'package:advice_app/application/pages/advice/widgets/basic-custom-button.widget.dart';
import 'package:advice_app/application/pages/advice/widgets/error-message.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: theme.textTheme.displayLarge),
        centerTitle: true,
        actions: [
          Switch(value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_){
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
            children: [
              Expanded(child:
              Center(
                child:
                  ErrorMessage(message: "Oups, something gone wrong ..."),
                //AdviceField(advice: 'Exemple advice - your day will be good'),
                /*CircularProgressIndicator(
                  color: theme.colorScheme.secondary,
                )*/
                /*Text(
                  'Your advice is waiting for you', style: theme.textTheme.displayLarge,
                )*/
              )),
              SizedBox(
                height: 200,
                child: Center(
                    child:BasicCustomButton()
                )
              )
            ]
        ),
      ),
    );
  }
}
