import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicCustomButton extends StatelessWidget{
  const BasicCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkResponse(
      onTap: (){
        print('Button pressed - will be implemented later');
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.colorScheme.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text("Get advice", style: theme.textTheme.displayLarge)
          ),
        ),
      ),
    );
  }

}
