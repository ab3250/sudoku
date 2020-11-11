;;;;
;racket uncomment the following
#|
#lang r7rs
(import (scheme base)
        (scheme write)        
        (scheme private list)
        (scheme process-context))
|#

(include "../library/sudoku-library.scm")

(define (solve)
    (let row-loop ((row 0))
      (if (not (eqv? 9 row))
          (begin	  
            (let col-loop ((col 0))
              (if (not (eqv? 9 col))
                  (begin
                    (if (eqv?(array-ref grid row col) 0)
                        (let num-loop ((num 1))
                          (if (not (eqv? 10 num))
                              (begin
                                (if (possible? row col num)
                                    (begin
                                      (array-set! grid num row col)
				      (print-grid)
                                      (solve)
                                      (if (and (not(member 0 (flatten (array->list grid))))) (begin (print-grid)(exit)));hack
                                      (array-set! grid 0 row col)))
                                (num-loop (+ 1 num)))
                          ))#f)
                    (col-loop (+ col 1)))#f))
            (row-loop (+ row 1)))#f))#f)
(print-grid)
(solve)
