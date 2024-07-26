import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GHume extends StatelessWidget {
  final ValueNotifier<double>
      notificadorHume; // Variable que almacena el valor del notificador
  const GHume({Key? key, required this.notificadorHume})
      : super(key: key); // Se pasa como parametro el notificador

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        // Widget que construye la interfaz a partir de un valor que cambia
        valueListenable:
            notificadorHume, // Se establece como primer parametro el notificador de la humedad
        // builder es el callback que se llama cuando el valor de valueListenable cambia
        // Los parametros son:
        // 1. El contexto en el que se construye el widget
        // 2. El valor actual de la humedad
        // 3. El widget que se usa para construir la interfaz
        builder: (context, humidity, child) {
          return SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              labelsPosition: ElementsPosition.outside,
              axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.1,
              ),
              majorTickStyle: const MajorTickStyle(
                  length: 0.1, thickness: 2, lengthUnit: GaugeSizeUnit.factor),
              minorTickStyle: const MinorTickStyle(
                  length: 0.05,
                  thickness: 1.5,
                  lengthUnit: GaugeSizeUnit.factor),
              minimum: -10,
              maximum: 100,
              interval: 10,
              //radiusFactor: 0.5,
              //showAxisLine: false,
              //labelOffset: 5,

              useRangeColorForAxis: true,
              axisLabelStyle: const GaugeTextStyle(fontWeight: FontWeight.bold),
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: -10,
                    endValue: 0,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Colors.brown,
                    endWidth: 0.03,
                    startWidth: 0.03),
                GaugeRange(
                    startValue: 0,
                    endValue: 50,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Colors.yellow,
                    endWidth: 0.03,
                    startWidth: 0.03),
                GaugeRange(
                    startValue: 50,
                    endValue: 100,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Colors.purple,
                    endWidth: 0.03,
                    startWidth: 0.03),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: humidity,
                    needleColor: Colors.black,
                    tailStyle: TailStyle(
                        length: 0.18,
                        width: 8,
                        color: Colors.black,
                        lengthUnit: GaugeSizeUnit.factor),
                    needleLength: 0.68,
                    needleStartWidth: 1,
                    needleEndWidth: 8,
                    knobStyle: KnobStyle(
                        knobRadius: 0.07,
                        color: Colors.white,
                        borderWidth: 0.05,
                        borderColor: Colors.black),
                    lengthUnit: GaugeSizeUnit.factor)
              ],

              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text(
                      "$humidity%",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    positionFactor: 0.8,
                    angle: 90)
              ],
            ),
          ]);
        });
  }
}
