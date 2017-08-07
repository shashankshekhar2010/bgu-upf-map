(define (domain maze)
(:requirements :typing :concurrency-network :multi-agent)
(:types agent location door boat switch bridge)
(:predicates
	(at ?a - agent ?x - location)
	(has-switch ?s - switch ?x - location ?y - location ?z - location)
	(blocked ?x - location ?y - location)
	(has-door ?d - door ?x - location ?y - location)
	(has-boat ?b - boat ?x - location ?y - location)
	(has-bridge ?b - bridge ?x - location ?y - location)
	(:private
		(tired-agent-pr ?agent - agent )
	)
)

(:action move 
	:agent ?a - agent
	:parameters (?d - door ?x - location ?y - location)
	:precondition (and
					(at ?a ?x)
					(not (blocked ?x ?y))
					(has-door ?d ?x ?y) 
				  )
	:effect	(and 
					(at ?a ?y)
					(not (at ?a ?x))
				 )
)

(:action clean-build-activity 
	:agent ?a - agent
	:parameters (?a1 - agent ?x - location ?b - bridge ?y - location) 
	:precondition (and
					(at ?a ?x)
					(has-bridge ?b ?x ?y) 
			)
	:effect	(and 
					(at ?a ?y)
					(not (at ?a ?x))
					(has-bridge ?b ?x ?y)
					;(not (has-bridge ?b ?y ?x))
			 )
)

(:action build
	:agent ?a - agent
	:parameters (?b - bridge ?x - location ?y - location)  
	:precondition (and
					(at ?a ?x)
					(has-bridge ?b ?x ?y) 
			)
	:effect	(and 
					(at ?a ?y)
					(not (at ?a ?x))
					(has-bridge ?b ?x ?y)
					(not (has-bridge ?b ?y ?x))
			 )
)

(:action clean
	:agent ?a - agent
	:parameters (?b - bridge ?x - location ?y - location ) 
	:precondition (and
					(at ?a ?x)
					(has-bridge ?b ?x ?y) 
			)
	:effect	(and 
					(at ?a ?y)
					(not (at ?a ?x))
					(not (has-bridge ?b ?x ?y))
					;(has-bridge ?b ?y ?x)
			 )
)

(:action pushswitch
	:agent ?a - agent
	:parameters (?s - switch ?x - location ?y - location ?z - location)
	:precondition (and
					(at ?a ?x)
					(has-switch ?s ?x ?y ?z)
			 	  )
	:effect	(and
				(not (blocked ?y ?z))
				(not (blocked ?z ?y))
	)
)

(:concurrency-constraint v1
	:parameters (?d - door)
	:bounds (1 3)
	:actions ( (move 1) )
)

(:concurrency-constraint v3
	:parameters (?b - bridge)
	:bounds (1 5)
	:actions ( (clean 1) )
)

)

