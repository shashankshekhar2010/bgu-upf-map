(define (domain maze)

(:requirements :typing :concurrency-network :multi-agent)

(:types agent location door bridge boat switch)

(:predicates
	(at ?a - agent ?x - location)
	(has-switch ?s - switch ?x - location ?y - location ?z - location)
	(blocked ?x - location ?y - location)
	(has-door ?d - door ?x - location ?y - location)
	(has-boat ?b - boat ?x - location ?y - location)
	(has-bridge ?b - bridge ?x - location ?y - location)	
	(AT ?BO - BOAT ?L2 - LOCATION)
)

( :ACTION dude
  :agent ?AGENT0 - AGENT
  :PARAMETERS ( ?AGENT1 - AGENT ?BOAT2 - BOAT ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( AT ?BOAT2 ?LOCATION3 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION4 )
		( NOT ( AT ?AGENT0 ?LOCATION3 ) )
		( AT ?BOAT2 ?LOCATION4 )
		( NOT ( AT ?BOAT2 ?LOCATION3 ) )
	)
)

(:concurrency-constraint v2
	:parameters (?b - boat)
	:bounds (2 inf)
	:actions ( (dude 2) )
)

)
