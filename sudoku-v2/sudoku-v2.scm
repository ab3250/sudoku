;;;;
;;racket uncomment following
#|
#lang r7rs
(import (scheme base)
        (scheme write)        
        (scheme private list)
        (scheme process-context))
|#

(include "../library/sudoku-library.scm")

(define (solve)
  (define zero (position 0 (flatten (array->list grid))))
  (if (not(not zero))
      (let ((row (car zero))(col (cdr zero)))
        (for 1 9 (lambda(num)                            
                   (if (possible? row col num)
                       (begin
                         (array-set! grid num row col)                       
                         (if (not(solve)) (begin (print-grid)(exit)))
                         (array-set! grid 0 row col))))))#f))
(print-grid)
(solve)


