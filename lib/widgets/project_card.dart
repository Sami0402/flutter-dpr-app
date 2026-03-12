import 'package:dpr_app/models/project_model.dart';
import 'package:dpr_app/screens/dpr_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.name,
    required this.status,
    required this.startDate, required this.project,
  });
  // final int id;
  final String name;
  final String status;
  final DateTime startDate;
  final ProjectModel project;

  Color getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.grey.shade300;

      case 'In Progress':
        return Colors.green.shade200;

      case 'Active':
        return Colors.blue.shade200;

      default:
        return Colors.blueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat('dd MMM yyyy').format(startDate);
    return Card(
      color: Colors.white,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 22.0,
          bottom: 22.0,
          left: 24.0,
          right: 12.0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAME
                Text(
                  name,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // STATUS
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    // color: Colors.green[100],
                    color: getStatusColor(status),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // START DATE
                Text.rich(
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                  TextSpan(
                    text: 'Start Date: ',
                    children: [
                      TextSpan(
                        text: formattedDate,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            // ARROW
            IconButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DprFormScreen(project: project))
                );
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
