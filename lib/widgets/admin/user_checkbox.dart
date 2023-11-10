import 'package:flutter/material.dart';

class AdminUserCheckbox extends StatefulWidget {
  const AdminUserCheckbox({
    super.key,
    required this.title,
    required this.value,
  });

  final Widget title;
  final bool value;

  @override
  State<AdminUserCheckbox> createState() => _AdminUserCheckboxState();
}

class _AdminUserCheckboxState extends State<AdminUserCheckbox> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
        });
      },
      title: widget.title,
    );
  }
}
