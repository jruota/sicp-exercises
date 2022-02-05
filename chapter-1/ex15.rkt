#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; applicative-order evaluation
;     Loops forever, as the interpreter evaluates the arguments first and
;     the function call (p) results in p calling itself forever.

; normal-order evaluation
;     Results in 0, as the expression is expanded first and thus results in
;     (if (= 0 0) 0 (p)), where the predicate expression is true and the final
;     result 0.
