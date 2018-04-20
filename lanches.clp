(clear)

(deftemplate lanche
	(slot tipo)
)

(deftemplate tradicional
	(slot bacon)
    (slot ovo)
    (slot frango)
    (slot salada)
)

(defrule vegetariano
	?resposta <- (lanche {
		tipo == 1 
	})
	=> (bind ?resposta.tipo vegetariano)
)

(defrule natural
	?resposta <- (lanche {
		tipo == 2 
	})
	=> (bind ?resposta.tipo natural)
)

(defrule semLactose
	?resposta <- (lanche {
		tipo == 3 
	})
	=> (bind ?resposta.tipo semLactose)
)

(defrule tradicional
	?resposta <- (lanche {
		tipo == 4 
	})
	=> (bind ?resposta.tipo tradicional)
)

(defrule theWalkingDead
	?resposta <- (lanche {tipo == tradicional})
    (())
)



(deffunction entrada()
	
	(printout t "Qual tipo de lanche de sua preferencia?" crlf)
    (printout t "1 - lanches vegetarianos" crlf)
    (printout t "2 - lanches naturais" crlf)
    (printout t "3 - lanches sem lactose" crlf)
    (printout t "4 - lanches tradicionais" crlf)
	(bind ?r1 (read))

	(assert (lanche (tipo ?r1) ))
)

(deffunction tradicional()
	
    (printout t "Você gostaria de Bacon no seu lanche?" crlf)
    (bind ?tr1 (read))
    (printout t "Você gostaria de salada no seu lanche?" crlf)
    (bind ?tr2 (read))
    (printout t "Você gostaria de ovo no seu lanche?" crlf)
    (bind ?tr3 (read))
    (printout t "Você gostaria de frango no seu lanche?" crlf)
	(bind ?tr4 (read))

    (assert (tradicional (bacon ?tr1) (salada ?tr2) (ovo ?tr3) (frango ?tr4)))

)

(iniciar)
(run)
