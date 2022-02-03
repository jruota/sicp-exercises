#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0)
       +
       -)
   a b))

; If b is positive, add it to a.
; If b is negative or zero, subtract it from b.
; As the name of the function suggests, this results
; in the sum of a and the absolute value of b.

(a-plus-abs-b 3 3)
(a-plus-abs-b 3 -3)
(a-plus-abs-b 3 0)
