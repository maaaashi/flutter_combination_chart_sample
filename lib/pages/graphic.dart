import 'package:flutter/material.dart';
import 'package:flutter_combination_chart_sample/data.dart';
import 'package:flutter_combination_chart_sample/ui/layout.dart';
import 'package:graphic/graphic.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Graphic Example",
      body: SingleChildScrollView(child: _GraphView()),
    );
  }
}

class _GraphView extends StatelessWidget {
  const _GraphView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Chart(
        data: dummySalesData,
        variables: {
          'month': Variable(
            accessor: (SalesData data) => data.month,
            scale: TimeScale(formatter: (d) => "${d.month.toString()}月"),
          ),
          'sales': Variable(accessor: (SalesData data) => data.sales),
          'profitRate': Variable(accessor: (SalesData data) => data.profitRate),
        },
        marks: [
          IntervalMark(position: Varset("month") * Varset("sales")),
          LineMark(position: Varset("month") * Varset("profitRate")),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}
