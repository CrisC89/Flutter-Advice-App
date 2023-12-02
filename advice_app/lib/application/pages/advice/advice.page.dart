import 'package:advice_app/application/core/services/theme.service.dart';
import 'package:advice_app/application/pages/advice/bloc/advice_bloc.dart';
import 'package:advice_app/application/pages/advice/widgets/advice-field.widget.dart';
import 'package:advice_app/application/pages/advice/widgets/basic-custom-button.widget.dart';
import 'package:advice_app/application/pages/advice/widgets/error-message.widget.dart';
import 'package:advice_app/dependency-injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicePageWrapperProvider extends StatelessWidget {

  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    print("Page wapper");
    return BlocProvider(
      create: (context) => sl<AdviceBloc>(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Page");
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: theme.textTheme.displayLarge),
        centerTitle: true,
        actions: [
          Switch(value: Provider
              .of<ThemeService>(context)
              .isDarkModeOn,
              onChanged: (_) {
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
                child: BlocBuilder<AdviceBloc, AdviceState>(
                  builder: (context, state) {
                    if(state is AdviceInitial){
                      return Text(
                        'Your advice is waiting for you', style: theme.textTheme.displayLarge,
                      );
                    }else if (state is AdviceStateLoading) {
                      return CircularProgressIndicator(
                        color: theme.colorScheme.secondary,
                      );
                    } else if(state is AdviceStateLoaded){
                      return AdviceField(advice: state.advice);
                    }else if (state is AdviceStateError) {
                      return ErrorMessage(
                          message: state.message);
                    }

                    return const SizedBox();
                  },
                ),
                //,
              )),
              SizedBox(
                  height: 200,
                  child: Center(
                      child: BasicCustomButton()
                  )
              )
            ]
        ),
      ),
    );
  }
}
