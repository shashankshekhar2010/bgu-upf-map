( DEFINE ( PROBLEM TABLE1_1 )
( :DOMAIN TABLEMOVER )
( :OBJECTS
	A1 A2 - AGENT
	B1 - BLOCK
	T1 - TABLE
	R1X1 R1X2 - ROOM
	LEFT1 RIGHT1 - SIDE
)
( :INIT
	( ON-FLOOR B1 )
	( DOWN LEFT1 )
	( DOWN RIGHT1 )
	( CLEAR LEFT1 )
	( CLEAR RIGHT1 )
	( HAS-SIDE T1 LEFT1 )
	( HAS-SIDE T1 RIGHT1 )
	( INROOM A1 R1X1 )
	( INROOM A2 R1X1 )
	( INROOM B1 R1X1 )
	( INROOM T1 R1X1 )
	( AVAILABLE A1 )
	( AVAILABLE A2 )
	( HANDEMPTY A1 )
	( HANDEMPTY A2 )
	( CONNECTED R1X1 R1X2 )
)
( :GOAL
	( AND
		( ON-FLOOR B1 )
		( DOWN LEFT1 )
		( DOWN RIGHT1 )
		( INROOM B1 R1X2 )
	)
)
)
