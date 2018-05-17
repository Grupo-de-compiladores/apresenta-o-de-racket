#lang racket

(provide clean idt assign )

(struct loc (adress) #:transparent)

(define (clean envi mem)
	(for/hash ([i (filter loc? (hash-values envi))]) (values i (hash-ref mem i))    ))

(define (idt envi mem id)
	(if (not (hash-has-key? envi id)) (raise "variavel não declarada\n")
		(if (not (loc? (hash-ref envi id))) (hash-ref envi id)
			(hash-ref mem (hash-ref envi id)))))


(define (assign envi memory id value)
	(hash-set memory (hash-ref envi id) value))
	



