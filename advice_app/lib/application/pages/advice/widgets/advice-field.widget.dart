import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget{

  final String advice;
  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text('" $advice "',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center),
        ),
      ),
    );
  }
  
}