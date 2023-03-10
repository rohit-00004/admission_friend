enum SeatType{state, home, other, hometohome}

class CutoffFields{
  SeatType seat;
  CutoffFields({required this.seat}){
    gopen = seat == SeatType.state ? 'GOPENS' : seat == SeatType.other ? 'GOPENO' : 'GOPENH';
    gsc = seat == SeatType.state ? 'GSCS' : seat == SeatType.other ? 'GSCO' : 'GSCH';
    gst = seat == SeatType.state ? 'GSTS' : seat == SeatType.other ? 'GSTO' : 'GSTH';
    gvj = seat == SeatType.state ? 'GVJS' : seat == SeatType.other ? 'GVJO' : 'GVJH';
    gnt1 = seat == SeatType.state ? 'GNT1S' : seat == SeatType.other ? 'GNT1O' : 'GNT1H';
    gnt2 = seat == SeatType.state ? 'GNT2S' : seat == SeatType.other ? 'GNT2O' : 'GNT2H';
    gnt3 = seat == SeatType.state ? 'GNT3S' : seat == SeatType.other ? 'GNT3O' : 'GNT3H';
    gobc = seat == SeatType.state ? 'GOBCS' : seat == SeatType.other ? 'GOBCO' : 'GOBCH';
    mi = 'MI';
    lopen = seat == SeatType.state ? 'LOPENS' : seat == SeatType.other ? 'LOPENO' : 'LOPENH';
    lsc = seat == SeatType.state ? 'LSCS' : seat == SeatType.other ? 'LSCO' : 'LSCH';
    lst = seat == SeatType.state ? 'LSTS' : seat == SeatType.other ? 'LSTO' : 'LSTH';
    lvj = seat == SeatType.state ? 'LVJS' : seat == SeatType.other ? 'LVJO' : 'LVJH';
    lnt1 = seat == SeatType.state ? 'LNT1S' : seat == SeatType.other ? 'LNT1O' : 'LNT1H';
    lnt2 = seat == SeatType.state ? 'LNT2S' : seat == SeatType.other ? 'LNT2O' : 'LNT2H';
    lnt3 = seat == SeatType.state ? 'LNT3S' : seat == SeatType.other ? 'LNT3O' : 'LNT3H';
    lobc = seat == SeatType.state ? 'LOBCS' : seat == SeatType.other ? 'LOBCO' : 'LOBCH';
    pwdopen = seat == SeatType.state ? 'PWDOPENS' : seat == SeatType.other ? 'PWDOPENO' : 'PWDOPENH';
    defopen = seat == SeatType.state ? 'DEFOPENS' : seat == SeatType.other ? 'DEFOPENO' : 'DEFOPENH';
    tfws = 'TFWS';
    pwdrobc = seat == SeatType.state ? 'PWDROBCS' : seat == SeatType.other ? 'PWDROBCO' : 'PWDROBCH';
    defrobc = seat == SeatType.state ? 'DEFROBCS' : seat == SeatType.other ? 'DEFROBCO' : 'DEFROBCH';
    defrvj = seat == SeatType.state ? 'DEFRVJS' : seat == SeatType.other ? 'DEFRVJO' : 'DEFRVJH';
    orphan = 'ORPHAN';
    ews = 'EWS';
  }

  String branchcode = "branchcode";
  String? gopen, gsc, gst, gvj, gnt1, gnt2, gnt3, gobc, mi, lopen, lsc, lst, lvj, lnt1, lnt2, lnt3, lobc, pwdopen, defopen, tfws, pwdrobc, defrobc, defrvj, orphan, ews; 
}

class Cutoff{
  // SeatType seat;

  Cutoff({required this.seat});
  SeatType seat = SeatType.home;

  // Cutoff fromJson(Map<String, dynamic> json){
  //   // return Cutoff(seat: seat);
  // }

}