( DEFINE ( DOMAIN MAZE )
( :REQUIREMENTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	AGENT - OBJECT
	LOCATION - OBJECT
	DOOR - OBJECT
	BRIDGE - OBJECT
	BOAT - OBJECT
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
	( AFREE )
	( ATEMP )
	( IN-JOINT )
	( TAKEN ?AGENT0 - AGENT )
	( CONSEC ?AGENT-COUNT0 - AGENT-COUNT ?AGENT-COUNT1 - AGENT-COUNT )
	( ACTIVE-V2 ?BOAT0 - BOAT ?LOCATION1 - LOCATION )
	( COUNT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V3 ?BRIDGE0 - BRIDGE )
	( COUNT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( P-ROW ?AGENT0 - AGENT ?BOAT1 - BOAT ?LOCATION2 - LOCATION )
	( NEXT-ACTIVITY-2-ROW-2 ?BOAT0 - BOAT ?LOCATION1 - LOCATION )
	( P-ACTIVITY-2-ROW ?AGENT0 - AGENT ?BOAT1 - BOAT ?LOCATION2 - LOCATION )
	( P-CROSS ?AGENT0 - AGENT ?BRIDGE1 - BRIDGE ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
)
( :ACTION DO-MOVE
  :PARAMETERS ( ?AGENT0 - AGENT ?DOOR1 - DOOR ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( NOT ( BLOCKED ?LOCATION2 ?LOCATION3 ) )
		( HAS-DOOR ?DOOR1 ?LOCATION2 ?LOCATION3 )
		( AFREE )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( NOT ( AT ?AGENT0 ?LOCATION2 ) )
	)
)
( :ACTION START-V2
  :PARAMETERS ( ?BOAT0 - BOAT ?LOCATION1 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V2 ?BOAT0 ?LOCATION1 )
		( COUNT-V2 ACOUNT-0 )
	)
)
( :ACTION DO-ROW
  :PARAMETERS ( ?AGENT0 - AGENT ?BOAT1 - BOAT ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( HAS-BOAT ?BOAT1 ?LOCATION2 ?LOCATION3 )
		( ACTIVE-V2 ?BOAT1 ?LOCATION2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( FORALL
			( ?AGENT6 - AGENT )
			( AND
				( NOT ( P-ROW ?AGENT6 ?BOAT1 ?LOCATION2 ) )
			)
		)
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( NOT ( AT ?AGENT0 ?LOCATION2 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( P-ROW ?AGENT0 ?BOAT1 ?LOCATION2 )
	)
)
( :ACTION DO-ACTIVITY-2-ROW-1
  :PARAMETERS ( ?AGENT0 - AGENT ?BOAT2 - BOAT ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( HAS-BOAT ?BOAT2 ?LOCATION3 ?LOCATION4 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?BOAT2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION4 )
		( NOT ( AT ?AGENT0 ?LOCATION3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-ROW-2 ?BOAT2 ?LOCATION3 )		
		( P-ROW ?AGENT0 ?BOAT2 ?LOCATION3 )
	)
)
( :ACTION DO-ACTIVITY-2-ROW-2
  :PARAMETERS ( ?AGENT0 - AGENT ?BOAT2 - BOAT ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( HAS-BOAT ?BOAT2 ?LOCATION3 ?LOCATION4 )
		( NEXT-ACTIVITY-2-ROW-2 ?BOAT2 ?LOCATION3 )
		( ACTIVE-V2 ?BOAT2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION4 )
		( NOT ( AT ?AGENT0 ?LOCATION3 ) )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-ROW-2 ?BOAT2 ?LOCATION3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( P-ROW ?AGENT0 ?BOAT2 ?LOCATION3 )
	)
)
( :ACTION END-V2
  :PARAMETERS ( ?BOAT0 - BOAT ?LOCATION1 - LOCATION ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V2 ?AGENT-COUNT2 )
		( SAT-V2 ?AGENT-COUNT2 )
		( ACTIVE-V2 ?BOAT0 ?LOCATION1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V2 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V2 ?BOAT0 ?LOCATION1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ROW ?AGENT3 ?BOAT0 ?LOCATION1 ) )
		)
	)
)
( :ACTION START-V3
  :PARAMETERS ( ?BRIDGE0 - BRIDGE )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V3 ?BRIDGE0 )
		( COUNT-V3 ACOUNT-0 )
	)
)
( :ACTION DO-CROSS
  :PARAMETERS ( ?AGENT0 - AGENT ?BRIDGE1 - BRIDGE ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( HAS-BRIDGE ?BRIDGE1 ?LOCATION2 ?LOCATION3 )
		( ACTIVE-V3 ?BRIDGE1 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( AT ?AGENT0 ?LOCATION3 )
		( NOT ( AT ?AGENT0 ?LOCATION2 ) )
		( NOT ( HAS-BRIDGE ?BRIDGE1 ?LOCATION2 ?LOCATION3 ) )
		( NOT ( HAS-BRIDGE ?BRIDGE1 ?LOCATION3 ?LOCATION2 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT4 ) )
		( COUNT-V3 ?AGENT-COUNT5 )
	)
)
( :ACTION END-V3
  :PARAMETERS ( ?BRIDGE0 - BRIDGE ?AGENT-COUNT1 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( COUNT-V3 ?AGENT-COUNT1 )
		( SAT-V3 ?AGENT-COUNT1 )
		( ACTIVE-V3 ?BRIDGE0 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V3 ?AGENT-COUNT1 ) )
		( AFREE )
		( NOT ( ACTIVE-V3 ?BRIDGE0 ) )
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( TAKEN ?AGENT2 ) )
		)
	)
)
( :ACTION DO-PUSHSWITCH
  :PARAMETERS ( ?AGENT0 - AGENT ?SWITCH1 - SWITCH ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION )
  :PRECONDITION
	( AND
		( AT ?AGENT0 ?LOCATION2 )
		( HAS-SWITCH ?SWITCH1 ?LOCATION2 ?LOCATION3 ?LOCATION4 )
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( BLOCKED ?LOCATION3 ?LOCATION4 ) )
		( NOT ( BLOCKED ?LOCATION4 ?LOCATION3 ) )
	)
)
( :ACTION FREE
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( ATEMP )
	)
  :EFFECT
	( AND
		( AFREE )
		( NOT ( ATEMP ) )
	)
)
)
