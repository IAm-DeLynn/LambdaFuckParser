
interface Term {
}

final class Var implements Term {
  int index;
  
  Var(int _index) {
    index = _index;
  }
  
  String toString() {
    return "VAR(" + index + ")";
  }
}

final class Abstr implements Term {
  Term body;
  
  Abstr(Term _body) {
    body = _body;
  }
  
  String toString() {
    return "ABSTR(" + body + ")";
  }
}

final class Appl implements Term {
  Term term1, term2;
  
  Appl(Term _term1, Term _term2) {
    term1 = _term1;
    term2 = _term2;
  }
  
  String toString() {
    return "APPL(" + term1 + ", " + term2 + ")";
  }
}
