import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSection extends StatelessWidget {
  const ImagePickerSection({
    super.key,
    required this.images,
    required this.onTap,
  });

  final List<XFile> images;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              onTap: onTap,
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
      ],
    );
  }
}
