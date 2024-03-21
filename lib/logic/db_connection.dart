import 'package:karteikarto/logic/variables.dart';
import 'package:mysql_client/mysql_client.dart';

Future getVocabs() async {
  lectionLat = [];
  lectionDe = [];
  lectionExp = [];
  lectionExpPPP = [];
  final dbConnection = await MySQLConnection.createConnection(
      host: dbHost,
      port: dbPort,
      userName: dbUsername,
      password: dbPassword,
      databaseName: dbName);
  await dbConnection.connect();
  var result = await dbConnection
      .execute("SELECT * FROM ${lections[selectedLektionIndex]}");
  for (final row in result.rows) {
    Map map = row.assoc();
    map.forEach((key, value) {
      switch (key.toString()) {
        case 'lat':
          lectionLat.add(value);
          break;
        case 'exp':
          lectionExp.add(value);
          break;
        case 'exp_ppp':
          lectionExpPPP.add(value);
          break;
        case 'de':
          lectionDe.add(value);
          break;
      }
    });
  }

  await dbConnection.close();
}

Future getLektions() async {
  if (selectedBook != null) {
    lections = [];
    listViewTitles = [];
    final dbConnection = await MySQLConnection.createConnection(
        host: dbHost,
        port: dbPort,
        userName: dbUsername,
        password: dbPassword,
        databaseName: dbName);
    await dbConnection.connect();
    var resultData = await dbConnection.execute(
        "SELECT * FROM `${listViewTables[int.parse('$selectedBook')]}`");
    for (final row in resultData.rows) {
      Map listViewMap = row.assoc();
      listViewMap.forEach((key, value) {
        switch (key.toString()) {
          case 'ListViewText':
            listViewTitles.add(value);
            break;
          case 'db_table':
            lections.add(value.toString());
            break;
        }
      });
    }
  }
}

Future getBasics() async {
  lections = [];
  listViewTitles = [];
  listViewTables = [];
  bookNames = [];
  getLektions();
  final dbConnection = await MySQLConnection.createConnection(
      host: dbHost,
      port: dbPort,
      userName: dbUsername,
      password: dbPassword,
      databaseName: dbName);
  await dbConnection.connect();
  var resultData = await dbConnection.execute("SELECT * FROM `books`");
  for (final row in resultData.rows) {
    Map listViewMap = row.assoc();
    listViewMap.forEach((key, value) {
      switch (key.toString()) {
        case 'listview_table':
          listViewTables.add(value.toString());
          break;
        case 'book_name':
          bookNames.add(value.toString());
          break;
      }
    });
  }
  var result = await dbConnection.execute("SELECT * FROM `general_settings`");
  for (final row in result.rows) {
    Map map = row.assoc();
    map.forEach((key, value) {
      switch (key.toString()) {
        case 'setting name':
          settingName.add(value);
          break;
        case 'wert':
          settingValue.add(value);
          break;
      }
    });
  }
  title = settingValue[settingName.indexOf('title')];
  lVersion = settingValue[settingName.indexOf('version')];
  credits = settingValue[settingName.indexOf('credits')];
}
