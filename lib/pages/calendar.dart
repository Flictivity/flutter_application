import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1950,01,01),
      lastDate: DateTime(2050,01,01),
      onDateChanged: (DateTime value) {},
    );
  }
}
