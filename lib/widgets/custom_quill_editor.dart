import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:google_fonts/google_fonts.dart';

class CustomQuillEditor extends StatelessWidget {
  final QuillController controller;

  const CustomQuillEditor({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      configurations: QuillEditorConfigurations(
        controller: controller,
        sharedConfigurations: const QuillSharedConfigurations(
          locale: Locale('en'),
        ),
        padding: const EdgeInsets.all(8),
        autoFocus: false,
        placeholder: 'Type your document here...',
        scrollable: true,
        expands: false,
        enableSelectionToolbar: true,
        customStyles: DefaultStyles(
          paragraph: DefaultTextBlockStyle(
            GoogleFonts.getFont(
              'Roboto',
              fontSize: 16,
            ),
            const HorizontalSpacing(0, 0),
            const VerticalSpacing(0, 0),
            const VerticalSpacing(0, 0),
            const BoxDecoration(),
          ),
          bold: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.bold,
          ),
          italic: GoogleFonts.getFont(
            'Roboto',
            fontStyle: FontStyle.italic,
          ),
          h1: DefaultTextBlockStyle(
            GoogleFonts.getFont(
              'Roboto',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            const HorizontalSpacing(0, 0),
            const VerticalSpacing(16, 0),
            const VerticalSpacing(0, 0),
            const BoxDecoration(),
          ),
          h2: DefaultTextBlockStyle(
            GoogleFonts.getFont(
              'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const HorizontalSpacing(0, 0),
            const VerticalSpacing(8, 0),
            const VerticalSpacing(0, 0),
            const BoxDecoration(),
          ),
          h3: DefaultTextBlockStyle(
            GoogleFonts.getFont(
              'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const HorizontalSpacing(0, 0),
            const VerticalSpacing(8, 0),
            const VerticalSpacing(0, 0),
            const BoxDecoration(),
          ),
        ),
      ),
    );
  }
} 