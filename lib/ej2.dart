import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalizarTextos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return (Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
        children: [
          
        Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
            child: Text(
              'Hola Mundo',
              style: style,
              textAlign: TextAlign.right ,
            )),
        Text(
          'Hola Mundo',
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
        Text(
          'Hola Mundo',
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
        ),
        Text(
          'Hola Mundo',
          style: TextStyle(
              color: Colors.green, fontSize: 30, fontStyle: FontStyle.italic),
        ),
        Text(
          'Hola Mundo',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            decoration: TextDecoration.underline,
            
          ),
          textAlign: TextAlign.right ,
        ),
        Text(
          'This is Google Fonts lato',
          style: GoogleFonts.lato(),
        ),
        Text(
          'This is Google Fonts roboto serif',
          style: GoogleFonts.robotoSerif(),
        ),
        Text(
          'This is Google Fonts gothic A1',
          style: GoogleFonts.gothicA1(),
        ),
        Text(
          'This is Google Fonts abel',
          style: GoogleFonts.abel(),
        ),
      ]),
    ));
  }
}
