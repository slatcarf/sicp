

(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
			  (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)) )

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 52) )

(define (max-total hand)
	(define (iter hand sum ace-count)
		(if (empty? hand)
				(se sum ace-count)
				(iter (bf hand)
							(+ sum (get-value (first hand)))
							(if (ace? (first hand)) (+ ace-count 1) ace-count)
				)
		)
	)
	(iter hand 0 0)
)

; 1.
(define (best-total hand)
	(define (iter sum ace-count)
		(if (= ace-count 0)
				sum
				(if (> sum 21)
						(iter (- sum 10) (- ace-count 1))
						sum
				)
		)
	)
	(let ((res (max-total hand)))
		(iter (first res) (first (bf res)))
	)
)

(define (get-value card)
	(cond ((member? (bl card) '(2 3 4 5 6 7 8 9 10)) (bl card))
				((member? (bl card) '(j k q J K Q)) 10)
				((ace? card) 11)
	)
)

(define (ace? card) 
	(equal? (first card) 'A)
)

; 2. 
(define (stop-at-17 hand dealers-hand)
	(< (best-total hand) 17)
)

; 4.
(define (dealer-sensitive hand dhand)
(let ((customer-total (best-total hand))
			(dcard (bl dhand)))
			(or (and (member? dcard '(7 8 9 10 J K Q A)) (< customer-total 17))
					(and (member? dcard '(2 3 4 5 6)) (< customer-total 12))))


)

; 3.
(define (play-n strategy n)
	(define (iter sum n)
		(if (= n 0)
			sum
			(iter (+ sum (twenty-one strategy)) (- n 1)))
	)
	(iter 0 n)
)




; (trace dealer-sensitive)

; (println 
; (play-n dealer-sensitive 100)
; )

; 5.
(define (stop-at n)
	(lambda (hand dealers-hand)
		(< (best-total hand) 17)))