// import 'package:flutter/material.dart';
import 'package:gdlibrary_d_1407/invoice/model/custom_row_invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget itemColumn(List<CustomRow> elements) {
  final List<pw.TableRow> rows = [];
  final List<PdfColor> rowColors = [PdfColors.white, PdfColors.blue50];

  for (var i = 0; i < elements.length; i++) {
    final CustomRow element = elements[i];
    final PdfColor rowColor = rowColors[i % rowColors.length];

    rows.add(
      pw.TableRow(
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.all(5),
            color: rowColor,
            alignment: pw.Alignment.center,
            child: pw.Text(element.itemName),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(5),
            color: rowColor,
            alignment: pw.Alignment.center,
            child: pw.Text(element.itemPrice),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(5),
            color: rowColor,
            alignment: pw.Alignment.center,
            child: pw.Text(element.amount),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(5),
            color: rowColor,
            alignment: pw.Alignment.center,
            child: pw.Text(element.subTotalProduct),
          ),
        ],
      ),
    );
  }
  return pw.Table(children: rows);
}
