( DEFINE ( DOMAIN MAZE )
( :REQUIREMENTS :TYPING )
( :TYPES
	AGENT - OBJECT
	BOAT - OBJECT
	LOCATION - OBJECT
	DOOR - OBJECT
	BRIDGE - OBJECT
	SWITCH - OBJECT
	AGENT-COUNT - OBJECT
)
( :CONSTANTS
	ACOUNT-0 - AGENT-COUNT
)
( :PREDICATES
	( AT ?AGENT0 - AGENT ?LOCATION1 - LOCATION )
	( HAS-SWITCH ?SWITCH0 - SWITCH ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
	( BLOCKED ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
	( HAS-DOOR ?DOOR0 - DOOR ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
	( HAS-BOAT ?BOAT0 - BOAT ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
	( HAS-BRIDGE ?BRIDGE0 - BRIDGE ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
	( NEG-HAS-BRIDGE ?BRIDGE0 - BRIDGE ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
	( NEXT ?AGENT0 - AGENT )
	( AT ?BOAT0 - BOAT ?LOCATION1 - LOCATION )
	( TAKEN ?AGENT0 - AGENT )
	( CONSEC ?AGENT-COUNT0 - AGENT-COUNT ?AGENT-COUNT1 - AGENT-COUNT )
	( ACTIVE-V2 ?BRIDGE0 - BRIDGE )
	( COUNT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( AFREE )
	( IN-JOINT )
	( P-BUILD )
	( P-CROSS )
	( P-BUILD )
	( :PRIVATE
		( LOOCHA ?AGENT0 - AGENT )
		( GHATIYA ?AGENT0 - AGENT )
		( KUTTA ?AGENT0 - AGENT )
	)
)
( :ACTION START-V2
  :PARAMETERS ( ?BRIDGE0 - BRIDGE )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V2 ?BRIDGE0 )
		( COUNT-V2 ACOUNT-0 )
	)
)
( :ACTION DO-CROSS
  :PARAMETERS ( ?AGENT0 - AGENT ?BRIDGE1 - BRIDGE ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( HAS-BRIDGE ?BRIDGE1 ?LOCATION2 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?BRIDGE1 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( NOT ( P-BUILD ) )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( NOT ( AT ?AGENT0 ?LOCATION2 ) )
		( NEG-HAS-BRIDGE ?BRIDGE1 ?LOCATION2 ?LOCATION3 )
		( NEG-HAS-BRIDGE ?BRIDGE1 ?LOCATION3 ?LOCATION2 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( P-CROSS )
	)
)
( :ACTION DO-BUILD
  :PARAMETERS ( ?AGENT0 - AGENT ?BRIDGE1 - BRIDGE ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?BRIDGE1 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( NOT ( P-CROSS ) )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( NOT ( AT ?AGENT0 ?LOCATION2 ) )
		( HAS-BRIDGE ?BRIDGE1 ?LOCATION2 ?LOCATION3 )
		( HAS-BRIDGE ?BRIDGE1 ?LOCATION3 ?LOCATION2 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( P-BUILD )
	)
)
( :ACTION END-V2
  :PARAMETERS ( ?BRIDGE0 - BRIDGE ?AGENT-COUNT1 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( COUNT-V2 ?AGENT-COUNT1 )
		( SAT-V2 ?AGENT-COUNT1 )
		( ACTIVE-V2 ?BRIDGE0 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V2 ?AGENT-COUNT1 ) )
		( AFREE )
		( NOT ( ACTIVE-V2 ?BRIDGE0 ) )
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( TAKEN ?AGENT2 ) )
		)
		( FORALL
			( ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
			( WHEN
				( NEG-HAS-BRIDGE ?BRIDGE0 ?LOCATION2 ?LOCATION3 )
				( AND
					( NOT ( HAS-BRIDGE ?BRIDGE0 ?LOCATION2 ?LOCATION3 ) )
					( NOT ( NEG-HAS-BRIDGE ?BRIDGE0 ?LOCATION2 ?LOCATION3 ) )
				)
			)
		)
	)
)
)
