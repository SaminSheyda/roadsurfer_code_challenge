import 'package:flutter/material.dart';

class CampsiteField extends StatelessWidget {
  /// constructor
  const CampsiteField(this.iconAsset, this.value,{Key? key}):super(key: key);

  /// icon Asset Name
  final IconData iconAsset;

  /// value
  final String value;

  @override
  Widget build(BuildContext context) => Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconAsset,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            value,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
}
