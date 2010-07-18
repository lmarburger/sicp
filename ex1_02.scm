; Exercise 1.9

; Recursive
; (+ 4 5)
;   (inc (+ 3 5))
;   (inc (inc (+ 2 5)))
;   (inc (inc (inc (+ 1 5))))
;   (inc (inc (inc (inc (+ 0 5)))))
;   (inc (inc (inc (inc 5))))
;   (inc (inc (inc 6)))
;   (inc (inc 7))
;   (inc 8)
;   9
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; Iterative
; (+ 4 5)
;   (+ 3 6)
;   (+ 2 7)
;   (+ 1 8)
;   (+ 0 9)
;   9
(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))


; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
; (A 0 (A 0 (A 0 (A 0 64))))
; (A 0 (A 0 (A 0 128)))
; (A 0 (A 0 256))
; (A 0 512)
; 1024

(A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 1 2))))
; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 16)
; (A 0 (A 1 15))
; (A 0 (A 0 (A 1 14)))
; (A 0 (A 0 (A 0 (A 1 13))))
; (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
; (A 0 (A 0 (A 0 (A 0 4096))))
; (A 0 (A 0 (A 0 8192)))
; (A 0 (A 0 16384))
; (A 0 32768)
; 65536

(A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)
; 65536

; 2n
(define (f n) (A 0 n))

; 2^n
(define (g n) (A 1 n))

; 2^2^n
(define (h n) (A 2 n))

; 5n^2
(define (k n) (* 5 n n))


; Exercise 1.11
; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

(f 5)
; (+ (f 4) (* 2 (f 3)) (* 3 (f 2)))
; (+ (f 4) (* 2 (f 3)) (* 3 2))
; (+ (f 4) (* 2 (f 3)) 6)
; (+ (f 4) (* 2 (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))) 6)
; (+ (f 4) (* 2 (+ (f 2) (* 2 (f 1)) (* 3 0))) 6)
; (+ (f 4) (* 2 (+ (f 2) (* 2 (f 1)) 0)) 6)
; (+ (f 4) (* 2 (+ (f 2) (* 2 1) 0)) 6)
; (+ (f 4) (* 2 (+ (f 2) 2 0)) 6)
; (+ (f 4) (* 2 (+ 2 2 0)) 6)
; (+ (f 4) (* 2 4) 6)
; (+ (f 4) 8 6)
; (+ (+ (f 3) (* 2 (f 2)) (* 3 (f 1))) 8 6)
; (+ (+ (f 3) (* 2 (f 2)) (* 3 1)) 8 6)
; (+ (+ (f 3) (* 2 (f 2)) 3) 8 6)
; (+ (+ (f 3) (* 2 2) 3) 8 6)
; (+ (+ (f 3) 4 3) 8 6)
; (+ (+ 4 4 3) 8 6)
; (+ 11 8 6)
; 25

; Iterative variant of f
(define (f n)
  (if (< n 3)
    n
    (f-iter 2 1 0 (- n 2))))

(define (f-iter a b c count)
  (if (< count 1)
    a
    (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))


; Exercise 1.12
(define (pascals-triangle row col)
  (cond ((or (< col 0) (< row 0)) 0)
        ((or (= col 0) (= col row)) 1)
        (else (+ (pascals-triangle (- row 1) col)
                 (pascals-triangle (- row 1) (- col 1))))))


; Exercise 1.13
(define (pow n ex)
  (define (pow-iter n a count)
    (if (= count 1)
      n
      (pow-iter (* n a) a (-1+ count))))

  (pow-iter n n ex))

(define (fib-test n)
  (/
    (pow
      (/
        (+ 1 (sqrt 5))
        2)
      n)
    (sqrt 5)))


; Exercise 1.14
; Exercise 1.15
; Exercise 1.16
; Exercise 1.17
; Exercise 1.18
; Exercise 1.19
; Exercise 1.20
; Exercise 1.21
; Exercise 1.22
; Exercise 1.23
; Exercise 1.24
; Exercise 1.25
; Exercise 1.26
; Exercise 1.27
; Exercise 1.28
