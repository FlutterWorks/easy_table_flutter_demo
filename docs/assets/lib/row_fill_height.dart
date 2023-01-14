import 'package:demoflu/demoflu.dart';
import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class RowFillHeightExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  EasyTableModel<Person>? _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19),
      Person('Carey', 39),
      Person('Cadu', 43)
    ];

    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTableTheme(
        data: EasyTableThemeData(
            row: RowThemeData(
                fillHeight: true, color: RowThemeData.zebraColor())),
        child: EasyTable<Person>(_model));
  }
}
