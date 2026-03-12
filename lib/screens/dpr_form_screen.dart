import 'dart:io';

import 'package:dpr_app/data/project_data.dart';
import 'package:dpr_app/models/project_model.dart';
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
  String? wheatherDropdownValue;
  List<XFile> images = [];
  final _formKey = GlobalKey<FormState>();

  void formValidation() {
    if (_formKey.currentState!.validate()) {
      // DATE PICKER VALIDATION
      if (_dateController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a date"))
        );

        // WEATHER VALIDATION
      } else if (wheatherDropdownValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select weather"))
        );
        
        // IMAGE PICKER VALIDATION
      } else if (images.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please upload at least one photo")),
        );
        
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("DPR submitted successfully")),
        );
        
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
                SizedBox(
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
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        nameDropdownValue = newValue!;
                      });
                    },
                    items: projectNames.map<DropdownMenuItem<String>>((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 25),
                // DATE PICKER
                TextFormField(
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
                  onTap: () {
                    _selectDate();
                  },
                ),
                SizedBox(height: 25),
                // WEATHER DROPDOWN
                SizedBox(
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
                      child: Icon(
                        Icons.wb_sunny,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    initialValue: wheatherDropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        wheatherDropdownValue = newValue!;
                      });
                    },
                    items: wheathers.map<DropdownMenuItem<String>>((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
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
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Photo Upload (${images.length}/3)',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _pickeImageFromGallery();
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(child: Icon(Icons.add, size: 28)),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 100,

                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,

                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 8),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.file(File(images[index].path)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                // SUBMIT BUTTON
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.13,
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      formValidation();
                    },
                    child: Text(
                      "SUBMIT DPR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
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
