# Overview

**λfuck** is an esoteric programming language made by User:IAm DeLynn. It's based on the de Bruijn notation of untyped lambda calculus in brainfuck-like syntax.

## Syntax
Whitespace is ignored.

### Expressions

| Expession                        | De Bruijn  notation       | Description                                        |
|----------------------------------|---------------------------|----------------------------------------------------|
| `.`                              | `0`                       | Free variable                                      |
| '+' '++' '+++' ... '+' × (n + 1) | `1`, `2`, `3` ... `n + 1` | bound variable with index *n + 1*                  |
| `[M]`                            | `λ M`                     | Declare new functional expression (Abstraction)    |
| `M N`                            | `M N`                     | Apply argument *N* to a function *M* (Application) |
| `(M)`                            | `(M)`                     | Higher priority for an expression                  |

### Grammar

```
<expr> ::= <atom> | <atom> <atom>
<atom> ::= '.' | '+' { '+' } | '(' expr ')' | '[' expr ']'
```

## Examples
### Identity (I-combinator)
`[+]`

### K-combinator
`[[++]]`

### S-combinator
`[[[(+++)(+)((++)(+))]]]`

### Iota-combinator
`[+[[[(+++)(+)((++)(+))]]][[++]]]`
