#lang scheme

(define Y
  (lambda (f)
     ( (lambda (x) 
         (f (lambda () (x x)))) 
       (lambda (x) 
         (f (lambda () (x x)))) )))

(define A
  (lambda (x)
    (lambda (y)
      (lambda ()
        (y ((x x) y))))))

(define T
  (A A))

;; ((T F) 5) = (((A A) F) 5) = ((((lambda (y) (lambda () (y ((A A) y)))) F)) 5) =
;; = ((lambda () (F ((A A) F))) 5)

(define F
  (lambda (f)
    (lambda (n)
      (if (= n 0)
          1
          (* n ((f) (- n 1)))))))

(((T F)) 5)

(define factorial
  (lambda (n)
    (if (= n 0)
        1
        (* n (factorial (- n 1))))))

(define rsum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (rsum (cdr lst))))))

(define R
  (lambda (r)
    (lambda (lst)
      (if (null? lst)
          0
          (+ (car lst) ((r) (cdr lst)))))))