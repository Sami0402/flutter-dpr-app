import 'package:flutter/material.dart';

class ProjectDropdown extends StatelessWidget {
  const ProjectDropdown({
    super.key,
    required this.nameDropdownValue,
    required this.projectNames,
    required this.onChanged,
  });

  final String nameDropdownValue;
  final List<String> projectNames;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Project',
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
        initialValue: nameDropdownValue,
        icon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.arrow_drop_down, size: 30.0, color: Colors.black),
        ),
        style: TextStyle(fontSize: 20, color: Colors.black),
        onChanged: onChanged,
        items: projectNames.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}