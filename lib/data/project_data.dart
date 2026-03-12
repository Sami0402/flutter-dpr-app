import 'package:dpr_app/models/project_model.dart';

class ProjectData {
  static List<ProjectModel> projects = [
    ProjectModel(
      id: 1,
      name: "Bridge Construction",
      status: "Active",
      startDate: DateTime.utc(2026, 03, 11),
    ),
    ProjectModel(
      id: 2,
      name: "Road Expansion",
      status: "Completed",
      startDate: DateTime.utc(2026, 03, 09),
    ),
    ProjectModel(
      id: 3,
      name: "Apartment Building",
      status: "Active",
      startDate: DateTime.utc(2026, 02, 20),
    ),
    ProjectModel(
      id: 4,
      name: "Mall Renovation",
      status: "In Progress",
      startDate: DateTime.utc(2026, 02, 10),
    ),
    ProjectModel(
      id: 5,
      name: "Highway Extension",
      status: "Completed",
      startDate: DateTime.utc(2026, 03, 07),
    ),
  ];

  static List<String> projectNames(List projects) {
    List<String> projectNames = [];
    for (int i = 0; i < projects.length; i++) {
      projectNames.add(projects[i].name);
    }
    return projectNames;
  }

  static List<String> wehather = ["Sunny", "Cloudy", "Rainy", "Windy"];
}
