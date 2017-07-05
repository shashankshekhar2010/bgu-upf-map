(define (domain maze)

(:requirements :typing :concurrency-network :multi-agent :factored-privacy :negative-preconditions)

(:types agent boat
		location door bridge switch)

(:predicates
	(at ?a - agent ?x - location)
	(at ?a - boat ?x - location)
	(has-switch ?s - switch ?x - location ?y - location ?z - location)
	(blocked ?x - location ?y - location)
	(has-door ?d - door ?x - location ?y - location)
	(has-boat ?b - boat ?x - location ?y - location)
	(has-bridge ?b - bridge ?x - location ?y - location)	
)

(:action cross 
	:agent ?a - agent
	:parameters (?b - bridge ?x - location ?y - location) 
	:precondition (and
					(at ?a ?x)
					(has-bridge ?b ?x ?y) 
			)
	:effect	(and 
					(at ?a ?y)
					(not (at ?a ?x))
					(not (has-bridge ?b ?x ?y))
					(has-bridge ?b ?y ?x)
			 )
)

(:concurrency-constraint v3
	:parameters (?b - bridge)
	:bounds (1 inf)
	:actions ( (cross 1) )
)

)

