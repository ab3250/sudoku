;;;;

(include "../library/sudoku-library.scm")

(define (solve)
  (define zero (position-9x9 0 (array->list (array-contents grid))))
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


