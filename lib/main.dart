import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Docs Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DocumentScreen(),
    );
  }
}

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Docs Clone', style: GoogleFonts.roboto()),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final content = _controller.document.toDelta();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Document saved', style: GoogleFonts.roboto()),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('en'),
              ),
              showFontFamily: true,
              fontFamilyValues: const {
                'Roboto': 'Roboto',
                'Open Sans': 'Open Sans',
                'Lato': 'Lato',
                'Montserrat': 'Montserrat',
                'Poppins': 'Poppins',
              },
              showFontSize: true,
              showBoldButton: true,
              showItalicButton: true,
              showUnderLineButton: true,
              showStrikeThrough: true,
              showInlineCode: true,
              showColorButton: true,
              showBackgroundColorButton: true,
              showClearFormat: true,
              showAlignmentButtons: true,
              showHeaderStyle: true,
              showListNumbers: true,
              showListBullets: true,
              showListCheck: true,
              showCodeBlock: true,
              showQuote: true,
              showIndent: true,
              showLink: true,
              multiRowsDisplay: true,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
} 