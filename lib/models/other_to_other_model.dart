import 'package:admission_friend/models/cutoff.dart';

class OthertoOtherFields{
  static String branchcode = "branchcode";
  static String gopeno = "GOPENO";
  static String gsco = "GSCO";
  static String gsto = "GSTO";
  static String gvjo = "GVJO";
  static String gnt1o = "GNT1O";
  static String gnt2o = "GNT2O";
  static String gnt3o = "GNT3O";
  static String gobco = "GOBCO";
  static String mi = "MI";
  static String lopeno = "LOPENO";
  static String lsco = "LSCO";
  static String lsto = "LSTO";
  static String lvjo = "LVJO";
  static String lnt1o = "LNT1O";
  static String lnt2o = "LNT2O";
  static String lnt3o = "LNT3O";
  static String lobco = "LOBCO";
  static String pwdopeno = "PWDOPENO";
  static String defopeno = "DEFOPENO";
  static String tfws = "TFWS";
  static String pwdrobco = "PWDROBCO";
  static String defrobco = "DEFROBCO";
  static String defrvjo = "DEFRVJO";
  static String orphan = "ORPHAN";
  static String ews = "EWS";
}

class OthertoOther{
  final String branchcode;
  final int gopeno, gsco, gsto, gvjo, gnt1o, gnt2o, gnt3o, gobco, mi, lopeno, lsco, lsto, lvjo, lnt1o, lnt2o, lnt3o, lobco, pwdopeno, defopeno, tfws, pwdrobco, defrobco, defrvjo, orphan, ews;


  OthertoOther({
    required this.branchcode,
    required this.gopeno,
    required this.gsco,
    required this.gsto,
    required this.gvjo,
    required this.gnt1o,
    required this.gnt2o,
    required this.gnt3o,
    required this.gobco,
    required this.mi,
    required this.lopeno,
    required this.lsco,
    required this.lsto,
    required this.lvjo,
    required this.lnt1o,
    required this.lnt2o,
    required this.lnt3o,
    required this.lobco,
    required this.pwdopeno,
    required this.defopeno,
    required this.tfws,
    required this.pwdrobco,
    required this.defrobco,
    required this.defrvjo,
    required this.orphan,
    required this.ews,
  });


  factory OthertoOther.fromJson(Map<String, dynamic> json){

    return OthertoOther(
      branchcode: json['branchcode'], 
      gopeno: json[OthertoOtherFields.gopeno],
      gsco: json[OthertoOtherFields.gsco],
      gsto: json[OthertoOtherFields.gsto],
      gvjo: json[OthertoOtherFields.gvjo],
      gnt1o: json[OthertoOtherFields.gnt1o],
      gnt2o: json[OthertoOtherFields.gnt2o],
      gnt3o: json[OthertoOtherFields.gnt3o],
      gobco: json[OthertoOtherFields.gobco],
      mi: json[OthertoOtherFields.mi],
      lopeno: json[OthertoOtherFields.lopeno],
      lsco: json[OthertoOtherFields.lsco],
      lsto: json[OthertoOtherFields.lsto],
      lvjo: json[OthertoOtherFields.lvjo],
      lnt1o: json[OthertoOtherFields.lnt1o],
      lnt2o: json[OthertoOtherFields.lnt2o],
      lnt3o: json[OthertoOtherFields.lnt3o],
      lobco: json[OthertoOtherFields.lobco],
      pwdopeno: json[OthertoOtherFields.pwdopeno],
      defopeno: json[OthertoOtherFields.defopeno],
      tfws: json[OthertoOtherFields.tfws],
      pwdrobco: json[OthertoOtherFields.pwdrobco],
      defrobco: json[OthertoOtherFields.defrobco],
      defrvjo: json[OthertoOtherFields.defrvjo],
      orphan: json[OthertoOtherFields.orphan],
      ews: json[OthertoOtherFields.ews],

    );
  }

  Map<String, dynamic> toJson(){
    return {
      OthertoOtherFields.branchcode: branchcode,
      OthertoOtherFields.gopeno: gopeno,
      OthertoOtherFields.gsco: gsco,
      OthertoOtherFields.gsto: gsto,
      OthertoOtherFields.gvjo: gvjo,
      OthertoOtherFields.gnt1o: gnt1o,
      OthertoOtherFields.gnt2o: gnt2o,
      OthertoOtherFields.gnt3o: gnt3o,
      OthertoOtherFields.gobco: gobco,
      OthertoOtherFields.mi: mi,
      OthertoOtherFields.lopeno: lopeno,
      OthertoOtherFields.lsco: lsco,
      OthertoOtherFields.lsto: lsto,
      OthertoOtherFields.lvjo: lvjo,
      OthertoOtherFields.lnt1o: lnt1o,
      OthertoOtherFields.lnt2o: lnt2o,
      OthertoOtherFields.lnt3o: lnt3o,
      OthertoOtherFields.lobco: lobco,
      OthertoOtherFields.pwdopeno: pwdopeno,
      OthertoOtherFields.defopeno: defopeno,
      OthertoOtherFields.tfws: tfws,
      OthertoOtherFields.pwdrobco: pwdrobco,
      OthertoOtherFields.defrobco: defrobco,
      OthertoOtherFields.defrvjo: defrvjo,
      OthertoOtherFields.orphan: orphan,
      OthertoOtherFields.ews: ews,
    };
  }
}