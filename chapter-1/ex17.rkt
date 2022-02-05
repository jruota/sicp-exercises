#lang racket

; new version ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess (improve guess x))
      guess
      (new-sqrt-iter (improve guess x) x)))

(define (new-good-enough? old new)
  (< (abs (- old new)) 0.001))

; version from the book ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
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

; The issue with very small numbers is because of the hard-coded tolerance
; of 0.001 and the fact that the result of the product of numbers less than one
; is less than any of the numbers in the product.
; A number, that is much larger than the actual answer could therefore be
; returned as an answer, as its square is much smaller and satisfies the
; condition in good-enough?.
(sqrt 0.000001)        ; should be 0.001
(new-sqrt 0.000001)    ; improves the result somewhat

; For large numbers, the function might loop forever.
; The problem arises when the guess is close to the actual solution but not
; within the tolerance and improve returns the average of two equal
; (or very closely neighbouring) numbers, resulting in an infinite loop.
;(sqrt 1000000000000000000000.0)     ; should be 3.16227766e+10


(sqrt 110000200001641013247)
(new-sqrt 110000200001641013247)     ; does not improve result
;(sqrt 110000200001641013248)        ; loops forever
(new-sqrt 110000200001641013248)     ; does not loop forever


; NOTE: 1000000000000000000000.0 = 1e+21
; [1]  (improve 1.0 1e+21) -> 5e+20
; [2]  (improve 5e+20 1e+21) -> 2.5e+20
; [3]  (improve 2.5e+20 1e+21) -> 1.25e+20
; [4]  (improve 1.25e+20 1e+21) -> 6.25e+19
; [5]  (improve 6.25e+19 1e+21) -> 3.125e+19
; [6]  (improve 3.125e+19 1e+21) -> 1.5625e+19
; [7]  (improve 1.5625e+19 1e+21) -> 7.8125e+18
; [8]  (improve 7.8125e+18 1e+21) -> 3.90625e+18
; [9]  (improve 3.90625e+18 1e+21) -> 1.953125e+18
; [10] (improve 1.953125e+18 1e+21) -> 976562500000000300.0
; [11] (improve 976562500000000300.0 1e+21) -> 488281250000000640.0
; [12] (improve 488281250000000640.0 1e+21) -> 244140625000001340.0
; [13] (improve 244140625000001340.0 1e+21) -> 122070312500002720.0
; [14] (improve 122070312500002720.0 1e+21) -> 61035156250005460.0
; [15] (improve 61035156250005460.0 1e+21)  -> 30517578125010920.0
; [16] (improve 30517578125010920.0 1e+21)  -> 15258789062521844.0
; [17] (improve 15258789062521844.0 1e+21)  -> 7629394531293690.0
; [18] (improve 7629394531293690.0 1e+21)   -> 3814697265712381.0
; [19] (improve 3814697265712381.0 1e+21)   -> 1907348632987262.5
; [21] (improve 1907348632987262.5 1e+21)   -> 953674316755775.3
; [22] (improve 953674316755775.3 1e+21)    -> 476837158902175.6
; [23] (improve 476837158902175.6 1e+21)    -> 238418580499663.8
; [24] (improve 238418580499663.8 1e+21)    -> 119209292346983.89
; [25] (improve 119209292346983.89 1e+21)   -> 59604650367795.84
; [26] (improve 59604650367795.84 1e+21)    -> 29802333572505.137
; [27] (improve 29802333572505.137 1e+21)   -> 14901183563462.271
; [28] (improve 14901183563462.271 1e+21)   -> 7450625336112.764
; [29] (improve 7450625336112.764 1e+21)    -> 3725379776517.4097
; [30] (improve 3725379776517.4097 1e+21)   -> 1862824102762.9956
; [31] (improve 1862824102762.9956 1e+21)   -> 931680461050.0533
; [32] (improve 931680461050.0533 1e+21)    -> 466376895208.79224 
; [33] (improve 466376895208.79224 1e+21)   -> 234260541880.79922
; [34] (improve 234260541880.79922 1e+21)   -> 119264646605.99684
; [35] (improve 119264646605.99684 1e+21)   -> 63824680503.80246
; [36] (improve 63824680503.80246 1e+21)    -> 39746300344.66208
; [37] (improve 39746300344.66208 1e+21)    -> 32452937364.201084
; [38] (improve 32452937364.201084 1e+21)   -> 31633394544.89012
; [39] (improve 31633394544.89012 1e+21)    -> 31622778383.672726
; [40] (improve 31622778383.672726 1e+21)   -> 31622776601.683846
; [41] (improve 31622776601.683846 1e+21)   -> 31622776601.683792
; [42] (improve 31622776601.683792 1e+21)   -> 31622776601.683792

;(square 31622776601.683793)
(square 31622776601.683792)
;(square 31622776601.683791)
;(square 31622776601.683790)

(- 1e+21 (square 31622776601.683792))
(/ 1e+21 31622776601.683792)
(/ (+ 31622776601.683792 (/ 1e+21 31622776601.683792)) 2)
