;;
;;	TABLEMOVER DOMAIN 
;;
( DEFINE ( DOMAIN TABLEMOVER )
( :REQUIREMENTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	AGENT - OBJECT
	TABLE - OBJECT
	ROOM - OBJECT
	AGENT-COUNT - OBJECT
)
( :CONSTANTS
	ACOUNT-0 - AGENT-COUNT
)
( :PREDICATES
	( LIFTING ?AGENT0 - AGENT ?TABLE1 - TABLE )
	( INROOM ?TABLE0 - TABLE ?ROOM1 - ROOM )
	( NEG-INROOM ?TABLE0 - TABLE ?ROOM1 - ROOM )
	( IN ?AGENT0 - AGENT ?ROOM1 - ROOM )
	( CONNECTED ?ROOM0 - ROOM ?ROOM1 - ROOM )
	( INTACT ?TABLE0 - TABLE )
	( NEG-INTACT ?TABLE0 - TABLE )
	( HAS-CHARGING-POINT ?ROOM0 - ROOM )
	( AVAILABLE ?AGENT0 - AGENT )
	( CHARGED ?AGENT0 - AGENT )
	( TAKEN ?AGENT0 - AGENT )
	( CONSEC ?AGENT-COUNT0 - AGENT-COUNT ?AGENT-COUNT1 - AGENT-COUNT )
	( ACTIVE-V2 ?TABLE0 - TABLE ?ROOM1 - ROOM ?ROOM2 - ROOM )
	( COUNT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V3 ?TABLE0 - TABLE ?ROOM1 - ROOM )
	( COUNT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V4 ?TABLE0 - TABLE )
	( COUNT-V4 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V4 ?AGENT-COUNT0 - AGENT-COUNT )
	( AFREE )
	( IN-JOINT )
	( P-MOVE-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM ?ROOM3 - ROOM )
	( NEXT-ACTIVITY-2-MOVE-TABLE-2 ?TABLE0 - TABLE ?ROOM1 - ROOM ?ROOM2 - ROOM )
	( P-ACTIVITY-2-MOVE-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM ?ROOM3 - ROOM )
	( P-LIFT-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM )
	( NEXT-ACTIVITY-2-LIFT-TABLE-2 ?TABLE0 - TABLE ?ROOM1 - ROOM )
	( P-ACTIVITY-2-LIFT-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM )
	( P-ACTIVITY-2-DROP-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE )
	( P-DROP-TABLE ?AGENT0 - AGENT ?TABLE1 - TABLE )
	( NEXT-ACTIVITY-2-DROP-TABLE-2 ?TABLE0 - TABLE )
)
( :ACTION DO-MOVE-AGENT
  :PARAMETERS ( ?AGENT0 - AGENT ?ROOM1 - ROOM ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( IN ?AGENT0 ?ROOM1 )
		( CONNECTED ?ROOM1 ?ROOM2 )
		( AVAILABLE ?AGENT0 )
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( IN ?AGENT0 ?ROOM1 ) )
		( IN ?AGENT0 ?ROOM2 )
	)
)
( :ACTION DO-CHARGE-AGENT
  :PARAMETERS ( ?AGENT0 - AGENT ?ROOM1 - ROOM )
  :PRECONDITION
	( AND
		( IN ?AGENT0 ?ROOM1 )
		( HAS-CHARGING-POINT ?ROOM1 )
		( NOT ( CHARGED ?AGENT0 ) )
		( AFREE )
	)
  :EFFECT
	( AND
		( CHARGED ?AGENT0 )
	)
)
( :ACTION START-V2
  :PARAMETERS ( ?TABLE0 - TABLE ?ROOM1 - ROOM ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V2 ?TABLE0 ?ROOM1 ?ROOM2 )
		( COUNT-V2 ACOUNT-0 )
	)
)
( :ACTION DO-MOVE-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM ?ROOM3 - ROOM ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LIFTING ?AGENT0 ?TABLE1 )
		( IN ?AGENT0 ?ROOM2 )
		( CONNECTED ?ROOM2 ?ROOM3 )
		( CHARGED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?TABLE1 ?ROOM2 ?ROOM3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( FORALL
			( ?AGENT6 - AGENT )
			( AND
				( NOT ( P-MOVE-TABLE ?AGENT6 ?TABLE1 ?ROOM2 ?ROOM3 ) )
			)
		)
	)
  :EFFECT
	( AND
		( NOT ( IN ?AGENT0 ?ROOM2 ) )
		( IN ?AGENT0 ?ROOM3 )
		( NOT ( CHARGED ?AGENT0 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT4 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( P-MOVE-TABLE ?AGENT0 ?TABLE1 ?ROOM2 ?ROOM3 )
	)
)
( :ACTION DO-ACTIVITY-2-MOVE-TABLE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?ROOM4 - ROOM ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LIFTING ?AGENT0 ?TABLE2 )
		( IN ?AGENT0 ?ROOM3 )
		( CONNECTED ?ROOM3 ?ROOM4 )
		( CHARGED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?TABLE2 ?ROOM3 ?ROOM4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( NOT ( IN ?AGENT0 ?ROOM3 ) )
		( IN ?AGENT0 ?ROOM4 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-MOVE-TABLE-2 ?TABLE2 ?ROOM3 ?ROOM4 )
		( P-ACTIVITY-2-MOVE-TABLE ?AGENT0 ?TABLE2 ?ROOM3 ?ROOM4 )
		( P-MOVE-TABLE ?AGENT0 ?TABLE2 ?ROOM3 ?ROOM4 )
	)
)
( :ACTION DO-ACTIVITY-2-MOVE-TABLE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?ROOM4 - ROOM ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LIFTING ?AGENT0 ?TABLE2 )
		( IN ?AGENT0 ?ROOM3 )
		( CONNECTED ?ROOM3 ?ROOM4 )
		( CHARGED ?AGENT0 )
		( NEXT-ACTIVITY-2-MOVE-TABLE-2 ?TABLE2 ?ROOM3 ?ROOM4 )
		( ACTIVE-V2 ?TABLE2 ?ROOM3 ?ROOM4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( NOT ( IN ?AGENT0 ?ROOM3 ) )
		( IN ?AGENT0 ?ROOM4 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-MOVE-TABLE-2 ?TABLE2 ?ROOM3 ?ROOM4 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( P-MOVE-TABLE ?AGENT0 ?TABLE2 ?ROOM3 ?ROOM4 )
	)
)
( :ACTION END-V2
  :PARAMETERS ( ?TABLE0 - TABLE ?ROOM1 - ROOM ?ROOM2 - ROOM ?AGENT-COUNT3 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V2 ?AGENT-COUNT3 )
		( SAT-V2 ?AGENT-COUNT3 )
		( ACTIVE-V2 ?TABLE0 ?ROOM1 ?ROOM2 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V2 ?AGENT-COUNT3 ) )
		( AFREE )
		( NOT ( ACTIVE-V2 ?TABLE0 ?ROOM1 ?ROOM2 ) )
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-MOVE-TABLE ?AGENT4 ?TABLE0 ?ROOM1 ?ROOM2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-ACTIVITY-2-MOVE-TABLE ?AGENT4 ?TABLE0 ?ROOM1 ?ROOM2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( TAKEN ?AGENT4 ) )
		)
	)
)
( :ACTION START-V3
  :PARAMETERS ( ?TABLE0 - TABLE ?ROOM1 - ROOM )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V3 ?TABLE0 ?ROOM1 )
		( COUNT-V3 ACOUNT-0 )
	)
)
( :ACTION DO-LIFT-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM ?AGENT-COUNT3 - AGENT-COUNT ?AGENT-COUNT4 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AVAILABLE ?AGENT0 )
		( IN ?AGENT0 ?ROOM2 )
		( INROOM ?TABLE1 ?ROOM2 )
		( INTACT ?TABLE1 )
		( CHARGED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V3 ?TABLE1 ?ROOM2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT3 )
		( CONSEC ?AGENT-COUNT3 ?AGENT-COUNT4 )
		( FORALL
			( ?AGENT5 - AGENT )
			( AND
				( NOT ( P-LIFT-TABLE ?AGENT5 ?TABLE1 ?ROOM2 ) )
			)
		)
	)
  :EFFECT
	( AND
		( LIFTING ?AGENT0 ?TABLE1 )
		( NOT ( AVAILABLE ?AGENT0 ) )
		( NEG-INROOM ?TABLE1 ?ROOM2 )
		( NEG-INTACT ?TABLE1 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT3 ) )
		( COUNT-V3 ?AGENT-COUNT4 )
		( P-LIFT-TABLE ?AGENT0 ?TABLE1 ?ROOM2 )
	)
)
( :ACTION DO-ACTIVITY-2-LIFT-TABLE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AVAILABLE ?AGENT0 )
		( IN ?AGENT0 ?ROOM3 )
		( INROOM ?TABLE2 ?ROOM3 )
		( INTACT ?TABLE2 )
		( CHARGED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V3 ?TABLE2 ?ROOM3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( LIFTING ?AGENT0 ?TABLE2 )
		( NOT ( AVAILABLE ?AGENT0 ) )
		( NEG-INROOM ?TABLE2 ?ROOM3 )
		( INTACT ?TABLE2 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT4 ) )
		( COUNT-V3 ?AGENT-COUNT5 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-LIFT-TABLE-2 ?TABLE2 ?ROOM3 )
		( P-ACTIVITY-2-LIFT-TABLE ?AGENT0 ?TABLE2 ?ROOM3 )
		( P-LIFT-TABLE ?AGENT0 ?TABLE2 ?ROOM3 )
	)
)
( :ACTION DO-ACTIVITY-2-LIFT-TABLE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AVAILABLE ?AGENT0 )
		( IN ?AGENT0 ?ROOM3 )
		( INROOM ?TABLE2 ?ROOM3 )
		( INTACT ?TABLE2 )
		( CHARGED ?AGENT0 )
		( NEXT-ACTIVITY-2-LIFT-TABLE-2 ?TABLE2 ?ROOM3 )
		( ACTIVE-V3 ?TABLE2 ?ROOM3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( LIFTING ?AGENT0 ?TABLE2 )
		( NOT ( AVAILABLE ?AGENT0 ) )
		( NEG-INROOM ?TABLE2 ?ROOM3 )
		( INTACT ?TABLE2 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-LIFT-TABLE-2 ?TABLE2 ?ROOM3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT4 ) )
		( COUNT-V3 ?AGENT-COUNT5 )
		( P-LIFT-TABLE ?AGENT0 ?TABLE2 ?ROOM3 )
	)
)
( :ACTION END-V3
  :PARAMETERS ( ?TABLE0 - TABLE ?ROOM1 - ROOM ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V3 ?AGENT-COUNT2 )
		( SAT-V3 ?AGENT-COUNT2 )
		( ACTIVE-V3 ?TABLE0 ?ROOM1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V3 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V3 ?TABLE0 ?ROOM1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-LIFT-TABLE ?AGENT3 ?TABLE0 ?ROOM1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ACTIVITY-2-LIFT-TABLE ?AGENT3 ?TABLE0 ?ROOM1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-INROOM ?TABLE0 ?ROOM1 )
				( AND
					( NOT ( INROOM ?TABLE0 ?ROOM1 ) )
					( NOT ( NEG-INROOM ?TABLE0 ?ROOM1 ) )
				)
			)
		)
		( FORALL
			( )
			( WHEN
				( NEG-INTACT ?TABLE0 )
				( AND
					( NOT ( INTACT ?TABLE0 ) )
					( NOT ( NEG-INTACT ?TABLE0 ) )
				)
			)
		)
	)
)
( :ACTION START-V4
  :PARAMETERS ( ?TABLE0 - TABLE )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V4 ?TABLE0 )
		( COUNT-V4 ACOUNT-0 )
	)
)
( :ACTION DO-DROP-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE1 - TABLE ?ROOM2 - ROOM ?AGENT-COUNT3 - AGENT-COUNT ?AGENT-COUNT4 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( IN ?AGENT0 ?ROOM2 )
		( LIFTING ?AGENT0 ?TABLE1 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V4 ?TABLE1 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V4 ?AGENT-COUNT3 )
		( CONSEC ?AGENT-COUNT3 ?AGENT-COUNT4 )
		( FORALL
			( ?AGENT5 - AGENT )
			( NOT ( P-ACTIVITY-2-DROP-TABLE ?AGENT5 ?TABLE1 ) )
		)
		( FORALL
			( ?AGENT5 - AGENT )
			( AND
				( NOT ( P-DROP-TABLE ?AGENT5 ?TABLE1 ) )
			)
		)
	)
  :EFFECT
	( AND
		( NOT ( LIFTING ?AGENT0 ?TABLE1 ) )
		( INROOM ?TABLE1 ?ROOM2 )
		( AVAILABLE ?AGENT0 )
		( NOT ( INTACT ?TABLE1 ) )
		( NOT ( CHARGED ?AGENT0 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V4 ?AGENT-COUNT3 ) )
		( COUNT-V4 ?AGENT-COUNT4 )
		( P-DROP-TABLE ?AGENT0 ?TABLE1 )
	)
)
( :ACTION DO-ACTIVITY-2-DROP-TABLE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( IN ?AGENT0 ?ROOM3 )
		( LIFTING ?AGENT0 ?TABLE2 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V4 ?TABLE2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V4 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( NOT ( LIFTING ?AGENT0 ?TABLE2 ) )
		( INROOM ?TABLE2 ?ROOM3 )
		( AVAILABLE ?AGENT0 )
		( INTACT ?TABLE2 )
		( NOT ( CHARGED ?AGENT0 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V4 ?AGENT-COUNT4 ) )
		( COUNT-V4 ?AGENT-COUNT5 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-DROP-TABLE-2 ?TABLE2 )
		( P-ACTIVITY-2-DROP-TABLE ?AGENT0 ?TABLE2 )
		( P-DROP-TABLE ?AGENT0 ?TABLE2 )
	)
)
( :ACTION DO-ACTIVITY-2-DROP-TABLE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?TABLE2 - TABLE ?ROOM3 - ROOM ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( IN ?AGENT0 ?ROOM3 )
		( LIFTING ?AGENT0 ?TABLE2 )
		( NEXT-ACTIVITY-2-DROP-TABLE-2 ?TABLE2 )
		( ACTIVE-V4 ?TABLE2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V4 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( NOT ( LIFTING ?AGENT0 ?TABLE2 ) )
		( INROOM ?TABLE2 ?ROOM3 )
		( AVAILABLE ?AGENT0 )
		( INTACT ?TABLE2 )
		( NOT ( CHARGED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-DROP-TABLE-2 ?TABLE2 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V4 ?AGENT-COUNT4 ) )
		( COUNT-V4 ?AGENT-COUNT5 )
		( P-DROP-TABLE ?AGENT0 ?TABLE2 )
	)
)
( :ACTION END-V4
  :PARAMETERS ( ?TABLE0 - TABLE ?AGENT-COUNT1 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V4 ?AGENT-COUNT1 )
		( SAT-V4 ?AGENT-COUNT1 )
		( ACTIVE-V4 ?TABLE0 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V4 ?AGENT-COUNT1 ) )
		( AFREE )
		( NOT ( ACTIVE-V4 ?TABLE0 ) )
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( P-DROP-TABLE ?AGENT2 ?TABLE0 ) )
		)
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( P-ACTIVITY-2-DROP-TABLE ?AGENT2 ?TABLE0 ) )
		)
		( FORALL
			( ?AGENT2 - AGENT )
			( NOT ( TAKEN ?AGENT2 ) )
		)
	)
)
)

;Domain compilation time is: 0.003335
