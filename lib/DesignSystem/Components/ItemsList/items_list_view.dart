import 'package:flutter/material.dart';

class ItemsListView<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;

  const ItemsListView({
    super.key,
    required this.label,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFFF2264B),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: itemBuilder(context, item),
              );
            },
          ),
        ),
      ],
    );
  }
}
