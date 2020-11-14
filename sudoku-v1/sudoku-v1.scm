;;;;

(include "../library/sudoku-library.scm")

(define (solve)
  (let/ec return
    (for 0 8 (lambda(row)
	       (for 0 8 (lambda(col)
			  (if (eqv?(array-ref grid row col) 0)
                              (for 1 9 (lambda(num)
					 (if (possible? row col num)
					     (begin
					       (array-set! grid num row col)
					       (solve)
					       (unless(position-9x9 0 (array->list (array-contents grid)))(print-grid))
					       (array-set! grid 0 row col)))
					 (when (eqv? num 9)
					   (return)))))))))))
(print-grid)
(solve)
(newline)
(display "finished")
(newline)
