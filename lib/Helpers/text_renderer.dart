// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class TextRenderer {
//   static Widget renderText(String text, TextStyle style, Function onHighlight) {
//     return SelectableText(
//       text,
//       cursorColor: style.color,
//       showCursor: true,
//       style: TextStyle(
//         fontSize: style.fontSize,
//         color: style.color,
//         height: style.height,
//         letterSpacing: style.letterSpacing,
//         fontWeight: style.fontWeight,
//       ),
//       onSelectionChanged: (selection, cause) {
//         if (cause == SelectionChangedCause.longPress) {
//
//         }
//       },
//       contextMenuBuilder: (context, editableTextState) {
//         return AdaptiveTextSelectionToolbar(
//           anchors: editableTextState.contextMenuAnchors,
//           children: [
//             TextButton(
//               onPressed: () {
//                 final selectedText =
//                 editableTextState.textEditingValue.text.substring(
//                   editableTextState.textEditingValue.selection.start,
//                   editableTextState.textEditingValue.selection.end,
//                 );
//                 Clipboard.setData(ClipboardData(text: selectedText));
//                 editableTextState.hideToolbar();
//               },
//               child: const Text('Copy'),
//             ),
//             TextButton(
//               onPressed: () {
//                 final start = editableTextState.textEditingValue.selection.start;
//                 final end = editableTextState.textEditingValue.selection.end;
//                 final selectedText = text.substring(start, end);
//
//                 onHighlight(start, end, selectedText);
//               },
//               child: const Text('Highlight'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }