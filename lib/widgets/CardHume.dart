import 'package:flutter/material.dart';

class CardHume extends StatelessWidget {
  final ValueNotifier<double>
  notificadorHume; // Variable que almacena el valor del notificador
  const CardHume({Key? key, required this.notificadorHume})
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
            contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 5),
            title: Text('Humedad'),
            subtitle: notificadorHume.value <= 0
                ? Text('El tiempo es seco', style: TextStyle(color: Colors.brown))
                : notificadorHume.value <= 50
                ? Text('La humedad es media', style: TextStyle(color: Colors.yellow.shade800))
                : Text('La humedad es alta', style: TextStyle(color: Colors.purple)),
            leading: Icon(Icons.water_drop_outlined),
          ),
        ],
      ),
    );
  }
}
