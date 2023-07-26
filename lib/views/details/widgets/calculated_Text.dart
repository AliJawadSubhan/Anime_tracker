import 'package:flutter/material.dart';

calculatedWidget(num similarity) {
  similarity = similarity * 100;
  return Text(
    'Similarity: ${similarity ?? "N/A"}',
    style: TextStyle(fontSize: 18),
  );
}
