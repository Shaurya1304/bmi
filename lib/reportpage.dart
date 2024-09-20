import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final double bmi;
  final String gender;

  const ReportPage({super.key, required this.bmi, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Report'),
        backgroundColor: Colors.grey[300], // Silver color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BMI Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600], // Darker gray for text
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Gender: $gender',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'BMI: ${bmi.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              _getBMICategory(bmi),
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            _buildBMIDescription(bmi),
            const SizedBox(height: 30),
            Divider(color: Colors.grey[400]),  // Horizontal line
            const SizedBox(height: 20),
            Text(
              'BMI Formula',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Below are the equations used for calculating BMI in the International System of Units (SI) and the US customary system (USC) using a 5\'10", 160-pound individual as an example:\n'
                  'USC Units:\n'
                  'BMI = 703 × mass (lbs) / height² (in²) = 703 × 160 / 702 = 23.0\n'
                  'SI, Metric Units:\n'
                  'BMI = mass (kg) / height² (m²) = 72.57 / 1.778² = 23.0\n\n'
                  'BMI Prime\n'
                  'BMI prime is the ratio of a person\'s measured BMI to the upper limit of BMI that is considered "normal," by institutions such as the WHO and the CDC. Though it may differ in some countries, such as those in Asia, this upper limit, which will be referred to as BMI_upper is 25 kg/m².\n\n'
                  'The BMI prime formula is:\n'
                  'BMI prime = BMI / 25\n\n'
                  'Since BMI prime is a ratio of two BMI values, BMI prime is a dimensionless value. A person who has a BMI prime less than 0.74 is classified as underweight; from 0.74 to 1 is classified as normal; greater than 1 is classified as overweight; and greater than 1.2 is classified as obese. The table below shows a person\'s weight classification based on their BMI prime:\n'
                  'Classification\tBMI\tBMI Prime\n'
                  'Severe Thinness\t< 16\t< 0.64\n'
                  'Moderate Thinness\t16 - 17\t0.64 - 0.68\n'
                  'Mild Thinness\t17 - 18.5\t0.68 - 0.74\n'
                  'Normal\t18.5 - 25\t0.74 - 1\n'
                  'Overweight\t25 - 30\t1 - 1.2\n'
                  'Obese Class I\t30 - 35\t1.2 - 1.4\n'
                  'Obese Class II\t35 - 40\t1.4 - 1.6\n'
                  'Obese Class III\t> 40\t> 1.6\n\n'
                  'BMI prime allows us to make a quick assessment of how much a person\'s BMI differs from the upper limit of BMI that is considered normal. It also allows for comparisons between groups of people who have different upper BMI limits.\n\n'
                  'Ponderal Index\n'
                  'The Ponderal Index (PI) is similar to BMI in that it measures the leanness or corpulence of a person based on their height and weight. The main difference between the PI and BMI is the cubing rather than squaring of the height in the formula (provided below). While BMI can be a useful tool when considering large populations, it is not reliable for determining leanness or corpulence in individuals. Although the PI suffers from similar considerations, the PI is more reliable for use with very tall or short individuals, while BMI tends to record uncharacteristically high or low body fat levels for those on the extreme ends of the height and weight spectrum. Below is the equation for computing the PI of an individual using USC, again using a 5\'10", 160-pound individual as an example:\n'
                  'USC Units:\n'
                  'PI = height (in) / ∛mass (lbs) = 70 / ∛160 = 12.9\n'
                  'SI, Metric Units:\n'
                  'PI = mass (kg) / height³ (m³) = 72.57 / 1.778³ = 12.9',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showFullContentDialog(context);
              },
              child: const Text('Know More'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,  // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFullContentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('BMI and Related Measurements'),
          content: SingleChildScrollView(
            child: Text(
              'BMI Formula\n\n'
                  'Below are the equations used for calculating BMI in the International System of Units (SI) and the US customary system (USC) using a 5\'10", 160-pound individual as an example:\n'
                  'USC Units:\n'
                  'BMI = 703 × mass (lbs) / height² (in²) = 703 × 160 / 702 = 23.0\n'
                  'SI, Metric Units:\n'
                  'BMI = mass (kg) / height² (m²) = 72.57 / 1.778² = 23.0\n\n'
                  'BMI Prime\n'
                  'BMI prime is the ratio of a person\'s measured BMI to the upper limit of BMI that is considered "normal," by institutions such as the WHO and the CDC. Though it may differ in some countries, such as those in Asia, this upper limit, which will be referred to as BMI_upper is 25 kg/m².\n\n'
                  'The BMI prime formula is:\n'
                  'BMI prime = BMI / 25\n\n'
                  'Since BMI prime is a ratio of two BMI values, BMI prime is a dimensionless value. A person who has a BMI prime less than 0.74 is classified as underweight; from 0.74 to 1 is classified as normal; greater than 1 is classified as overweight; and greater than 1.2 is classified as obese. The table below shows a person\'s weight classification based on their BMI prime:\n'
                  'Classification\tBMI\tBMI Prime\n'
                  'Severe Thinness\t< 16\t< 0.64\n'
                  'Moderate Thinness\t16 - 17\t0.64 - 0.68\n'
                  'Mild Thinness\t17 - 18.5\t0.68 - 0.74\n'
                  'Normal\t18.5 - 25\t0.74 - 1\n'
                  'Overweight\t25 - 30\t1 - 1.2\n'
                  'Obese Class I\t30 - 35\t1.2 - 1.4\n'
                  'Obese Class II\t35 - 40\t1.4 - 1.6\n'
                  'Obese Class III\t> 40\t> 1.6\n\n'
                  'BMI prime allows us to make a quick assessment of how much a person\'s BMI differs from the upper limit of BMI that is considered normal. It also allows for comparisons between groups of people who have different upper BMI limits.\n\n'
                  'Ponderal Index\n'
                  'The Ponderal Index (PI) is similar to BMI in that it measures the leanness or corpulence of a person based on their height and weight. The main difference between the PI and BMI is the cubing rather than squaring of the height in the formula (provided below). While BMI can be a useful tool when considering large populations, it is not reliable for determining leanness or corpulence in individuals. Although the PI suffers from similar considerations, the PI is more reliable for use with very tall or short individuals, while BMI tends to record uncharacteristically high or low body fat levels for those on the extreme ends of the height and weight spectrum. Below is the equation for computing the PI of an individual using USC, again using a 5\'10", 160-pound individual as an example:\n'
                  'USC Units:\n'
                  'PI = height (in) / ∛mass (lbs) = 70 / ∛160 = 12.9\n'
                  'SI, Metric Units:\n'
                  'PI = mass (kg) / height³ (m³) = 72.57 / 1.778³ = 12.9',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  Widget _buildBMIDescription(double bmi) {
    String description;
    Color color;
    if (bmi < 18.5) {
      description = 'You are underweight. Consider consulting with a healthcare provider for advice on achieving a healthy weight.';
      color = Colors.orange;
    } else if (bmi < 24.9) {
      description = 'You have a normal weight. Keep up the good work with your healthy lifestyle!';
      color = Colors.green;
    } else if (bmi < 29.9) {
      description = 'You are overweight. A balanced diet and regular exercise can help manage your weight.';
      color = Colors.orange;
    } else {
      description = 'You are obese. It is important to consult with a healthcare provider for a personalized plan to achieve a healthier weight.';
      color = Colors.red;
    }

    return Text(
      description,
      style: TextStyle(fontSize: 16, color: color),
    );
  }
}
