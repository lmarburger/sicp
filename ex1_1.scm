; Support methods.
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))

  (define (average x y)
    (/ (+ x y) 2))

  (sqrt-iter 1.0))

; Exercise 1.1
10
12
8
3
6
a
b
19
#f
4
16
6
16

; Exercise 1.2
(/
  (+ 5 4
    (- 2
      (- 3
        (+ 6
           (/ 4 5)))))
  (* 3
    (- 6 2)
    (- 2 7)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

; Exercise 1.3
(define (sum-of-squares a b c)
  (define smallest
    (cond ((and (< a b) (< a c)) a)
          ((and (< b a) (< b c)) b)
          (else c)))
 
  (cond ((= smallest a) (+ (* b b) (* c c)))
        ((= smallest b) (+ (* a a) (* c c)))
        (else (+ (* a a) (* b b)))))

; Exercise 1.4
If `b` is greater than or equal to 0, add `a` to `b`; if `b` is less than 0, subtract it from a. The result is the sum of `a` and the absolute value of `b`.

; Exercise 1.5
In an applicative-order interpreter, it will return the value `0` as the expression `p` will never have to be evaluated. In an interpreter using normal-order evaluation, it will loop infinitely.

; Exercise 1.6
`if` must be a special form in order to defer evaluating the else clause until it is needed. Without it, the else clause is evaluated which will cause an infinite loop.

; Exercise 1.7
(define (good-enough? guess x last-guess)
  (< (abs (- guess last-guess)) 0.0000000000001))

(define (sqrt-iter guess x last-guess)
  (if (good-enough? guess x last-guess)
    guess
    (sqrt-iter (improve guess x)
               x guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x 10.0))

; Exercise 1.8
(define (cubert-iter guess x last-guess)
  (if (good-enough? guess x last-guess)
    guess
    (cubert-iter (improve-cube guess x)
                 x guess)))

(define (improve-cube guess x)
  (/
    (+
      (/ x (square guess))
      (* 2 guess))
    3))

(define (cubert x)
  (cubert-iter 1.0 x 10.0))
