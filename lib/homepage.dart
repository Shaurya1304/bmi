import 'package:flutter/material.dart';
import 'splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightMetersController = TextEditingController();
  final TextEditingController _heightCentimetersController =
  TextEditingController();
  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _gender = 'Male'; // Default gender
  bool _isMetric = true; // Default to metric units

  void _calculateBMI() {
    final double height = _isMetric
        ? (double.tryParse(_heightMetersController.text) ?? 0) +
        (double.tryParse(_heightCentimetersController.text) ?? 0) / 100
        : (double.tryParse(_heightFeetController.text) ?? 0) * 0.3048 +
        (double.tryParse(_heightInchesController.text) ?? 0) * 0.0254;
    final double weight = double.tryParse(_weightController.text) ?? 0;

    double adjustedHeight = height;
    double adjustedWeight = weight;

    if (!_isMetric) {
      adjustedWeight = weight * 0.453592; // Convert pounds to kilograms
    }

    if (adjustedHeight > 0 && adjustedWeight > 0) {
      final double bmi = adjustedWeight / (adjustedHeight * adjustedHeight);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(bmi: bmi, gender: _gender),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.grey[300], // A more professional color scheme
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildInputCard(),
            const SizedBox(height: 20),
            _buildBMIDetails(),
            const SizedBox(height: 20),
            _buildBMITable(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter Your Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildUnitToggle(),
            const SizedBox(height: 16),
            _isMetric ? _buildMetricHeightInput() : _buildImperialHeightInput(),
            const SizedBox(height: 16),
            _buildWeightInput(),
            const SizedBox(height: 16),
            _buildAgeInput(),
            const SizedBox(height: 16),
            _buildGenderSelector(),
            const SizedBox(height: 16),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Units: '),
        Switch(
          value: _isMetric,
          onChanged: (bool value) {
            setState(() {
              _isMetric = value;
              _heightFeetController.clear();
              _heightInchesController.clear();
              _heightMetersController.clear();
              _heightCentimetersController.clear();
            });
          },
        ),
        Text(_isMetric ? 'Metric' : 'Imperial'),
      ],
    );
  }

  Widget _buildMetricHeightInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            controller: _heightMetersController,
            decoration: const InputDecoration(
              labelText: 'Meters',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: TextField(
            controller: _heightCentimetersController,
            decoration: const InputDecoration(
              labelText: 'Centimeters',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildImperialHeightInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            controller: _heightFeetController,
            decoration: const InputDecoration(
              labelText: 'Feet',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: TextField(
            controller: _heightInchesController,
            decoration: const InputDecoration(
              labelText: 'Inches',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildWeightInput() {
    return TextField(
      controller: _weightController,
      decoration: InputDecoration(
        labelText: _isMetric ? 'Weight in kg' : 'Weight in lbs',
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildAgeInput() {
    return TextField(
      controller: _ageController,
      decoration: const InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildGenderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Gender: '),
        Radio<String>(
          value: 'Male',
          groupValue: _gender,
          onChanged: (String? value) {
            setState(() {
              _gender = value!;
            });
          },
        ),
        const Text('Male'),
        Radio<String>(
          value: 'Female',
          groupValue: _gender,
          onChanged: (String? value) {
            setState(() {
              _gender = value!;
            });
          },
        ),
        const Text('Female'),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton(
      onPressed: _calculateBMI,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300], // Match the app's theme
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      ),
      child: const Text(
        'Calculate BMI',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildBMIDetails() {
    return Column(
      children: const [
        Text(
          'The Body Mass Index (BMI) Calculator helps you determine if your weight is healthy for your height.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Text(
          'Please enter your details and switch between metric and imperial units as needed.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBMITable() {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          _buildTableCell('Category', isHeader: true),
          _buildTableCell('BMI Range', isHeader: true),
        ]),
        TableRow(children: [
          _buildTableCell('Severe Thinness'),
          _buildTableCell('< 16'),
        ]),
        TableRow(children: [
          _buildTableCell('Moderate Thinness'),
          _buildTableCell('16 - 16.9'),
        ]),
        TableRow(children: [
          _buildTableCell('Mild Thinness'),
          _buildTableCell('17 - 18.4'),
        ]),
        TableRow(children: [
          _buildTableCell('Normal'),
          _buildTableCell('18.5 - 24.9'),
        ]),
        TableRow(children: [
          _buildTableCell('Overweight'),
          _buildTableCell('25 - 29.9'),
        ]),
        TableRow(children: [
          _buildTableCell('Obese Class I'),
          _buildTableCell('30 - 34.9'),
        ]),
        TableRow(children: [
          _buildTableCell('Obese Class II'),
          _buildTableCell('35 - 39.9'),
        ]),
        TableRow(children: [
          _buildTableCell('Obese Class III'),
          _buildTableCell('≥ 40'),
        ]),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 16 : 14,
        ),
      ),
    );
  }
}

