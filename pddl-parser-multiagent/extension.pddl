
;; LATER WE MIGHT WANT TO THINK ABOUT TWO AGENTS CARRYING A BIG BOX AND CROSSING A BRIDGE WHERE 
;; THE BRIDGE HAS USUAL CONSTRAINTS (AS IN CJR - ECAI2014) 

;; TRANSLATION FOR THE FIRST AGENT

( :ACTION START-ROW-JA1
  :PARAMETERS ( ?AGENT0 - AGENT ?AGENT1 - AGENT ?AGENT2 - AGENT
  				?BOAT1 - BOAT 
  				?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
  :PRECONDITION
	( AND
		( FREE )
		( NOT ( TAKEN ?AGENT0 ) )
	)
  :EFFECT
	( AND
		( NOT ( FREE ) )
		( ACTIVE-JA1 ?BOAT0 ?LOCATION1 )
		( COUNT-JA1 ACOUNT-1 )
		( AT ?AGENT0 ?LOCATION3 ) ; PRIVATE EFFECT
		( NOT ( AT ?AGENT0 ?LOCATION2 ) ) ; PRIVATE EFFECT
		( TAKEN ?AGENT0 ) 
		;( CONSEC-JA1 ?AGENT0 ?AGENT1 )
		( NEXT ?AGENT1 )
		;( COUNT-JA1 COUNT1 )
	)
)

( :ACTION DO-ROW-JA1
  :PARAMETERS ( ?AGENT0 - AGENT ?AGENT1 - AGENT ?AGENT2 - AGENT
  				?BOAT1 - BOAT 
  				?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )		
		( ACTIVE-JA1 ?BOAT1 )
		( NOT ( TAKEN ?AGENT1 ) )
		( NEXT ?AGENT1 )
		;( CONSEC-JA1 ?AGENT0 ?AGENT1 )
		;( COUNT-JA1 ?AGENT-COUNT4 )
		;( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 ) ; PRIVATE EFFECT
		( NOT ( AT ?AGENT0 ?LOCATION2 ) ) ; PRIVATE EFFECT
		( TAKEN ?AGENT1 ) 
		( NEXT ?AGENT2 )
		; NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		;( COUNT-V2 ?AGENT-COUNT5 )
	)
)

( :ACTION END-ROW-JA1
  :PARAMETERS ( ?AGENT0 - AGENT ?AGENT1 - AGENT ?AGENT2 - AGENT
  				?BOAT1 - BOAT 
  				?LOCATION2 - LOCATION ?LOCATION3 - LOCATION 
  				;?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT 
  			  )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )		
		( ACTIVE-JA1 ?BOAT1 )
		( NOT ( TAKEN ?AGENT2 ) )
		( NEXT ?AGENT2 )
		;( SAT-JA1 ?AGENT-COUNT5 )
		;( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 ) ; PRIVATE EFFECT
		( NOT ( AT ?AGENT0 ?LOCATION2 ) ) ; PRIVATE EFFECT
		( AT ?BO ?LOCATION3 ) ; PUBLIC
		;( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( FREE )
		( NOT ( ACTIVE-V2 ?BOAT0 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
	)
)
