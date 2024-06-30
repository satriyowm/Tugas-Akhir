import 'package:flutter/material.dart';

class ChildActivitiesPage extends StatelessWidget {
  final String childName;
  final int childAge;

  const ChildActivitiesPage({required this.childName, required this.childAge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Activities Report'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_child_activities.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSection('Child Information', [
                  _buildInfoRow('Name', childName),
                  _buildInfoRow('Age', '$childAge years'),
                  _buildInfoRow(
                      'Drop-off Date', _getFormattedDate(DateTime.now())),
                  _buildInfoRow('Arrival Time', '08:30 AM'),
                  _buildInfoRow('Body Temperature', '36.5°C'),
                  _buildInfoRow('Condition', 'Healthy'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Meal Schedule', [
                  _buildMealInfo(
                      'Breakfast', 'Ayam', 'some', 'makannya lambat'),
                  _buildMealInfo('Lunch', 'Sayur sop dan Protein Hewani',
                      'some', 'makannya cepat'),
                  _buildMealInfo('Dinner', 'Berbagai jenis sayur dan protein',
                      'some', 'makannya cepat'),
                  _buildMealInfo(
                      'Fluids', 'Susu dan jus ', 'some', 'banyak minum'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Toilet Time', [
                  _buildInfoRow('Time', '09:00 AM'),
                  _buildInfoRow('Type', 'Potty'),
                  _buildInfoRow('Dry/Wet/BM', 'Dry'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Child\'s Feelings', [
                  _buildFeelingRow('Sad', false),
                  _buildFeelingRow('Happy', false),
                  _buildFeelingRow('Shy', false),
                  _buildFeelingRow('Confident', false),
                  _buildFeelingRow('Naughty', false),
                  _buildFeelingRow('Sociable', true),
                ]),
                const SizedBox(height: 20),
                _buildSection('Items Needed', [
                  _buildItemRow('Diapers', false),
                  _buildItemRow('Towel', true),
                  _buildItemRow('Hand Towel', true),
                  _buildItemRow('Soap', true),
                  _buildItemRow('Shampoo', true),
                  _buildItemRow('Cream', false),
                  _buildItemRow('Milk', true),
                  _buildItemRow('Clothes', true),
                  _buildItemRow('Toothpaste', true),
                  _buildItemRow('Other', true),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.0),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Column(children: children),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label:',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMealInfo(
      String mealType, String food, String quantity, String comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealType,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        _buildInfoRow('Food', food),
        _buildInfoRow('Quantity', quantity),
        _buildInfoRow('Comments', comments),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildFeelingRow(String feeling, bool isExpressed) {
    return _buildInfoRow(feeling, isExpressed ? 'Yes' : 'No');
  }

  Widget _buildItemRow(String item, bool isNeeded) {
    return _buildInfoRow(item, isNeeded ? 'Yes' : 'No');
  }

  String _getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
