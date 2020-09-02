import 'package:flutter/material.dart';
import 'package:todo_lnl/src/widgets/styled_sized_box.dart';
import 'package:todo_lnl/src/widgets/styled_text_field.dart';

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Container(
        child: Column(
          children: [
            StyledSizedBox(),
            StyledTextField(
              label: "Task",
              errorMessage: "Task is required",
              onTextChanged: (String value) {},
            ),
            StyledSizedBox(),
            StyledTextField(
              label: "Notes",
              onTextChanged: (String value) {},
            ),
            StyledSizedBox(),
          ],
        ),
      ),
    );
  }
}
