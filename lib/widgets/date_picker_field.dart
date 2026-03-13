import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required TextEditingController dateController, required this.onTap,
  }) : _dateController = dateController;

  final TextEditingController _dateController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Date Picker',
        hintText: 'Select Date',
        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.calendar_month_sharp,
            size: 30.0,
            color: Colors.black,
          ),
        ),
    
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
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(width: 1.5),
        ),
      ),
      onTap: onTap,
        
    );
  }
}