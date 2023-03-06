import 'package:admission_friend/models/state_level.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  Database? _db;

  DatabaseHelper() {
    // _initdb();
  }

  Future<Database?> database() async {
    print("getting");
    if (_db == null) {
      _db = await _initdb();
      return _db;
      // print('init again');
    }
    print("wo init");
    return _db;
  }

  Future<Database> _initdb() async {
    // Open the database
    return await openDatabase(join(await getDatabasesPath(), 'mhtcet.db'),
        version: 1, onCreate: _onCreate
        );
  }

  _onCreate(Database db, version) async {
    await db.execute(
      '''
          CREATE TABLE state_level(
          branchcode VARCHAR(10) PRIMARY KEY, 
          GOPENS INT,
          GSCS INT,
          GSTS INT,
          GVJS INT,
          GNT1S INT,
          GNT2S INT,
          GNT3S INT,
          GOBCS INT,
          MI INT,
          LOPENS INT,
          LSCS INT,
          LSTS INT,
          LVJS INT,
          LNT1S INT,
          LNT2S INT,
          LNT3 INT,
          LOBCS INT,
          PWDOPENS INT,
          DEFOPENS INT,
          TFWS INT,
          PWDROBCS INT,
          DEFROBCS INT,
          ORPHAN INT,
          DEFRVJS INT,
          EWS INT);
        '''
    );

    await db.execute(
      '''
        CREATE TABLE colleges(
          code int,
          college text,
          city text,
          primary key(code)
        );
      '''
    );
  }

  Future<List<List<dynamic>>> importCSVtoDB(String path) async {
    var myData = await rootBundle.loadString(path);
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);

    return csvTable;
  }

  Future<void> insertTxn() async {
    List<List<dynamic>> csvTable = await importCSVtoDB("assets/cutoff.csv");
    final db = await database();

    try {
      await db!.transaction((txn) async {
        for (var row in csvTable) {
          await txn.insert(
            'state_level',
            {
              'branchcode': row[0] == "" ? 0 : row[0],
              'GOPENS': row[1] == "" ? 0 : row[1],
              'GSCS': row[2] == "" ? 0 : row[2],
              'GSTS': row[3] == "" ? 0 : row[3],
              'GVJS': row[4] == "" ? 0 : row[4],
              'GNT1S': row[5] == "" ? 0 : row[5],
              'GNT2S': row[6] == "" ? 0 : row[6],
              'GNT3S': row[7] == "" ? 0 : row[7],
              'GOBCS': row[8] == "" ? 0 : row[8],
              'MI': row[9] == "" ? 0 : row[9],
              'LOPENS': row[10] == "" ? 0 : row[10],
              'LSCS': row[11] == "" ? 0 : row[11],
              'LSTS': row[12] == "" ? 0 : row[12],
              'LVJS': row[13] == "" ? 0 : row[13],
              'LNT1S': row[14] == "" ? 0 : row[14],
              'LNT2S': row[15] == "" ? 0 : row[15],
              'LNT3': row[16] == "" ? 0 : row[16],
              'LOBCS': row[17] == "" ? 0 : row[17],
              'PWDOPENS': row[18] == "" ? 0 : row[18],
              'DEFOPENS': row[19] == "" ? 0 : row[19],
              'TFWS': row[20] == "" ? 0 : row[20],
              'PWDROBCS': row[21] == "" ? 0 : row[21],
              'DEFROBCS': row[22] == "" ? 0 : row[22],
              'ORPHAN': row[23] == "" ? 0 : row[23],
              'DEFRVJS': row[24] == "" ? 0 : row[24],
              'EWS': row[25] == "" ? 0 : row[25],
            },
          );
        }
      });
    } catch (e) {
      // print(e.toString());
    }
  }

  Future<void> insertcolleges() async {
    List<List<dynamic>> csvTable = await importCSVtoDB("assets/colleges.csv");
    final db = await database();

    try{
      await db!.transaction((txn) async {
        for (var row in csvTable) {
          await txn.insert(
            'colleges',
            {
              'code': row[0],
              'college': row[1],
              'city': row[2]
            },
          );
        }
      });
    }
    catch(e){
      // print(e.toString());
    }
  }

  Future<List<StateLevel>> readstatelevel(
      int rank, List<String> selections) async {
    final db = await database();

    String category = selections[1];
    category = category.toUpperCase();

    String query = "";
    if (category != "EWS" && category != 'TFWS') {
      if (category != "LNT3") {
        category += 'S';
      }
      if (selections[0] == 'Male') {
        query += 'G';
      } else {
        query += 'L';
      }
      query += category;
    } else {
      query = category;
    }

    print("query: $query");
    if (db != null) {
      List<Map<String, Object?>> lists = [];

      if (rank - 50 > 0) {
        lists = await db.rawQuery('''
          SELECT * from state_level 
          WHERE $query > ? 
          ORDER BY $query
          LIMIT 10
          ''', [rank - 50]);
      } else {
        lists = await db.rawQuery('''
          SELECT * from state_level 
          WHERE $query > ? AND $query > ?
          ORDER BY $query
          LIMIT 10
          ''', [rank, 0]);
      }

      List<StateLevel> ret = [];
      for (var e in lists) {
        ret.add(StateLevel.fromJson(e));
        // print(StateLevel.fromJson(e).toJson());
      }
      return ret;
    }

    return [];
  }

  Future<String> getCollegeName(String code) async{
    final db = await database();

    if(db != null){
      List<Map<String, Object?>> lists = [];

      lists = await db.rawQuery(
        '''
        select college, city 
        from colleges
        where code = $code
        '''
      );

      return "${lists[0]['college'].toString()},${lists[0]['city'].toString()}";
    }
    return "";
  }

  static String getBranchName(String branchcode) {
    String code = branchcode.substring(4, 7);

    switch (code) {
      case "245":
        return "Computer Engineering";

      case "246":
        return "Information Technology";

      case "372":
        return "Electronics and Telecommunication Engineering";

      case "293":
        return "Electrical Engineering";

      case "612":
        return "Mechanical Engineering";

      case "191":
        return "Civil Engineering";

      case "242":
        return "Computer Science and Engineering";

      case "376":
        return "Electronics Engineering";

      case "507":
        return "Chemical Engineering";

      case "606":
        return "Production Engineering";

      case "602":
        return "Automobile Engineering";

      case "464":
        return "Instrumentation and Control Engineering";

      case "503":
        return "Food Technology";

      case "259":
        return "Mechanical and Mechatronics Engineering (Additive Manufacturing)";

      case "627":
        return "Manufacturing Science and Engineering";

      case "694":
        return "Metallurgy and Material Technology";

      case "911":
        return "Computer Science and Engineering(Artificial Intelligence and Machine Learning)";

      case "912":
        return "Computer Science and Engineering(Data Science)";
      
      case "263":
        return "Artificial Intelligence (AI) and Data Science";

      case "534":
        return "Food Engineering and Technology";
      
      case "513":
        return "Pharmaceuticals Chemistry and Technology";
      
      case "921":
        return "Artificial Intelligence and Machine Learning";
      default:
        break;
    }

    return "Branch";
  }
}
