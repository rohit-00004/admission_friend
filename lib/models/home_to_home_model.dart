class HometoHomeFields{
  static String branchcode = "branchcode";
  static String gopenh = "GOPENH"; 
  static String gsch = "GSCH"; 
  static String gsth = "GSTH"; 
  static String gvjh = "GVJH"; 
  static String gnt1h = "GNT1H"; 
  static String gnt2h = "GNT2H"; 
  static String gnt3h = "GNT3H"; 
  static String gobch = "GOBCH"; 
  static String mi = "MI"; 
  static String lopenh = "LOPENH"; 
  static String lsch = "LSCH"; 
  static String lsth = "LSTH"; 
  static String lvjh = "LVJH"; 
  static String lnt1h = "LNT1H";
  static String lnt2h = "LNT2H";
  static String lnt3h = "LNT3H";
  static String lobch = "LOBCH";
  static String pwdopenh = "PWDOPENH";
  static String defopenh = "DEFOPENH";
  static String tfws = "TFWS";
  static String pwdrobch = "PWDROBCH";
  static String defrobch = "DEFROBCH";
  static String defrvjh = "DEFRVJH";
  static String orphan = "ORPHAN";
  static String ews = "EWS";
}

class HometoHome{
  final String branchcode;
  final int gopenh,gsch,gsth,gvjh,gnt1h,gnt2h,gnt3h,gobch,mi,lopenh,lsch,lsth,lvjh,lnt1h,lnt2h,lnt3h,lobch,pwdopenh,defopenh,tfws,pwdrobch,defrobch,defrvjh,orphan,ews;

  HometoHome({
    required this.branchcode,
    required this.gopenh,
    required this.gsch,
    required this.gsth,
    required this.gvjh,
    required this.gnt1h,
    required this.gnt2h,
    required this.gnt3h,
    required this.gobch,
    required this.mi,
    required this.lopenh,
    required this.lsch,
    required this.lsth,
    required this.lvjh,
    required this.lnt1h,
    required this.lnt2h,
    required this.lnt3h,
    required this.lobch,
    required this.pwdopenh,
    required this.defopenh,
    required this.tfws,
    required this.pwdrobch,
    required this.defrobch,
    required this.defrvjh,
    required this.orphan,
    required this.ews
  });

  factory HometoHome.fromJson(Map<String, dynamic> json){
    return HometoHome(
      branchcode: json[HometoHomeFields.branchcode],
      gopenh: json[HometoHomeFields.gopenh],
      gsch: json[HometoHomeFields.gsch],
      gsth: json[HometoHomeFields.gsth],
      gvjh: json[HometoHomeFields.gvjh],
      gnt1h: json[HometoHomeFields.gnt1h],
      gnt2h: json[HometoHomeFields.gnt2h],
      gnt3h: json[HometoHomeFields.gnt3h],
      gobch: json[HometoHomeFields.gobch],
      mi: json[HometoHomeFields.mi],
      lopenh: json[HometoHomeFields.lopenh],
      lsch: json[HometoHomeFields.lsch],
      lsth: json[HometoHomeFields.lsth],
      lvjh: json[HometoHomeFields.lvjh],
      lnt1h: json[HometoHomeFields.lnt1h],
      lnt2h: json[HometoHomeFields.lnt2h],
      lnt3h: json[HometoHomeFields.lnt3h],
      lobch: json[HometoHomeFields.lobch],
      pwdopenh: json[HometoHomeFields.pwdopenh],
      defopenh: json[HometoHomeFields.defopenh],
      tfws: json[HometoHomeFields.tfws],
      pwdrobch: json[HometoHomeFields.pwdrobch],
      defrobch: json[HometoHomeFields.defrobch],
      defrvjh: json[HometoHomeFields.defrvjh],
      orphan: json[HometoHomeFields.orphan],
      ews: json[HometoHomeFields.ews],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      HometoHomeFields.branchcode: branchcode,
      HometoHomeFields.gopenh: gopenh,
      HometoHomeFields.gsch: gsch,
      HometoHomeFields.gsth: gsth,
      HometoHomeFields.gvjh: gvjh,
      HometoHomeFields.gnt1h: gnt1h,
      HometoHomeFields.gnt2h: gnt2h,
      HometoHomeFields.gnt3h: gnt3h,
      HometoHomeFields.gobch: gobch,
      HometoHomeFields.mi: mi,
      HometoHomeFields.lopenh: lopenh,
      HometoHomeFields.lsch: lsch,
      HometoHomeFields.lsth: lsth,
      HometoHomeFields.lvjh: lvjh,
      HometoHomeFields.lnt1h: lnt1h,
      HometoHomeFields.lnt2h: lnt2h,
      HometoHomeFields.lnt3h: lnt3h,
      HometoHomeFields.lobch: lobch,
      HometoHomeFields.pwdopenh: pwdopenh,
      HometoHomeFields.defopenh: defopenh,
      HometoHomeFields.tfws: tfws,
      HometoHomeFields.pwdrobch: pwdrobch,
      HometoHomeFields.defrobch: defrobch,
      HometoHomeFields.defrvjh: defrvjh,
      HometoHomeFields.orphan: orphan,
      HometoHomeFields.ews: ews,
    };
  }

}