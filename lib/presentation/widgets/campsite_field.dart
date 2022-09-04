import 'package:flutter/material.dart';

class CampsiteField extends StatelessWidget {
  /// constructor
  const CampsiteField(this.iconAsset, this.value,
      {Key? key, this.textSize, this.iconSize})
      : super(key: key);

  /// icon Asset Name
  final IconData iconAsset;

  /// value
  final String value;

  final double? textSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) => Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconAsset,
            size: iconSize ?? 16,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: textSize, color: Colors.black54),
            ),
          ),
        ],
      );
}
