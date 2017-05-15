(define (domain tablemover)
(:requirements :typing :conditional-effects :multi-agent)
(:types agent block table - locatable
				side1 - side
				locatable room)
(:constants Table1 - table)
(:predicates
	(on-table ?b - block ?t - table)
	(on-floor ?b - block)
	(down ?s - side)
	(up ?s - side)
	(clear ?s - side)
	(at-side ?a - agent ?s - side)
	(lifting ?a - agent ?s - side)
	(inroom ?l - locatable ?r - room)
	(available ?a - agent)
	(handempty ?a - agent)
	(holding ?a - agent ?b - block)
	(connected ?r1 ?r2 - room)
)
(:concurrent
	(pickup-floor ?a - agent ?b - block ?r - room)
	(putdown-floor ?a - agent ?b - block ?r - room)
	(pickup-table ?a - agent ?b - block ?r - room ?t - table)
	(putdown-table-1 ?a - agent ?b - block ?r - room)
	(to-table-1 ?a - agent ?r - room ?s - side1)
	(leave-table ?a - agent ?s - side)
	(move-table-1 ?a - agent ?r1 ?r2 - room ?s - side1)
	(lift-side-1 ?a - agent ?s - side1)
	(lower-side-1 ?a - agent ?s - side1)
)
(:action pickup-floor
	:parameters (?a - agent ?b - block ?r - room)
	:precondition (and
									(on-floor ?b)
									(inroom ?a ?r)
									(inroom ?b ?r)
									(available ?a)
									(handempty ?a)
									(forall (?a2 - agent) (not (pickup-floor ?a2 ?b ?r)))
				  			)
	:effect	(and
						(not (on-floor ?b))
						(not (inroom ?b ?r))
						(not (handempty ?a))
						(holding ?a ?b)
					)
)
(:action putdown-floor
	:parameters (?a - agent ?b - block ?r - room)
	:precondition (and
									(available ?a)
									(inroom ?a ?r)
									(holding ?a ?b)
				  			)
	:effect	(and
						(on-floor ?b)
						(inroom ?b ?r)
						(handempty ?a)
						(not (holding ?a ?b))
					)
)
(:action pickup-table
	:parameters (?a - agent ?b - block ?r - room ?t - table)
	:precondition (and
									(on-table ?b ?t)
									(inroom ?a ?r)
									(inroom ?t ?r)
									(available ?a)
									(handempty ?a)
									(forall (?a2 - agent) (not (pickup-table ?a2 ?b ?r ?t)))
				  			)
	:effect	(and
						(not (on-table ?b ?t))
						(not (handempty ?a))
						(holding ?a ?b)
				 )
)

(:action putdown-table-1
	:parameters (?a - agent ?b - block ?r - room)
	:precondition (and
									(inroom ?a ?r)
									(inroom Table1 ?r)
									(available ?a)
									(holding ?a ?b)
									; Check table not lifted
									(forall (?s - side1)
										(down ?s)
									)
									; Check table not intended to be lifted!
									(forall (?a2 - agent ?s - side1) (not (lift-side-1 ?a2 ?s)))
				  	)
				  	
	:effect (and
						(on-table ?b Table1)
						(handempty ?a)
						(not (holding ?a ?b))
			)
)

(:action to-table-1
	:parameters (?a - agent ?r - room ?s - side1)
	:precondition (and
									(clear ?s)
									(inroom ?a ?r)
									(inroom Table1 ?r)
									(available ?a)
									(forall (?a2 - agent) (not (to-table-1 ?a2 ?r ?s)))
				  			)
	:effect	(and
						(not (clear ?s))
						(at-side ?a ?s)
						(not (available ?a))
				 )
)

(:action leave-table
	:parameters (?a - agent ?s - side)
	:precondition (and
									(at-side ?a ?s)
									(not (lifting ?a ?s))
				  			)
	:effect	(and
						(clear ?s)
						(not (at-side ?a ?s))
						(available ?a)
				 )
)

;(:action move-agent
;	:parameters (?a - agent ?r1 ?r2 - room)
;	:precondition (and
;					(inroom ?a ?r1)
;					(connected ?r1 ?r2)
;				  )
;	:effect	(and
;					(not (inroom ?a ?r1))
;					(inroom ?a ?r2)
;					(forall (?b - block)
;						(when (holding ?a ?b)
;						      (and (not (inroom ?b ?r1)) (inroom ?b ?r2))
;						)
;					)
;				 )
;)

(:action move-table-1
	:parameters (?a - agent ?r1 ?r2 - room ?s - side1)
	:precondition (and
									(lifting ?a ?s)
									(inroom ?a ?r1)
									(connected ?r1 ?r2)
									(exists (?a2 - agent ?s2 - side1)
													(and
														(not (= ?s ?s2))
														(move-table-1 ?a2 ?r1 ?r2 ?s2)
													)
									)
				  			)
	:effect	(and
						(not (inroom ?a ?r1))
						(not (inroom Table1 ?r1))
						(inroom ?a ?r2)
						(inroom Table1 ?r2)
				 )
)

(:action lift-side-1
	:parameters (?a - agent ?s - side1)
	:precondition (and
									(down ?s)
									(at-side ?a ?s)
									(handempty ?a)
									(forall (?a2 - agent ?s2 - side1)
													(not (lower-side-1 ?a2 ?s2))
									)
				  			)
	:effect	(and
						(not (down ?s))
						(up ?s)
						(lifting ?a ?s)
						(not (handempty ?a))
						(forall (?b - block ?r - room ?s2 - side1)
										(when (and
														(inroom Table1 ?r)
														(on-table ?b Table1)
														(down ?s2)
														(forall (?a2 - agent)
																		(not (lift-side-1 ?a2 ?s2))
														)
													)
													(and
														(on-floor ?b)
														(inroom ?b ?r)
														(not (on-table ?b Table1))
													)
										)
						)
				 )
)

(:action lower-side-1
	:parameters (?a - agent ?s - side1)
	:precondition (and
									(lifting ?a ?s)
									(forall (?a2 - agent ?s2 - side1)
													(not (lift-side-1 ?a2 ?s2))
									)
				  			)
	:effect	(and
						(down ?s)
						(not (up ?s))
						(not (lifting ?a ?s))
						(handempty ?a)
						(forall (?b - block ?r - room ?s2 - side)
										(when (and
														(inroom Table1 ?r)
														(on-table ?b Table1)
														(up ?s2)
														(forall (?a2 - agent)
																		(not (lower-side-1 ?a2 ?s2))
														)
													)
													(and
														(on-floor ?b)
														(inroom ?b ?r)
														(not (on-table ?b Table1))
													)
										)
						)
				 )
)
)
