import 'package:flutter/material.dart';

class WeatherDropdown extends StatelessWidget {
  const WeatherDropdown({
    super.key,
    required this.weatherDropdownValue,
    required this.wheathers,
    required this.onChanged,
  });

  final String? weatherDropdownValue;
  final List<String> wheathers;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Wheather Dropdown',
          hintText: 'Select Weather',
          hintStyle: TextStyle(fontSize: 20, color: Colors.black),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1.5),
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.wb_sunny, size: 30.0, color: Colors.black),
        ),
        style: TextStyle(fontSize: 20, color: Colors.black),
        initialValue: weatherDropdownValue,
        onChanged: onChanged,
        items: wheathers.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
