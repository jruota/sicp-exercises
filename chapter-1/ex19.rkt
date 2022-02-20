#lang racket

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (++ a b)
  (if (= a 0)
      b
      (++ (dec a) (inc b))))

(define (inc x)
  (add1 x))

(define (dec x)
  (sub1 x))

; ~~~~~~~~~~~~~~~~~~~~~~~~~

; THIS IS RECURSIVE

; (+ 4 5)
; (if (= 4 0) 5 (inc (+ (dec 4) 5)))
; (if #false 5 (inc (+ (dec 4) 5)))
; (inc (+ (dec 4) 5))
; (inc (+ (sub1 4) 5))
; (inc (+ 3 5))
; (inc 8)
; (add1 8)
; 9

; ALTERNATIVELY, assuming inc and dec are primitives
; (+ 4 5)
; (if (= 4 0) 5 (inc (+ (dec 4) 5)))
; (if #false 5 (inc (+ (dec 4) 5)))
; (inc (+ (dec 4) 5))
; (inc (+ 3 5))
; (inc 8)
; 9

; ~~~~~~~~~~~~~~~~~~~~~~~~~

; THIS IS ITERATIVE

; (++ 4 5)
; (if (= 4 0) 5 (++ (dec 4) (inc 5)))
; (if #false 5 (++ (dec 4) (inc 5)))
; (++ (dec 4) (inc 5))
; (++ (sub1 4) (add1 5))
; (++ 3 6)
; (if (= 3 0) 6 (++ (dec 3) (inc 6)))
; (if #false 6 (++ (dec 3) (inc 6)))
; (++ (dec 3) (inc 6))
; (++ (sub1 3) (add1 6))
; (++ 2 7)
; (if (= 2 0) 7 (++ (dec 2) (inc 7)))
; (if #false 7 (++ (dec 2) (inc 7)))
; (++ (dec 2) (inc 7))
; (++ (sub1 2) (add1 7))
; (++ 1 8)
; (if (= 1 0) 8 (++ (dec 1) (inc 8)))
; (if #false 8 (++ (dec 1) (inc 8)))
; (++ (dec 1) (inc 8))
; (++ (sub1 1) (add1 8))
; (++ 0 9)
; (if (= 0 0) 9 (++ (dec 0) (inc 9)))
; (if #true 9 (++ (dec 0) (inc 9)))
; 9

; ALTERNATIVELY, assuming inc and dec are primitives
; (++ 4 5)
; (if (= 4 0) 5 (++ (dec 4) (inc 5)))
; (if #false 5 (++ (dec 4) (inc 5)))
; (++ (dec 4) (inc 5))
; (++ 3 6)
; (if (= 3 0) 6 (++ (dec 3) (inc 6)))
; (if #false 6 (++ (dec 3) (inc 6)))
; (++ (dec 3) (inc 6))
; (++ 2 7)
; (if (= 2 0) 7 (++ (dec 2) (inc 7)))
; (if #false 7 (++ (dec 2) (inc 7)))
; (++ (dec 2) (inc 7))
; (++ 1 8)
; (if (= 1 0) 8 (++ (dec 1) (inc 8)))
; (if #false 8 (++ (dec 1) (inc 8)))
; (++ (dec 1) (inc 8))
; (++ 0 9)
; (if (= 0 0) 9 (++ (dec 0) (inc 9)))
; (if #true 9 (++ (dec 0) (inc 9)))
; 9
