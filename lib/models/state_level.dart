class StateLevelFields {
  static String branchcode = "branchcode";
  static String gopens = "GOPENS";
  static String gscs = "GSCS";
  static String gsts = "GSTS";
  static String gvjs = "GVJS";
  static String gnt1s = "GNT1S";
  static String gnt2s = "GNT2S";
  static String gnt3s = "GNT3S";
  static String gobcs = "GOBCS";
  static String mi = "MI";
  static String lopens = "LOPENS";
  static String lscs = "LSCS";
  static String lsts = "LSTS";
  static String lvjs = "LVJS";
  static String lnt1s = "LNT1S";
  static String lnt2s = "LNT2S";
  static String lnt3s = "LNT3S";
  static String lobcs = "LOBCS";
  static String pwdopens = "PWDOPENS";
  static String defopens = "DEFOPENS";
  static String tfws = "TFWS";
  static String pwdrobcs = "PWDROBCS";
  static String defrobcs = "DEFROBCS";
  static String orphan = "ORPHAN";
  static String defrvjs = "DEFRVJS";
  static String ews = "EWS";
}

class StateLevel {
  final String branchcode;
  final int gopens;
  final int gscs,
      gsts,
      gvjs,
      gnt1s,
      gnt2s,
      gnt3s,
      gobcs,
      mi,
      lopens,
      lscs,
      lsts,
      lvjs,
      lnt1s,
      lnt2s,
      lnt3s,
      lobcs,
      pwdopens,
      defopens,
      tfws,
      pwdrobcs,
      defrobcs,
      orphan,
      defrvjs,
      ews;

  StateLevel(
      {required this.branchcode,
      required this.gopens,
      required this.gscs,
      required this.gsts,
      required this.gvjs,
      required this.gnt1s,
      required this.gnt2s,
      required this.gnt3s,
      required this.gobcs,
      required this.mi,
      required this.lopens,
      required this.lscs,
      required this.lsts,
      required this.lvjs,
      required this.lnt1s,
      required this.lnt2s,
      required this.lnt3s,
      required this.lobcs,
      required this.pwdopens,
      required this.defopens,
      required this.tfws,
      required this.pwdrobcs,
      required this.defrobcs,
      required this.orphan,
      required this.defrvjs,
      required this.ews});

  factory StateLevel.fromJson(Map<String, dynamic> json) {
    return StateLevel(
      branchcode: json[StateLevelFields.branchcode] as String,
      gopens: json[StateLevelFields.gopens],
      gscs: json[StateLevelFields.gscs],
      gsts: json[StateLevelFields.gsts],
      gvjs: json[StateLevelFields.gvjs],
      gnt1s: json[StateLevelFields.gnt1s],
      gnt2s: json[StateLevelFields.gnt2s],
      gnt3s: json[StateLevelFields.gnt3s],
      gobcs: json[StateLevelFields.gobcs],
      mi: json[StateLevelFields.mi],
      lopens: json[StateLevelFields.lopens],
      lscs: json[StateLevelFields.lscs],
      lsts: json[StateLevelFields.lsts],
      lvjs: json[StateLevelFields.lvjs],
      lnt1s: json[StateLevelFields.lnt1s],
      lnt2s: json[StateLevelFields.lnt2s],
      lnt3s: json[StateLevelFields.lnt3s],
      lobcs: json[StateLevelFields.lobcs],
      pwdopens: json[StateLevelFields.pwdopens],
      defopens: json[StateLevelFields.defopens],
      tfws: json[StateLevelFields.tfws],
      pwdrobcs: json[StateLevelFields.pwdrobcs],
      defrobcs: json[StateLevelFields.defrobcs],
      orphan: json[StateLevelFields.orphan],
      defrvjs: json[StateLevelFields.defrvjs],
      ews: json[StateLevelFields.ews],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      StateLevelFields.branchcode: branchcode,
      StateLevelFields.gopens: gopens,
      StateLevelFields.gscs: gscs,
      StateLevelFields.gsts: gsts,
      StateLevelFields.gvjs: gvjs,
      StateLevelFields.gnt1s: gnt1s,
      StateLevelFields.gnt2s: gnt2s,
      StateLevelFields.gnt3s: gnt3s,
      StateLevelFields.gobcs: gobcs,
      StateLevelFields.mi: mi,
      StateLevelFields.lopens: lopens,
      StateLevelFields.lscs: lscs,
      StateLevelFields.lsts: lsts,
      StateLevelFields.lvjs: lvjs,
      StateLevelFields.lnt1s: lnt1s,
      StateLevelFields.lnt2s: lnt2s,
      StateLevelFields.lnt3s: lnt3s,
      StateLevelFields.lobcs: lobcs,
      StateLevelFields.pwdopens: pwdopens,
      StateLevelFields.defopens: defopens,
      StateLevelFields.tfws: tfws,
      StateLevelFields.pwdrobcs: pwdrobcs,
      StateLevelFields.defrobcs: defrobcs,
      StateLevelFields.orphan: orphan,
      StateLevelFields.defrvjs: defrvjs,
      StateLevelFields.ews: ews,
    };
  }
}
