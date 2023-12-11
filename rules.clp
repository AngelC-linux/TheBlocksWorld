;Encontrar D en la mesa y sin un bloque encima
;(deftemplate brazo-robot "definicion del brazo mecanico"
;(slot holding))

(defrule MAIN::listo
    (cubo A en mesa)
    (cubo B en mesa)
    (cubo C en mesa)
    (cubo D en mesa)
    ?s <- (brazo-robot holding empty)
    =>
    (retract ?s)
    (printout t "El brazo está despejado y los cubos A,B,C,D están en la mesa." crlf))

(defrule MAIN::tomar-C
    ?c <- (cubo C en mesa)
    =>
    (retract ?c)
    (assert (brazo-robot holding C))
    (printout t "El brazo toma el cubo C." crlf))

(defrule MAIN::mover-C
    (brazo-robot holding C)
    =>
    (assert (brazo-robot onMove 1))
    (printout t "Brazo en movimiento." crlf))

(defrule MAIN::dejar-C
    ?s <- (brazo-robot holding C)
    (brazo-robot onMove 1)
    =>
    (retract ?s)
    (assert (cubo C en D))
    (assert (brazo-robot holding empty))
    (printout t "El brazo deja el cubo C sobre D." crlf))

(defrule MAIN::mover
    ?s <- (brazo-robot holding empty)
    =>
    (assert (brazo-robot onMove 0))
    (retract ?s)
    (printout t "El brazo se mueve a su posición original." crlf))

;(defrule MAIN::detect-B
 ;   (cubo B en mesa)
;    ?s <- (brazo-robot holding empty)
 ;   =>
 ;   (retract ?s)
 ;   (printout t "El brazo detecta B." crlf))

(defrule MAIN::tomar-B
    ?b <- (cubo B en mesa)
    =>
    (retract ?b)
    (assert (brazo-robot holding B))
    (printout t "El brazo toma el cubo B." crlf))

(defrule MAIN::mover-B
    (brazo-robot holding B)
    ?s <- (brazo-robot onMove 0)
    =>
    (retract ?s)
    (assert (brazo-robot onMove 1))
    (printout t "Brazo en movimiento." crlf))

(defrule MAIN::dejar-B
    ?b <- (brazo-robot holding B)
    (brazo-robot onMove 1)
    =>
    (retract ?b)
    (assert (cubo B en C))
    (assert (brazo-robot holding empty))
    (printout t "El brazo deja el cubo B sobre C." crlf))

(defrule MAIN::mover-again
    ?s <- (brazo-robot holding empty)
    =>
    (assert (brazo-robot onMove 0))
    (retract ?s)
    (printout t "El brazo se mueve a su posición original." crlf))

(defrule MAIN::tomar-A
    ?a <- (cubo A en mesa)
    =>
    (retract ?a)
    (assert (brazo-robot holding A))
    (printout t "El brazo toma el cubo A." crlf))

(defrule MAIN::mover-A
    (brazo-robot holding A)
    ?s <- (brazo-robot onMove 0)
    =>
    (retract ?s)
    (assert (brazo-robot onMove 1))
    (printout t "Brazo en movimiento." crlf))

(defrule MAIN::dejar-A
    ?a <- (brazo-robot holding A)
    (brazo-robot onMove 1)
    =>
    (retract ?a)
    (assert (cubo A en B))
    (assert (brazo-robot holding empty))
    (printout t "El brazo deja el cubo A sobre B." crlf))

(defrule MAIN::final
    (cubo A en B)
    (cubo B en C)
    (cubo C en D)
    ?s <- (brazo-robot onMove 1)
    =>
    (retract ?s)
    (printout t "Los cubos están debidamente formados A en B, B en C y C en D." crlf))
