import 'package:dpr_app/data/project_data.dart';
import 'package:dpr_app/models/project_model.dart';
import 'package:dpr_app/widgets/custom_button.dart';
import 'package:dpr_app/widgets/date_picker_field.dart';
import 'package:dpr_app/widgets/image_picker_section.dart';
import 'package:dpr_app/widgets/project_dropdown.dart';
import 'package:dpr_app/widgets/weather_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DprFormScreen extends StatefulWidget {
  const DprFormScreen({super.key, required this.project});

  final ProjectModel project;

  @override
  State<DprFormScreen> createState() => _DprFormScreenState();
}

class _DprFormScreenState extends State<DprFormScreen> {
  final projects = ProjectData.projects;
  late String nameDropdownValue;
  final TextEditingController _dateController = TextEditingController();
  String? weatherDropdownValue;
  List<XFile> images = [];
  final _formKey = GlobalKey<FormState>();

  void formValidation() {
    if (_formKey.currentState!.validate()) {
      // DATE PICKER VALIDATION
      if (_dateController.text.trim().isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Please select a date")));

        // WEATHER VALIDATION
      } else if (weatherDropdownValue == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Please select weather")));

        // IMAGE PICKER VALIDATION
      } else if (images.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please upload at least one photo")),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("DPR submitted successfully")));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    nameDropdownValue = widget.project.name;
  }

  @override
  Widget build(BuildContext context) {
    final projectNames = ProjectData.projectNames(projects);
    final List<String> wheathers = ProjectData.wehather;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Submit DPR',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, size: 30),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // PROJECT DROPDOWN
                ProjectDropdown(
                  nameDropdownValue: nameDropdownValue,
                  projectNames: projectNames,
                  onChanged: (newValue) {
                    setState(() {
                      nameDropdownValue = newValue!;
                    });
                  },
                ),
                SizedBox(height: 25),
                // DATE PICKER
                DatePickerField(
                  dateController: _dateController,
                  onTap: _selectDate,
                ),
                SizedBox(height: 25),
                // WEATHER DROPDOWN
                WeatherDropdown(
                  weatherDropdownValue: weatherDropdownValue,
                  wheathers: wheathers,
                  onChanged: (newValue) {
                    setState(() {
                      weatherDropdownValue = newValue!;
                    });
                  },
                ),
                SizedBox(height: 25),
                // WORK DESCRIPTION TEXTFEILD
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter work description';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  maxLines: 4,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Work Accomplished',
                    hintText:
                        'Support beams Installation and foundation work Completed...',
                    hintStyle: TextStyle(fontSize: 20),

                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                // WOKERR COUNT TEXTFIELD
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter number of workers';
                    } else if (int.tryParse(value) == null) {
                      return "Please enter a valid integer";
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Total Workers',
                    hintText: 'Enter Total workers',
                    hintStyle: TextStyle(fontSize: 20),
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // IMAGE PICKER SECTION
                ImagePickerSection(
                  images: images,
                  onTap: _pickeImageFromGallery,
                ),
                SizedBox(height: 25),
                // SUBMIT BUTTON
                CustomButton(
                  text: 'SUBMIT DPR',
                  onPressed: formValidation,
                  textSize: 22.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // SELECTS DATE FROM DATEPICKER
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  // SELECT IMAGE USING IMAGE PICKER
  Future _pickeImageFromGallery() async {
    final List<XFile> selected = await ImagePicker().pickMultiImage();
    if (selected.isEmpty) return;
    setState(() {
      // images = images.map((e) => XFile(e.path)).toList();
      images = selected;
    });
    print(images.length);
  }
}


