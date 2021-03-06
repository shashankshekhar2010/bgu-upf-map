;;
;;	APARTMENTMOVERS DOMAIN 
;;
( DEFINE ( DOMAIN APARTMENTMOVERS )
( :REQUIREMENTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	AGENT - OBJECT
	FURNITURE - OBJECT
	ELECTRONICS - OBJECT
	CARTON - OBJECT
	TRUCK - OBJECT
	LOCATION - OBJECT
	AGENT-COUNT - OBJECT
)
( :CONSTANTS
	ACOUNT-0 - AGENT-COUNT
)
( :PREDICATES
	( AGENT-AT ?AGENT0 - AGENT ?LOCATION1 - LOCATION )
	( FURNITURE-AT ?FURNITURE0 - FURNITURE ?LOCATION1 - LOCATION )
	( NEG-FURNITURE-AT ?FURNITURE0 - FURNITURE ?LOCATION1 - LOCATION )
	( ELECTRONICS-AT ?ELECTRONICS0 - ELECTRONICS ?LOCATION1 - LOCATION )
	( ELECTRONICS-IN ?ELECTRONICS0 - ELECTRONICS ?CARTON1 - CARTON )
	( CARTON-AT ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( NEG-CARTON-AT ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( TRUCK-AT ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION )
	( POS-TRUCK-AT ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION )
	( NEG-TRUCK-AT ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION )
	( CONNECTED ?LOCATION0 - LOCATION ?LOCATION1 - LOCATION )
	( LOADED-FURNITURE ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( NEG-LOADED-FURNITURE ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( LOADED-CARTON ?CARTON0 - CARTON ?TRUCK1 - TRUCK )
	( NEG-LOADED-CARTON ?CARTON0 - CARTON ?TRUCK1 - TRUCK )
	( INSIDE ?ELECTRONICS0 - ELECTRONICS ?CARTON1 - CARTON )
	( PACKED ?CARTON0 - CARTON )
	( NEG-PACKED ?CARTON0 - CARTON )
	( TIRED ?AGENT0 - AGENT )
	( CAN-WALK ?AGENT0 - AGENT )
	( TAKEN ?AGENT0 - AGENT )
	( CONSEC ?AGENT-COUNT0 - AGENT-COUNT ?AGENT-COUNT1 - AGENT-COUNT )
	( ACTIVE-V2 ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( COUNT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V2 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V3 ?CARTON0 - CARTON ?TRUCK1 - TRUCK )
	( COUNT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V3 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V4 ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
	( COUNT-V4 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V4 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V5 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION )
	( COUNT-V5 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V5 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V6 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( COUNT-V6 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V6 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V7 ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( COUNT-V7 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V7 ?AGENT-COUNT0 - AGENT-COUNT )
	( ACTIVE-V8 ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( COUNT-V8 ?AGENT-COUNT0 - AGENT-COUNT )
	( SAT-V8 ?AGENT-COUNT0 - AGENT-COUNT )
	( AFREE )
	( IN-JOINT )
	( NEXT-ACTIVITY-2-LOAD-CARTON-2 ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
	( P-ACTIVITY-2-LOAD-CARTON ?AGENT0 - AGENT ?CARTON1 - CARTON ?LOCATION2 - LOCATION )
	( NEXT-ACTIVITY-2-UNLOAD-CARTON-2 ?CARTON0 - CARTON ?TRUCK1 - TRUCK )
	( P-ACTIVITY-2-UNLOAD-CARTON ?AGENT0 - AGENT ?CARTON1 - CARTON ?TRUCK2 - TRUCK )
	( P-DRIVE-TRUCK ?AGENT0 - AGENT ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION )
	( P-LOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK ?LOCATION3 - LOCATION )
	( NEXT-ACTIVITY-2-LOAD-FURNITURE-2 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION )
	( P-ACTIVITY-2-LOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK ?LOCATION3 - LOCATION )
	( NEXT-ACTIVITY-3-LOAD-FURNITURE-2 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION )
	( NEXT-ACTIVITY-3-LOAD-FURNITURE-3 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION )
	( P-ACTIVITY-3-LOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK ?LOCATION3 - LOCATION )
	( P-UNLOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK )
	( NEXT-ACTIVITY-2-UNLOAD-FURNITURE-2 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( P-ACTIVITY-2-UNLOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK )
	( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-2 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-3 ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
	( P-ACTIVITY-3-UNLOAD-FURNITURE ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK )
	( P-PACK-APPLIANCE ?AGENT0 - AGENT ?CARTON1 - CARTON ?LOCATION2 - LOCATION )
	( P-UNPACK-APPLIANCE ?AGENT0 - AGENT ?CARTON1 - CARTON ?LOCATION2 - LOCATION )
)
( :ACTION DO-CONSUME
  :PARAMETERS ( ?AGENT0 - AGENT )
  :PRECONDITION
	( AND
		( TIRED ?AGENT0 )
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( TIRED ?AGENT0 ) )
	)
)
( :ACTION DO-MOVE-AGENT
  :PARAMETERS ( ?AGENT0 - AGENT ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION1 )
		( CONNECTED ?LOCATION1 ?LOCATION2 )
		( CAN-WALK ?AGENT0 )
		( AFREE )
	)
  :EFFECT
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION2 )
		( NOT ( AGENT-AT ?AGENT0 ?LOCATION1 ) )
	)
)
( :ACTION START-V2
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V2 ?CARTON0 ?LOCATION1 )
		( COUNT-V2 ACOUNT-0 )
	)
)
( :ACTION DO-ACTIVITY-2-LOAD-CARTON-1
  :PARAMETERS ( ?AGENT0 - AGENT ?CARTON2 - CARTON ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( CARTON-AT ?CARTON2 ?LOCATION4 )
		( PACKED ?CARTON2 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V2 ?CARTON2 ?LOCATION4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( NEG-CARTON-AT ?CARTON2 ?LOCATION4 )
		( TIRED ?AGENT0 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-LOAD-CARTON-2 ?CARTON2 ?LOCATION4 )
		( P-ACTIVITY-2-LOAD-CARTON ?AGENT0 ?CARTON2 ?LOCATION4 )
	)
)
( :ACTION DO-ACTIVITY-2-LOAD-CARTON-2
  :PARAMETERS ( ?AGENT0 - AGENT ?CARTON2 - CARTON ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( CARTON-AT ?CARTON2 ?LOCATION4 )
		( PACKED ?CARTON2 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-2-LOAD-CARTON-2 ?CARTON2 ?LOCATION4 )
		( ACTIVE-V2 ?CARTON2 ?LOCATION4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V2 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( NEG-CARTON-AT ?CARTON2 ?LOCATION4 )
		( TIRED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-LOAD-CARTON-2 ?CARTON2 ?LOCATION4 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V2 ?AGENT-COUNT5 ) )
		( COUNT-V2 ?AGENT-COUNT6 )
	)
)
( :ACTION END-V2
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V2 ?AGENT-COUNT2 )
		( SAT-V2 ?AGENT-COUNT2 )
		( ACTIVE-V2 ?CARTON0 ?LOCATION1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V2 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V2 ?CARTON0 ?LOCATION1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ACTIVITY-2-LOAD-CARTON ?AGENT3 ?CARTON0 ?LOCATION1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-CARTON-AT ?CARTON0 ?LOCATION1 )
				( AND
					( NOT ( CARTON-AT ?CARTON0 ?LOCATION1 ) )
					( NOT ( NEG-CARTON-AT ?CARTON0 ?LOCATION1 ) )
				)
			)
		)
	)
)
( :ACTION START-V3
  :PARAMETERS ( ?CARTON0 - CARTON ?TRUCK1 - TRUCK )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V3 ?CARTON0 ?TRUCK1 )
		( COUNT-V3 ACOUNT-0 )
	)
)
( :ACTION DO-ACTIVITY-2-UNLOAD-CARTON-1
  :PARAMETERS ( ?AGENT0 - AGENT ?CARTON2 - CARTON ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V3 ?CARTON2 ?TRUCK3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( NEG-LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( CARTON-AT ?CARTON2 ?LOCATION4 )
		( TIRED ?AGENT0 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT5 ) )
		( COUNT-V3 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-UNLOAD-CARTON-2 ?CARTON2 ?TRUCK3 )
		( P-ACTIVITY-2-UNLOAD-CARTON ?AGENT0 ?CARTON2 ?TRUCK3 )
	)
)
( :ACTION DO-ACTIVITY-2-UNLOAD-CARTON-2
  :PARAMETERS ( ?AGENT0 - AGENT ?CARTON2 - CARTON ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-2-UNLOAD-CARTON-2 ?CARTON2 ?TRUCK3 )
		( ACTIVE-V3 ?CARTON2 ?TRUCK3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V3 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( NEG-LOADED-CARTON ?CARTON2 ?TRUCK3 )
		( CARTON-AT ?CARTON2 ?LOCATION4 )
		( TIRED ?AGENT0 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-UNLOAD-CARTON-2 ?CARTON2 ?TRUCK3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V3 ?AGENT-COUNT5 ) )
		( COUNT-V3 ?AGENT-COUNT6 )
	)
)
( :ACTION END-V3
  :PARAMETERS ( ?CARTON0 - CARTON ?TRUCK1 - TRUCK ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V3 ?AGENT-COUNT2 )
		( SAT-V3 ?AGENT-COUNT2 )
		( ACTIVE-V3 ?CARTON0 ?TRUCK1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V3 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V3 ?CARTON0 ?TRUCK1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ACTIVITY-2-UNLOAD-CARTON ?AGENT3 ?CARTON0 ?TRUCK1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-LOADED-CARTON ?CARTON0 ?TRUCK1 )
				( AND
					( NOT ( LOADED-CARTON ?CARTON0 ?TRUCK1 ) )
					( NOT ( NEG-LOADED-CARTON ?CARTON0 ?TRUCK1 ) )
				)
			)
		)
	)
)
( :ACTION START-V4
  :PARAMETERS ( ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V4 ?TRUCK0 ?LOCATION1 ?LOCATION2 )
		( COUNT-V4 ACOUNT-0 )
	)
)
( :ACTION DO-DRIVE-TRUCK
  :PARAMETERS ( ?AGENT0 - AGENT ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( TIRED ?AGENT0 ) )
		( AGENT-AT ?AGENT0 ?LOCATION2 )
		( TRUCK-AT ?TRUCK1 ?LOCATION2 )
		( CONNECTED ?LOCATION2 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V4 ?TRUCK1 ?LOCATION2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V4 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( NEG-TRUCK-AT ?TRUCK1 ?LOCATION2 )
		( POS-TRUCK-AT ?TRUCK1 ?LOCATION3 )
		( NOT ( AGENT-AT ?AGENT0 ?LOCATION2 ) )
		( AGENT-AT ?AGENT0 ?LOCATION3 )
		( TIRED ?AGENT0 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V4 ?AGENT-COUNT4 ) )
		( COUNT-V4 ?AGENT-COUNT5 )
		( P-DRIVE-TRUCK ?AGENT0 ?TRUCK1 ?LOCATION2 ?LOCATION3 )
	)
)
( :ACTION END-V4
  :PARAMETERS ( ?TRUCK0 - TRUCK ?LOCATION1 - LOCATION ?LOCATION2 - LOCATION ?AGENT-COUNT3 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V4 ?AGENT-COUNT3 )
		( SAT-V4 ?AGENT-COUNT3 )
		( ACTIVE-V4 ?TRUCK0 ?LOCATION1 ?LOCATION2 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V4 ?AGENT-COUNT3 ) )
		( AFREE )
		( NOT ( ACTIVE-V4 ?TRUCK0 ?LOCATION1 ?LOCATION2 ) )
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-DRIVE-TRUCK ?AGENT4 ?TRUCK0 ?LOCATION1 ?LOCATION2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( TAKEN ?AGENT4 ) )
		)
		( FORALL
			( ?LOCATION4 - LOCATION )
			( AND
				( WHEN
					( POS-TRUCK-AT ?TRUCK0 ?LOCATION4 )
					( AND
						( TRUCK-AT ?TRUCK0 ?LOCATION4 )
						( NOT ( POS-TRUCK-AT ?TRUCK0 ?LOCATION4 ) )
					)
				)
				( WHEN
					( NEG-TRUCK-AT ?TRUCK0 ?LOCATION4 )
					( AND
						( NOT ( TRUCK-AT ?TRUCK0 ?LOCATION4 ) )
						( NOT ( NEG-TRUCK-AT ?TRUCK0 ?LOCATION4 ) )
					)
				)
			)
		)
	)
)
( :ACTION START-V5
  :PARAMETERS ( ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V5 ?FURNITURE0 ?TRUCK1 ?LOCATION2 )
		( COUNT-V5 ACOUNT-0 )
	)
)
( :ACTION DO-LOAD-FURNITURE
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION3 )
		( FURNITURE-AT ?FURNITURE1 ?LOCATION3 )
		( TRUCK-AT ?TRUCK2 ?LOCATION3 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V5 ?FURNITURE1 ?TRUCK2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( FORALL
			( ?AGENT6 - AGENT )
			( AND
				( NOT ( P-LOAD-FURNITURE ?AGENT6 ?FURNITURE1 ?TRUCK2 ?LOCATION3 ) )
			)
		)		
	)
  :EFFECT
	( AND
		( TIRED ?AGENT0 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT4 ) )
		( COUNT-V5 ?AGENT-COUNT5 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE1 ?TRUCK2 ?LOCATION3 )
	)
)
( :ACTION DO-ACTIVITY-2-LOAD-FURNITURE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE2 - FURNITURE ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V5 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
		( FORALL
			( ?AGENT7 - AGENT )
			( AND
				( NOT ( P-LOAD-FURNITURE ?AGENT7 ?FURNITURE2 ?TRUCK3 ?LOCATION4 ) )
			)
		)
	)
  :EFFECT
	( AND
		( LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( NEG-FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT5 ) )
		( COUNT-V5 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-LOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
		( P-ACTIVITY-2-LOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
	)
)
( :ACTION DO-ACTIVITY-2-LOAD-FURNITURE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE2 - FURNITURE ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-2-LOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
		( ACTIVE-V5 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( NEG-FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-LOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 ?LOCATION4 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT5 ) )
		( COUNT-V5 ?AGENT-COUNT6 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 ?LOCATION4 )
	)
)
( :ACTION DO-ACTIVITY-3-LOAD-FURNITURE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V5 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
		( FORALL
			( ?AGENT8 - AGENT )
			( AND
				( NOT ( P-LOAD-FURNITURE ?AGENT8 ?FURNITURE3 ?TRUCK4 ?LOCATION5 ) )
			)
		)
	)
  :EFFECT
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( NEG-FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT6 ) )
		( COUNT-V5 ?AGENT-COUNT7 )
		( IN-JOINT )
		( NEXT-ACTIVITY-3-LOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( P-ACTIVITY-3-LOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
	)
)
( :ACTION DO-ACTIVITY-3-LOAD-FURNITURE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( ACTIVE-V5 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
		( NEXT-ACTIVITY-3-LOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
	)
  :EFFECT
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( NEG-FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT6 ) )
		( COUNT-V5 ?AGENT-COUNT7 )
		( NOT ( NEXT-ACTIVITY-3-LOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 ?LOCATION5 ) )
		( NEXT-ACTIVITY-3-LOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
	)
)
( :ACTION DO-ACTIVITY-3-LOAD-FURNITURE-3
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-3-LOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( ACTIVE-V5 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V5 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
	)
  :EFFECT
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( NEG-FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-3-LOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 ?LOCATION5 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V5 ?AGENT-COUNT6 ) )
		( COUNT-V5 ?AGENT-COUNT7 )
		( P-LOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 ?LOCATION5 )
	)
)
( :ACTION END-V5
  :PARAMETERS ( ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?LOCATION2 - LOCATION ?AGENT-COUNT3 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V5 ?AGENT-COUNT3 )
		( SAT-V5 ?AGENT-COUNT3 )
		( ACTIVE-V5 ?FURNITURE0 ?TRUCK1 ?LOCATION2 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V5 ?AGENT-COUNT3 ) )
		( AFREE )
		( NOT ( ACTIVE-V5 ?FURNITURE0 ?TRUCK1 ?LOCATION2 ) )
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-LOAD-FURNITURE ?AGENT4 ?FURNITURE0 ?TRUCK1 ?LOCATION2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-ACTIVITY-2-LOAD-FURNITURE ?AGENT4 ?FURNITURE0 ?TRUCK1 ?LOCATION2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( P-ACTIVITY-3-LOAD-FURNITURE ?AGENT4 ?FURNITURE0 ?TRUCK1 ?LOCATION2 ) )
		)
		( FORALL
			( ?AGENT4 - AGENT )
			( NOT ( TAKEN ?AGENT4 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-FURNITURE-AT ?FURNITURE0 ?LOCATION2 )
				( AND
					( NOT ( FURNITURE-AT ?FURNITURE0 ?LOCATION2 ) )
					( NOT ( NEG-FURNITURE-AT ?FURNITURE0 ?LOCATION2 ) )
				)
			)
		)
	)
)
( :ACTION START-V6
  :PARAMETERS ( ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V6 ?FURNITURE0 ?TRUCK1 )
		( COUNT-V6 ACOUNT-0 )
	)
)
( :ACTION DO-UNLOAD-FURNITURE
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE1 - FURNITURE ?TRUCK2 - TRUCK ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE1 ?TRUCK2 )
		( AGENT-AT ?AGENT0 ?LOCATION3 )
		( TRUCK-AT ?TRUCK2 ?LOCATION3 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V6 ?FURNITURE1 ?TRUCK2 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
		( FORALL
			( ?AGENT6 - AGENT )
			( AND
				( NOT ( P-UNLOAD-FURNITURE ?AGENT6 ?FURNITURE1 ?TRUCK2 ) )
			)
		)
	)
  :EFFECT
	( AND
		( TIRED ?AGENT0 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT4 ) )
		( COUNT-V6 ?AGENT-COUNT5 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE1 ?TRUCK2 )
	)
)
( :ACTION DO-ACTIVITY-2-UNLOAD-FURNITURE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE2 - FURNITURE ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V6 ?FURNITURE2 ?TRUCK3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
		( FORALL
			( ?AGENT7 - AGENT )
			( AND
				( NOT ( P-UNLOAD-FURNITURE ?AGENT7 ?FURNITURE2 ?TRUCK3 ) )
			)
		)
	)
  :EFFECT
	( AND
		( FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( NEG-LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT5 ) )
		( COUNT-V6 ?AGENT-COUNT6 )
		( IN-JOINT )
		( NEXT-ACTIVITY-2-UNLOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 )
		( P-ACTIVITY-2-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 )
	)
)
( :ACTION DO-ACTIVITY-2-UNLOAD-FURNITURE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE2 - FURNITURE ?TRUCK3 - TRUCK ?LOCATION4 - LOCATION ?AGENT-COUNT5 - AGENT-COUNT ?AGENT-COUNT6 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( AGENT-AT ?AGENT0 ?LOCATION4 )
		( TRUCK-AT ?TRUCK3 ?LOCATION4 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-2-UNLOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 )
		( ACTIVE-V6 ?FURNITURE2 ?TRUCK3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT5 )
		( CONSEC ?AGENT-COUNT5 ?AGENT-COUNT6 )
	)
  :EFFECT
	( AND
		( FURNITURE-AT ?FURNITURE2 ?LOCATION4 )
		( NEG-LOADED-FURNITURE ?FURNITURE2 ?TRUCK3 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-2-UNLOAD-FURNITURE-2 ?FURNITURE2 ?TRUCK3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT5 ) )
		( COUNT-V6 ?AGENT-COUNT6 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE2 ?TRUCK3 )
	)
)
( :ACTION DO-ACTIVITY-3-UNLOAD-FURNITURE-1
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V6 ?FURNITURE3 ?TRUCK4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
		( FORALL
			( ?AGENT8 - AGENT )
			( AND
				( NOT ( P-UNLOAD-FURNITURE ?AGENT8 ?FURNITURE3 ?TRUCK4 ) )
			)
		)
	)
  :EFFECT
	( AND
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( NEG-LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT6 ) )
		( COUNT-V6 ?AGENT-COUNT7 )
		( IN-JOINT )
		( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 )
		( P-ACTIVITY-3-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 )
	)
)
( :ACTION DO-ACTIVITY-3-UNLOAD-FURNITURE-2
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( ACTIVE-V6 ?FURNITURE3 ?TRUCK4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
		( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 )
	)
  :EFFECT
	( AND
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( NEG-LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT6 ) )
		( COUNT-V6 ?AGENT-COUNT7 )
		( NOT ( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-2 ?FURNITURE3 ?TRUCK4 ) )
		( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 )
	)
)
( :ACTION DO-ACTIVITY-3-UNLOAD-FURNITURE-3
  :PARAMETERS ( ?AGENT0 - AGENT ?FURNITURE3 - FURNITURE ?TRUCK4 - TRUCK ?LOCATION5 - LOCATION ?AGENT-COUNT6 - AGENT-COUNT ?AGENT-COUNT7 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( AGENT-AT ?AGENT0 ?LOCATION5 )
		( TRUCK-AT ?TRUCK4 ?LOCATION5 )
		( NOT ( TIRED ?AGENT0 ) )
		( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 )
		( ACTIVE-V6 ?FURNITURE3 ?TRUCK4 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V6 ?AGENT-COUNT6 )
		( CONSEC ?AGENT-COUNT6 ?AGENT-COUNT7 )
	)
  :EFFECT
	( AND
		( FURNITURE-AT ?FURNITURE3 ?LOCATION5 )
		( NEG-LOADED-FURNITURE ?FURNITURE3 ?TRUCK4 )
		( NOT ( IN-JOINT ) )
		( NOT ( NEXT-ACTIVITY-3-UNLOAD-FURNITURE-3 ?FURNITURE3 ?TRUCK4 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V6 ?AGENT-COUNT6 ) )
		( COUNT-V6 ?AGENT-COUNT7 )
		( P-UNLOAD-FURNITURE ?AGENT0 ?FURNITURE3 ?TRUCK4 )
	)
)
( :ACTION END-V6
  :PARAMETERS ( ?FURNITURE0 - FURNITURE ?TRUCK1 - TRUCK ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V6 ?AGENT-COUNT2 )
		( SAT-V6 ?AGENT-COUNT2 )
		( ACTIVE-V6 ?FURNITURE0 ?TRUCK1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V6 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V6 ?FURNITURE0 ?TRUCK1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-UNLOAD-FURNITURE ?AGENT3 ?FURNITURE0 ?TRUCK1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ACTIVITY-2-UNLOAD-FURNITURE ?AGENT3 ?FURNITURE0 ?TRUCK1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-ACTIVITY-3-UNLOAD-FURNITURE ?AGENT3 ?FURNITURE0 ?TRUCK1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-LOADED-FURNITURE ?FURNITURE0 ?TRUCK1 )
				( AND
					( NOT ( LOADED-FURNITURE ?FURNITURE0 ?TRUCK1 ) )
					( NOT ( NEG-LOADED-FURNITURE ?FURNITURE0 ?TRUCK1 ) )
				)
			)
		)
	)
)
( :ACTION START-V7
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V7 ?CARTON0 ?LOCATION1 )
		( COUNT-V7 ACOUNT-0 )
	)
)
( :ACTION DO-PACK-APPLIANCE
  :PARAMETERS ( ?AGENT0 - AGENT ?ELECTRONICS1 - ELECTRONICS ?CARTON2 - CARTON ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( ELECTRONICS-AT ?ELECTRONICS1 ?LOCATION3 )
		( AGENT-AT ?AGENT0 ?LOCATION3 )
		( CARTON-AT ?CARTON2 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V7 ?CARTON2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V7 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( ELECTRONICS-IN ?ELECTRONICS1 ?CARTON2 )
		( PACKED ?CARTON2 )
		( NOT ( ELECTRONICS-AT ?ELECTRONICS1 ?LOCATION3 ) )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V7 ?AGENT-COUNT4 ) )
		( COUNT-V7 ?AGENT-COUNT5 )
		( P-PACK-APPLIANCE ?AGENT0 ?CARTON2 ?LOCATION3 )
	)
)
( :ACTION END-V7
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V7 ?AGENT-COUNT2 )
		( SAT-V7 ?AGENT-COUNT2 )
		( ACTIVE-V7 ?CARTON0 ?LOCATION1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V7 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V7 ?CARTON0 ?LOCATION1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-PACK-APPLIANCE ?AGENT3 ?CARTON0 ?LOCATION1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
	)
)
( :ACTION START-V8
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION )
  :PRECONDITION
	( AND
		( AFREE )
	)
  :EFFECT
	( AND
		( NOT ( AFREE ) )
		( ACTIVE-V8 ?CARTON0 ?LOCATION1 )
		( COUNT-V8 ACOUNT-0 )
	)
)
( :ACTION DO-UNPACK-APPLIANCE
  :PARAMETERS ( ?AGENT0 - AGENT ?ELECTRONICS1 - ELECTRONICS ?CARTON2 - CARTON ?LOCATION3 - LOCATION ?AGENT-COUNT4 - AGENT-COUNT ?AGENT-COUNT5 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( PACKED ?CARTON2 )
		( CARTON-AT ?CARTON2 ?LOCATION3 )
		( ELECTRONICS-IN ?ELECTRONICS1 ?CARTON2 )
		( AGENT-AT ?AGENT0 ?LOCATION3 )
		( NOT ( IN-JOINT ) )
		( ACTIVE-V8 ?CARTON2 ?LOCATION3 )
		( NOT ( TAKEN ?AGENT0 ) )
		( COUNT-V8 ?AGENT-COUNT4 )
		( CONSEC ?AGENT-COUNT4 ?AGENT-COUNT5 )
	)
  :EFFECT
	( AND
		( ELECTRONICS-AT ?ELECTRONICS1 ?LOCATION3 )
		( NOT ( ELECTRONICS-IN ?ELECTRONICS1 ?CARTON2 ) )
		( NEG-PACKED ?CARTON2 )
		( TAKEN ?AGENT0 )
		( NOT ( COUNT-V8 ?AGENT-COUNT4 ) )
		( COUNT-V8 ?AGENT-COUNT5 )
		( P-UNPACK-APPLIANCE ?AGENT0 ?CARTON2 ?LOCATION3 )
	)
)
( :ACTION END-V8
  :PARAMETERS ( ?CARTON0 - CARTON ?LOCATION1 - LOCATION ?AGENT-COUNT2 - AGENT-COUNT )
  :PRECONDITION
	( AND
		( NOT ( IN-JOINT ) )
		( COUNT-V8 ?AGENT-COUNT2 )
		( SAT-V8 ?AGENT-COUNT2 )
		( ACTIVE-V8 ?CARTON0 ?LOCATION1 )
	)
  :EFFECT
	( AND
		( NOT ( COUNT-V8 ?AGENT-COUNT2 ) )
		( AFREE )
		( NOT ( ACTIVE-V8 ?CARTON0 ?LOCATION1 ) )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( P-UNPACK-APPLIANCE ?AGENT3 ?CARTON0 ?LOCATION1 ) )
		)
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TAKEN ?AGENT3 ) )
		)
		( FORALL
			( )
			( WHEN
				( NEG-PACKED ?CARTON0 )
				( AND
					( NOT ( PACKED ?CARTON0 ) )
					( NOT ( NEG-PACKED ?CARTON0 ) )
				)
			)
		)
	)
)
)

;Domain compilation time is: 0.005268

