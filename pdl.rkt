#lang peg

(provide (all-defined-out));
(provide parser);
(struct seq (a b) #:transparent);
(struct non-deterministic-choice (a b) #:transparent);
(struct repetition (a) #:transparent);
(struct atomic (a) #:transparent);

(define (parser str)
  (peg top str));


_ < [ \t\n]*;
EOI < ! . ;
top <- _ v:pdl _ EOI -> v; 
pdl <- _ v:(non-deterministic) _ -> v;
non-deterministic <- v1:(seq) _ v2:((~'U' _ seq _)*) -> (foldl (lambda (a b) (non-deterministic-choice b a)) v1 v2) ;
seq <- v1:(repetition) _ v2:((~[;] _ repetition)*) -> (foldl (lambda (a b) (seq b a)) v1 v2) ;
repetition <- v:(base) _ a:('*'?) _ -> (if (not (null? a)) (repetition v) v);
base <- _ ~'(' _ v2:(pdl) _ ~')' _ / _ v1:(atomic) _ -> (or v1 v2);
atomic <- v:[a-zA-Z] -> (atomic v);


test <- v:('a'?) -> v;