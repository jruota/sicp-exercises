#lang racket

; Number Number Number -> Number
; Return the sum of the squares
; of the two larger numbers.
(define (sum-of-squares a b c)
  (cond
    [(or (and (>= a b) (>= b c))
         (and (>= b a) (>= a c)))
     (+ (* a a) (* b b))]
    [(or (and (>= a c) (>= c b))
         (and (>= c a) (>= a b)))
     (+ (* a a) (* c c))]
    [(or (and (>= b c) (>= c a))
         (and (>= c b) (>= b a)))
     (+ (* b b) (* c c))]))

(sum-of-squares 3 2 1)
(sum-of-squares 3 1 2)
(sum-of-squares 2 3 1)
(sum-of-squares 2 1 3)
(sum-of-squares 1 2 3)
(sum-of-squares 1 3 2)

(sum-of-squares 4 4 4)
