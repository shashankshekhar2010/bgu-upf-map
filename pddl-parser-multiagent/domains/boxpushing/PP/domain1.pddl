;;
;; 			Box-Pushing domain
;
(define (domain boxpushing)
	(:requirements :typing :concurrency-network :multi-agent :factored-privacy) 
  	(:types		
  		agent 
		box 	
		location 		
  	)
  	(:predicates 	
  		(box-at-loc ?box - box ?location - location)		
		(connected ?from - location ?to - location)
		(:private
			(agent-at-loc ?agent - agent ?loc - location)
		)
  	)
	  
	(:action push-box
		:agent ?agent - agent 
	  	:parameters (?box - box ?from-location - location ?to-location - location)
	  	:precondition 
	  		(and 	  			
	  			(agent-at-loc ?agent ?from-location)
	  			(box-at-loc ?box ?from-location)
	  			(connected ?from-location ?to-location)
	  		)
	  	:effect 
	  		(and)
	  )
	  
	  (:action push-box-activity
		:agent ?agent0 - agent 
	  	:parameters (?agent1 - agent ?box - box ?from-location - location ?to-location - location)
	  	:precondition 
	  		(and 	  			
	  			(agent-at-loc ?agent0 ?from-location)
	  			;(agent-at-loc ?agent1 ?from-location)
	  			(box-at-loc ?box ?from-location)
	  			(connected ?from-location ?to-location)
	  		)
	  	:effect 
	  		(and	  			
	  			(agent-at-loc ?agent0 ?to-location)
	  			;(agent-at-loc ?agent1 ?to-location)
	  			(box-at-loc ?box ?from-location)
	  			(not (agent-at-loc ?agent0 ?to-location))
	  			;(not (agent-at-loc ?agent1 ?to-location))
	  			(not (box-at-loc ?box ?from-location))
	  		)
	  )
	  

(:concurrency-constraint v2
    :parameters (?box - box) 
    :bounds (1 inf) 
    :actions ( (push-box 1) (push-box-activity 2) ) 
)

)