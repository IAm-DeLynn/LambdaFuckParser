
class Parser {
  private String s;
  
  Parser(String _s) {
    s = _s;
  }
  
  void next() {
    if(s.length() > 0) {
      s = s.substring(1);
    }
  }
  
  Character consume() {
    if(s.length() > 0) {
      char output = current();
      next();
      return output;
    }
    else return null;
  }
  
  Character current() {
    if(s.length() > 0) return s.charAt(0);
    else return null;
  }
  
  void expect(char c) {
    if(current() == c) consume();
    else throw new IllegalArgumentException("Parsing Failed: Invalid Character '" + current() + "', expected '" + c + "'");
  }
  
  Term parse() {
    if(Character.isWhitespace(current())) consume();
    switch(current()) {
      case '.':
      case '+':
      case '(':
      case '[':
      Term func = parseAtom();
      
      while(s.length() > 0) {
        Term arg = parseAtom();
        if(arg != null) func = new Appl(func, arg);
        else break;
      }
      return func;
      
      default:
      System.err.println("Parsing Failed: Invalid Character '" + current() + "', expected '+' (Main)");
      return null;
    }
  }
  
  private Var parseVar() {
    
    switch(current()) {
      case '+':
      int depth = -1;
      
      while(s.length() > 0 && current() == '+') {
        consume();
        depth++;
      }
      return new Var(depth);
      
      default:
      System.err.println("Parsing Failed: Invalid Character '" + current() + "', expected '+' (Var)");
      return null;
    }
  }
  
  private Term parseAtom() {
    Term output;
    
    switch(current()) {
      case '.':
      consume();
      return new Var(-1);
      
      case '+':
      return parseVar();
      
      case '(':
      consume();
      output = parse();
      expect(')');
      
      return output;
      
      case '[':
      consume();
      output = new Abstr(parse());
      expect(']');
      
      return output;
      
      default:
      System.err.println("Parsing Failed: Invalid Character '" + current() + "', expected '+', '(', '[' (Atom)");
      return null;
    }
  }
}

Term parse(String s) {
  return new Parser(s).parse();
}
