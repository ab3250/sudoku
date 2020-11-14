;;;;

(include "../library/sudoku-library.scm")

(define (solve)
  (let ((next-zero (position-9x9 0 (array->list (array-contents grid)))))
    (if (not(eqv? next-zero #f))
	(let ((row (car next-zero))(col (cdr next-zero)))
          (for 1 9 (lambda(num)
                     (if (possible? row col num)
			 (begin
                           (array-set! grid num row col)
                           (if (not(solve)) (print-grid))
                           (array-set! grid 0 row col))))))
	#f)))
(print-grid)
(solve)


