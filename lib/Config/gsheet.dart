import 'package:gsheets/gsheets.dart';

//? https://youtu.be/ZSSERiYLv3c?feature=shared

class UserSheetsApi {
  static const credentials =
   r'''
    (your credentials )
''';

  static const spreadsheetId = '(your spreadsheetId)';

  static Worksheet? _userSheet;
  static final _gsheets = GSheets(credentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(spreadsheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Sheet1");
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(int id ,Map<String, dynamic> rowList) async {
    // _userSheet!.values.map.appendRows(rowList);
    _userSheet!.values.map.insertRow(id+1, rowList);
  }
}

class SheetsColumn {
  static final String table_id = "table id";
  static final String room_type = "room type";
  static final String status = "status";
  static final String customer_name = "customer name";

  static List<String> getColumns() => [table_id, room_type, status,customer_name];
}
