import 'package:flutter/material.dart';

class CardTemp extends StatelessWidget {
  final ValueNotifier<double>
      notificadorTemp; // Variable que almacena el valor del notificador
  const CardTemp({Key? key, required this.notificadorTemp})
      : super(key: key); // Se pasa como parametro el notificador

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Forma
      margin: EdgeInsets.all(15), // Margen
      elevation: 10, // Sombra
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 5),
            title: Text('Temperatura'),
            subtitle: notificadorTemp.value <= 0
                ? Text('Hace frío', style: TextStyle(color: Colors.blue))
                : notificadorTemp.value <= 30
                ? Text('La temperatura es agradable', style: TextStyle(color: Colors.green))
                : Text('La temperatura es alta', style: TextStyle(color: Colors.red)),
            leading: Icon(Icons.thermostat),
          )
        ],
      ),
    );
  }
}
