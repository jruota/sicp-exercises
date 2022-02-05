#lang racket

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (new-if predicate then-clause else-clause)
  (cond
    [predicate then-clause]
    [else else-clause]))

(sqrt 4)

; The interpreter uses applicative-order evaluation, so it first evaluates the
; arguments and then applies procedures. So when sqrt-iter calls new-if, the
; arguments are evaluated first resulting in sqrt-iter calling itself with the
; exact same arguments again. The program loops forever.
