import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp_flutter_chart/chart/mp/chart/pie_chart.dart';
import 'package:mp_flutter_chart/chart/mp/core/animator.dart';
import 'package:mp_flutter_chart/chart/mp/core/data.dart';
import 'package:mp_flutter_chart/chart/mp/core/description.dart';
import 'package:mp_flutter_chart/chart/mp/core/format.dart';
import 'package:mp_flutter_chart/chart/mp/core/highlight.dart';
import 'package:mp_flutter_chart/chart/mp/core/legend.dart';
import 'package:mp_flutter_chart/chart/mp/listener.dart';
import 'package:mp_flutter_chart/chart/mp/painter/pie_chart_painter.dart';
import 'package:mp_flutter_chart/chart/mp/util.dart';

class PieChartHalfPie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PieChartHalfPieState();
  }
}

class PieChartHalfPieState extends State<PieChartHalfPie> {
  PieChart _pieChart;
  PieData _pieData;

  var random = Random(1);

  @override
  void initState() {
    _initPieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _initPieChart();
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Pie Chart Half Pie")),
        body: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: 0,
              child: _pieChart,
            )
          ],
        ));
  }

  final List<String> PARTIES = List()
    ..add("Party A")
    ..add("Party B")
    ..add("Party C")
    ..add("Party D")
    ..add("Party E")
    ..add("Party F")
    ..add("Party G")
    ..add("Party H")
    ..add("Party I")
    ..add("Party J")
    ..add("Party K")
    ..add("Party L")
    ..add("Party M")
    ..add("Party N")
    ..add("Party O")
    ..add("Party P")
    ..add("Party Q")
    ..add("Party R")
    ..add("Party S")
    ..add("Party T")
    ..add("Party U")
    ..add("Party V")
    ..add("Party W")
    ..add("Party X")
    ..add("Party Y")
    ..add("Party Z");

  PercentFormatter _formatter = PercentFormatter();

  void _initPieData() {
    var count = 4;
    var range = 100;

    List<PieEntry> values = List();

    for (int i = 0; i < count; i++) {
      values.add(new PieEntry(
          value: ((random.nextDouble() * range) + range / 5),
          label: PARTIES[i % PARTIES.length]));
    }

    PieDataSet dataSet = PieDataSet(values, "Election Results");
    dataSet.setSliceSpace(3);
    dataSet.setSelectionShift(5);

    dataSet.setColors1(ColorUtils.MATERIAL_COLORS);
    //dataSet.setSelectionShift(0f);

    _pieData = PieData(dataSet)
      ..setValueFormatter(new PercentFormatter())
//      ..setValueTextSize(11)
      ..setValueTextColor(ColorUtils.WHITE);
//    data.setValueTypeface(tfLight);
  }

  void _initPieChart() {
    var desc = Description();
    desc.setEnabled(false);
    _pieChart = PieChart(_pieData, (painter) {
      _formatter.setPieChartPainter(painter);

      painter
//      ..setCenterTextTypeface()
        ..setCenterText("half pie")
        ..setHoleColor(ColorUtils.WHITE)
        ..setTransparentCircleColor(ColorUtils.WHITE)
        ..setTransparentCircleAlpha(110)
        ..setHoleRadius(58)
        ..setTransparentCircleRadius(61)
        ..setCenterTextOffset(0, -20)
        ..setEntryLabelColor(ColorUtils.WHITE)
        ..setEntryLabelTextSize(12)
        ..setRotationAngle(180)
        ..setDrawCenterText(true);

      painter.mLegend
        ..setVerticalAlignment(LegendVerticalAlignment.TOP)
        ..setHorizontalAlignment(LegendHorizontalAlignment.CENTER)
        ..setOrientation(LegendOrientation.HORIZONTAL)
        ..setDrawInside(false)
        ..setXEntrySpace(7)
        ..setYEntrySpace(0)
        ..setYOffset(0);

      painter.mAnimator.animateY2(1400, Easing.EaseInOutQuad);
    },
        rotateEnabled: false,
        drawHole: true,
        usePercentValues: true,
        touchEnabled: true,
        highLightPerTapEnabled: true,
        dragDecelerationFrictionCoef: 0.95,
        maxAngle: 180,
        rotationAngle: 180,
        desc: desc);
  }
}