import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/strings.dart';

class SelectionSortWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                SELECTION_SORT,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer<SelectionSort>(
                builder: (context, state, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _buildArrayWidgets(
                    Theme.of(context).accentColor,
                    state.array,
                    state.prev,
                    state.curr,
                    state.next,
                    state.sorted,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Best O(n^2) Worst O(n^2) time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  List<Widget> _buildArrayWidgets(Color main, List<double> array, int prev, int curr, int next, int sorted) => array
      .map(
        (e) => Expanded(
          child: Container(
            height: e,
            margin: const EdgeInsets.all(1.3),
            color: _indexColor(main, array.indexOf(e), prev, curr, next, sorted),
          ),
        ),
      )
      .toList();

  Color _indexColor(Color main, int index, int prev, int curr, int next, int sorted) => index == prev
      ? Colors.orange
      : (index == curr
          ? Colors.red
          : (index == next ? Colors.yellow : (index <= sorted ? Colors.purpleAccent[700] : main)));
}
