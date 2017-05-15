(define (domain maze)
(:requirements :typing :conditional-effects :multi-agent)
(:types agent location door bridge boat switch)
(:predicates
	(at ?a - agent ?x - location)
	(has-switch ?s - switch ?x - location ?y - location ?z - location)
	(blocked ?x - location ?y - location)
	(has-door ?d - door ?x - location ?y - location)
	(has-boat ?b - boat ?x - location ?y - location)
	(has-bridge ?b - bridge ?x - location ?y - location)
)
(:concurrent
	(move ?a - agent ?d - door ?x - location ?y - location)
	(row ?a - agent ?b - boat ?x - location ?y - location)
	(cross ?a - agent ?b - bridge ?x - location ?y - location)
	(pushswitch ?a - agent ?s - switch ?x - location ?y - location ?z - location)
)
(:action move
	:parameters (?a - agent ?d - door ?x - location ?y - location)
	:precondition (and
									(at ?a ?x)
									(not (blocked ?x ?y))
									(has-door ?d ?x ?y)

									(forall (?a2 - agent)
										(and
											(not (move ?a2 ?d ?x ?y))
											(not (move ?a2 ?d ?y ?x))
										)
									)
								)
	:effect	(and
						(at ?a ?y)
						(not (at ?a ?x))
					)
)
(:action row
	:parameters (?a - agent ?b - boat ?x - location ?y - location)
	:precondition (and
									(at ?a ?x)
									(has-boat ?b ?x ?y)
									(exists (?a2 - agent)
													(and
														(not (= ?a ?a2))
														(row ?a2 ?b ?x ?y)
													)
									)
									(forall (?a2 - agent)
													(not (row ?a2 ?b ?y ?x))
									)
			 					)
	:effect	(and
						(at ?a ?y)
						(not (at ?a ?x))
					)
)
(:action cross
	:parameters (?a - agent ?b - bridge ?x - location ?y - location)
	:precondition (and
									(at ?a ?x)
									(has-bridge ?b ?x ?y)
								)
	:effect	(and
						(at ?a ?y)
						(not (at ?a ?x))
						(not (has-bridge ?b ?x ?y))
						(not (has-bridge ?b ?y ?x))
			 		)
)
(:action pushswitch
	:parameters (?a - agent ?s - switch ?x - location ?y - location ?z - location)
	:precondition (and
									(at ?a ?x)
									(has-switch ?s ?x ?y ?z)

									(forall (?a2 - agent)
													(and
														(not (pushswitch ?a2 ?s ?x ?y ?z))
													)
									)
								)
	:effect	(and
						(not (blocked ?y ?z))
						(not (blocked ?z ?y))
					)
)
)
