;
;NOTE - in each collaborative action, we consider the symmetric effects for all the agents that 
;appear as parameters, we do not mention the symmetric effects for all the agents in the action 
;schema, as similar effects can be considered for other agents.
;This reduces the effort required in the splitting phase. 
;However, if the case is otherwise, our code can be modified easily to support a collaborative 
;action with full action description.   
;These specifications are suitable for privacy preserving planning, where agents get only 
;partial view of a public action.
;
(define (domain maze)
(:requirements :typing :concurrency-network :multi-agent)
(:types agent location door bridge boat switch)
(:predicates
	(at ?a - agent ?x - location)
	(has-switch ?s - switch ?x - location ?y - location ?z - location)
	(blocked ?x - location ?y - location)
	(has-door ?d - door ?x - location ?y - location)
	(has-boat ?b - boat ?x - location ?y - location)
	(at-boat  ?b - boat ?loc1 - location)
	(has-bridge ?b - bridge ?x - location ?y - location)
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
(:action row 
	:agent ?a - agent
	:parameters (?b - boat ?x - location ?y - location)
	:precondition (and
				(at ?a ?x)
				(has-boat ?b ?x ?y)
			 )
	:effect	(and
				;no effect
			) 
)
(:action activity-row-row 
	:agent ?a0 - agent
	:parameters (?a1 - agent ?b - boat ?x - loaction ?y - location)
	:precondition (and
				(at ?a0 ?x)
				(has-boat ?b ?x ?y)				
			 )
	:effect	(and 
			(at ?a0 ?y)
			(not (at ?a0 ?x)) 			
		)
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
					(not (has-bridge ?b ?y ?x))
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
	:bounds (1 1)
	:actions ( (move 1) )
)
(:concurrency-constraint v2
	:parameters (?b - boat ?x - location)
	:bounds (2 2)
	:actions ( 
				(row 1 2) 
				(activity-row-row 2 3) 
			)
)
(:concurrency-constraint v3
	:parameters (?b - bridge ?x - location ?y - location)
	:bounds (1 5)
	:actions ( (cross 1 2 3) )
)
(:concurrency-constraint v4
	:parameters (?s - switch)
	:bounds (1 1)
	:actions ( (pushswitch 1) )
)
)

