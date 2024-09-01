import 'package:expansion_tile/Widgets/expansion_tile_widget.dart';
import 'package:expansion_tile/Widgets/upward_expansion_tile_widget.dart';
import 'package:flutter/material.dart';

class ExpansionsWidgets extends StatefulWidget {
  const ExpansionsWidgets({super.key});

  @override
  State<ExpansionsWidgets> createState() => _ExpansionsWidgetsState();
}

class _ExpansionsWidgetsState extends State<ExpansionsWidgets> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(title: const Text('Expansion Widgets Examples')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: Colors.white),
                padding: const EdgeInsets.all(18),
                child: ExpansionTileWidget(
                  isExpanded: true,
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Downward Expansion Widget ',
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                      const Spacer(),
                      RotatedBox(
                          quarterTurns: _isExpanded ? 2 : 0,
                          child: const Icon(Icons.keyboard_arrow_down_rounded))
                    ],
                  ),
                  children: const [
                    Row(
                      children: [
                        Text(
                          'child 1',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      'child 2',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      'child 3',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const UpwardExpansionTileWidget(
                  title: [
                    Text(
                      'Upward Expansion Widget ',
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                  ],
                  expandedChild: Column(
                    children: [
                      Text(
                        'child 1',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'child 2',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'child 3',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
