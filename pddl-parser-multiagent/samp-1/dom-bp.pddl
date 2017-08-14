;;
;;	BOXPUSHING DOMAIN 
;;
( DEFINE ( DOMAIN BOXPUSHING )
( :REQUIREMENTS :TYPING )
( :TYPES
	AGENT - OBJECT
	BOX - OBJECT
	LOCATION - OBJECT
	AGENT-COUNT - OBJECT
)
( :CONSTANTS
	ACOUNT-0 - AGENT-COUNT
)
( :PREDICATES
	( BOX-AT-LOC ?BOX0 - BOX ?LOCATION1 - LOCATION )
	( POS-BOX-AT-LOC ?BOX0 - BOX ?LOCATION1 - LOCATION )
	( NEG-BOX-AT-LOC ?BOX0 - BOX ?LOCATION1 - LOCATION )
	( AGENT-AT-LOC ?AGENT0 - AGENT ?LOCATION1 - LOCATION )
	( CONNECTED ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
	( TAKEN ?AGENT0 - AGENT )
	( CONSEC ?AGENT-COUNT0 - AGENT-COUNT ?AGENT-COUNT1 - AGENT-COUNT )
	( ACTIVE-V2 ?BOX0 - BOX )
	( COUNT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V1 ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
	( COUNT-V1 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V1 ?AGENT-COUNT0 - AGENT-COUNT )
	( AFREE )
	( IN-JOINT )
	( P-PUSH-BOX ?BOX0 - BOX )
	( NEXT-ACTIVITY-PUSH-BOX-2 ?BOX0 - BOX )
	( P-ACTIVITY-PUSH-BOX ?BOX0 - BOX )
	( P-MOVE-AGENT ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
)
( :ACTION START-V2
  :PARAMETERS ( ?BOX0 - BOX )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V2 ?BOX0 )
		( COUNT-V2 ACOUNT-0 )
	)
)
( :ACTION DO-PUSH-BOX
  :PARAMETERS ( ?AGENT0 - AGENT ?BOX1 - BOX ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION2 )
		( BOX-AT-LOC ?BOX1 ?LOCATION2 )
		( CONNECTED ?LOCATION2 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?BOX1 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( NOT ( P-PUSH-BOX ?BOX1 ) )
	)
  :EFFECT
	( AND
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( P-PUSH-BOX ?BOX1 )
	)
)
( :ACTION DO-ACTIVITY-PUSH-BOX-1
  :PARAMETERS ( ?AGENT0 - AGENT ?BOX2 - BOX ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION3 )
		( BOX-AT-LOC ?BOX2 ?LOCATION3 )
		( CONNECTED ?LOCATION3 ?LOCATION4 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?BOX2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION4 )
		( POS-BOX-AT-LOC ?BOX2 ?LOCATION4 )
		( NOT ( AGENT-AT-LOC ?AGENT0 ?LOCATION3 ) )
		( NEG-BOX-AT-LOC ?BOX2 ?LOCATION3 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-PUSH-BOX-2 ?BOX2 )
		( P-ACTIVITY-PUSH-BOX ?BOX2 )
	)
)
( :ACTION DO-ACTIVITY-PUSH-BOX-2
  :PARAMETERS ( ?AGENT0 - AGENT ?BOX2 - BOX ?LOCATION3 - LOCATION ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION3 )
		( BOX-AT-LOC ?BOX2 ?LOCATION3 )
		( CONNECTED ?LOCATION3 ?LOCATION4 )
		( NEXT-ACTIVITY-PUSH-BOX-2 ?BOX2 )
		( ACTIVE-V2 ?BOX2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION4 )
		( POS-BOX-AT-LOC ?BOX2 ?LOCATION4 )
		( NOT ( AGENT-AT-LOC ?AGENT0 ?LOCATION3 ) )
		( NEG-BOX-AT-LOC ?BOX2 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-PUSH-BOX-2 ?BOX2 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
	)
)
( :ACTION END-V2
  :PARAMETERS ( ?BOX0 - BOX ?AGENT-COUNT1 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V2 ?AGENT-COUNT1 )
		( SAT-V2 ?AGENT-COUNT1 )
		( ACTIVE-V2 ?BOX0 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V2 ?AGENT-COUNT1 ) )
		( AFREE )
		( NOT ( ACTIVE-V2 ?BOX0 ) )
		( NOT ( P-PUSH-BOX ?BOX0 ) )
		( NOT ( P-ACTIVITY-PUSH-BOX ?BOX0 ) )
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( TAKEN ?AGENT2 ) )
		)
		( FORALL
			( ?LOCATION2 - LOCATION )
			( AND
				( WHEN
					( POS-BOX-AT-LOC ?BOX0 ?LOCATION2 )
					( AND
						( BOX-AT-LOC ?BOX0 ?LOCATION2 )
						( NOT ( POS-BOX-AT-LOC ?BOX0 ?LOCATION2 ) )
					)
				)
				( WHEN
					( NEG-BOX-AT-LOC ?BOX0 ?LOCATION2 )
					( AND
						( NOT ( BOX-AT-LOC ?BOX0 ?LOCATION2 ) )
						( NOT ( NEG-BOX-AT-LOC ?BOX0 ?LOCATION2 ) )
					)
				)
			)
		)
	)
)
( :ACTION START-V1
  :PARAMETERS ( ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V1 ?LOCATION0 ?LOCATION1 )
		( COUNT-V1 ACOUNT-0 )
	)
)
( :ACTION DO-MOVE-AGENT
  :PARAMETERS ( ?AGENT0 - AGENT ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION ?AGENT-COUNT3 - AGENT-COUNT ?AGENT-COUNT4 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT-LOC ?AGENT0 ?LOCATION1 )
		( CONNECTED ?LOCATION1 ?LOCATION2 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V1 ?LOCATION1 ?LOCATION2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V1 ?AGENT-COUNT3 )
		( CONSEC ?AGENT-COUNT3 ?AGENT-COUNT4 )
	)
  :EFFECT
	( AND
		( NOT ( AGENT-AT-LOC ?AGENT0 ?LOCATION1 ) )
		( AGENT-AT-LOC ?AGENT0 ?LOCATION2 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V1 ?AGENT-COUNT3 ) )
		( COUNT-V1 ?AGENT-COUNT4 )
		( P-MOVE-AGENT ?LOCATION1 ?LOCATION2 )
	)
)
( :ACTION END-V1
  :PARAMETERS ( ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V1 ?AGENT-COUNT2 )
		( SAT-V1 ?AGENT-COUNT2 )
		( ACTIVE-V1 ?LOCATION0 ?LOCATION1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V1 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V1 ?LOCATION0 ?LOCATION1 ) )
		( NOT ( P-MOVE-AGENT ?LOCATION0 ?LOCATION1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
	)
)
)
