import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: RadialGauge(),
        ),
      ),
    );
  }
}

class RadialGauge extends StatefulWidget {
  const RadialGauge({super.key});

  @override
  State<RadialGauge> createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  /// Defines the label names as months for the radial gauge.
  void Function(AxisLabelCreatedArgs)? _onLabelCreated() {
    return (AxisLabelCreatedArgs args) {
      switch (args.text) {
        case '1':
          args.text = 'January';
        case '2':
          args.text = 'February';
        case '3':
          args.text = 'March';
        case '4':
          args.text = 'April';
        case '5':
          args.text = 'May';
        case '6':
          args.text = 'June';
        case '7':
          args.text = 'July';
        case '8':
          args.text = 'August';
        case '9':
          args.text = 'September';
        case '10':
          args.text = 'October';
        case '11':
          args.text = 'November';
        case '12':
          args.text = 'December';
      }
    };
  }

  /// Builds the widget pointer commonly which used to denote the name of the seasons in the radial gauge.
  WidgetPointer _buildWidgetPointer(double value, String label, Color color) {
    return WidgetPointer(
      value: value,
      offset: -60,
      child: Container(
        height: 35,
        width: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  /// Handles the range of the radial gauge commonly.
  GaugeRange _buildGaugeRange(double start, double end, Color colors) {
    return GaugeRange(
      startValue: start,
      endValue: end,
      rangeOffset: 0.06,
      sizeUnit: GaugeSizeUnit.factor,
      startWidth: 0.2,
      endWidth: 0.2,
      color: colors,
    );
  }

  /// Builds the title of the radial gauge using the gauge annotation.
  List<GaugeAnnotation> _buildGaugeAnnotation() {
    return const <GaugeAnnotation>[
      GaugeAnnotation(
        axisValue: 5,
        positionFactor: 0.01,
        angle: 180,
        widget: Text(
          'Seasons in India',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
    ];
  }

  late List<WidgetPointer> _pointers;
  late List<GaugeRange> _ranges;

  @override
  void initState() {
    /// The list which holds the four pointers based on the different seasons.
    _pointers = [
      _buildWidgetPointer(
          1.5, "Winter", const Color.fromARGB(252, 81, 165, 249)),
      _buildWidgetPointer(
          10.5, "Autumn", const Color.fromARGB(255, 205, 144, 60)),
      _buildWidgetPointer(
          7.5, "Summer", const Color.fromARGB(255, 226, 15, 15)),
      _buildWidgetPointer(
          4.5, "Spring", const Color.fromARGB(255, 89, 195, 31)),
    ];

    /// The list which specifies the multiple ranges of each segments in the radial gauge based on the different seasons.
    _ranges = [
      _buildGaugeRange(0, 3, const Color.fromARGB(255, 63, 162, 246)),
      _buildGaugeRange(3, 6, const Color.fromARGB(255, 45, 180, 24)),
      _buildGaugeRange(6, 9, const Color.fromARGB(240, 232, 6, 6)),
      _buildGaugeRange(9, 12, const Color.fromARGB(255, 215, 126, 42)),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          pointers: _pointers,
          onLabelCreated: _onLabelCreated(),
          showAxisLine: false,
          ticksPosition: ElementsPosition.outside,
          labelsPosition: ElementsPosition.outside,
          canRotateLabels: true,
          startAngle: 270,
          endAngle: 270,
          // used for applying the color to the radial axis as similar to the range color.
          useRangeColorForAxis: true,
          interval: 1,
          minimum: 0,
          maximum: 12,
          showFirstLabel: false,
          showLastLabel: true,
          annotations: _buildGaugeAnnotation(),
          axisLabelStyle: const GaugeTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          majorTickStyle: const MajorTickStyle(
            length: 0.15,
            lengthUnit: GaugeSizeUnit.factor,
            thickness: 1,
          ),
          minorTicksPerInterval: 4,
          labelOffset: 35,
          minorTickStyle: const MinorTickStyle(
            length: 0.04,
            lengthUnit: GaugeSizeUnit.factor,
            thickness: 1,
          ),
          ranges: _ranges,
        ),
      ],
    );
  }
}
