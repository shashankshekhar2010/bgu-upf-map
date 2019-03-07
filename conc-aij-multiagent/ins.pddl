( DEFINE ( PROBLEM MAZE5_4_1 )
( :DOMAIN MAZE )
( :OBJECTS
	A1 A2 A3 A4 A5 A6 - AGENT
	LOC1X1 LOC1X2 LOC1X3 LOC1X4 LOC2X1 LOC2X2 LOC2X3 LOC2X4 LOC3X1 LOC3X2 LOC3X3 LOC3X4 LOC4X1 LOC4X2 LOC4X3 LOC4X4 - LOCATION
	D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 - DOOR
	B1 B2 - BRIDGE
	BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8 BT9 BT10 - BOAT
	S1 S2 S3 S4 S5 S6 S7 S8 S9 - SWITCH
)
( :INIT
	( AT A1 LOC1X2 )
	( AT A2 LOC1X2 )
	( AT A3 LOC1X2 )
	( AT A4 LOC4X1 )
	( AT A5 LOC2X4 )
	( AT A6 LOC1X2 )
	( HAS-BOAT BT1 LOC1X1 LOC1X2 )
	( HAS-BOAT BT1 LOC1X2 LOC1X1 )
	( HAS-DOOR D1 LOC1X1 LOC2X1 )
	( HAS-DOOR D1 LOC2X1 LOC1X1 )
	( BLOCKED LOC1X1 LOC2X1 )
	( BLOCKED LOC2X1 LOC1X1 )
	( HAS-SWITCH S1 LOC4X3 LOC1X1 LOC2X1 )
	( HAS-DOOR D2 LOC1X2 LOC1X3 )
	( HAS-DOOR D2 LOC1X3 LOC1X2 )
	( BLOCKED LOC1X2 LOC1X3 )
	( BLOCKED LOC1X3 LOC1X2 )
	( HAS-SWITCH S2 LOC1X2 LOC1X2 LOC1X3 )
	( HAS-DOOR D3 LOC1X2 LOC2X2 )
	( HAS-DOOR D3 LOC2X2 LOC1X2 )
	( BLOCKED LOC1X2 LOC2X2 )
	( BLOCKED LOC2X2 LOC1X2 )
	( HAS-SWITCH S3 LOC4X3 LOC1X2 LOC2X2 )
	( HAS-BOAT BT2 LOC1X3 LOC1X4 )
	( HAS-BOAT BT2 LOC1X4 LOC1X3 )
	( HAS-BOAT BT3 LOC1X3 LOC2X3 )
	( HAS-BOAT BT3 LOC2X3 LOC1X3 )
	( HAS-DOOR D4 LOC1X4 LOC2X4 )
	( HAS-DOOR D4 LOC2X4 LOC1X4 )
	( HAS-DOOR D5 LOC2X1 LOC2X2 )
	( HAS-DOOR D5 LOC2X2 LOC2X1 )
	( BLOCKED LOC2X1 LOC2X2 )
	( BLOCKED LOC2X2 LOC2X1 )
	( HAS-SWITCH S4 LOC2X4 LOC2X1 LOC2X2 )
	( HAS-BOAT BT4 LOC2X1 LOC3X1 )
	( HAS-BOAT BT4 LOC3X1 LOC2X1 )
	( HAS-DOOR D6 LOC2X2 LOC2X3 )
	( HAS-DOOR D6 LOC2X3 LOC2X2 )
	( HAS-BRIDGE B1 LOC2X2 LOC3X2 )
	( HAS-BRIDGE B1 LOC3X2 LOC2X2 )
	( HAS-BOAT BT5 LOC2X3 LOC2X4 )
	( HAS-BOAT BT5 LOC2X4 LOC2X3 )
	( HAS-DOOR D7 LOC2X3 LOC3X3 )
	( HAS-DOOR D7 LOC3X3 LOC2X3 )
	( BLOCKED LOC2X3 LOC3X3 )
	( BLOCKED LOC3X3 LOC2X3 )
	( HAS-SWITCH S5 LOC3X3 LOC2X3 LOC3X3 )
	( HAS-BOAT BT6 LOC2X4 LOC3X4 )
	( HAS-BOAT BT6 LOC3X4 LOC2X4 )
	( HAS-DOOR D8 LOC3X1 LOC3X2 )
	( HAS-DOOR D8 LOC3X2 LOC3X1 )
	( BLOCKED LOC3X1 LOC3X2 )
	( BLOCKED LOC3X2 LOC3X1 )
	( HAS-SWITCH S6 LOC4X1 LOC3X1 LOC3X2 )
	( HAS-DOOR D9 LOC3X1 LOC4X1 )
	( HAS-DOOR D9 LOC4X1 LOC3X1 )
	( HAS-BOAT BT7 LOC3X2 LOC3X3 )
	( HAS-BOAT BT7 LOC3X3 LOC3X2 )
	( HAS-BRIDGE B2 LOC3X2 LOC4X2 )
	( HAS-BRIDGE B2 LOC4X2 LOC3X2 )
	( HAS-BOAT BT8 LOC3X3 LOC3X4 )
	( HAS-BOAT BT8 LOC3X4 LOC3X3 )
	( HAS-BOAT BT9 LOC3X3 LOC4X3 )
	( HAS-BOAT BT9 LOC4X3 LOC3X3 )
	( HAS-DOOR D10 LOC3X4 LOC4X4 )
	( HAS-DOOR D10 LOC4X4 LOC3X4 )
	( BLOCKED LOC3X4 LOC4X4 )
	( BLOCKED LOC4X4 LOC3X4 )
	( HAS-SWITCH S7 LOC3X4 LOC3X4 LOC4X4 )
	( HAS-DOOR D11 LOC4X1 LOC4X2 )
	( HAS-DOOR D11 LOC4X2 LOC4X1 )
	( BLOCKED LOC4X1 LOC4X2 )
	( BLOCKED LOC4X2 LOC4X1 )
	( HAS-SWITCH S8 LOC2X3 LOC4X1 LOC4X2 )
	( HAS-BOAT BT10 LOC4X2 LOC4X3 )
	( HAS-BOAT BT10 LOC4X3 LOC4X2 )
	( HAS-DOOR D12 LOC4X3 LOC4X4 )
	( HAS-DOOR D12 LOC4X4 LOC4X3 )
	( BLOCKED LOC4X3 LOC4X4 )
	( BLOCKED LOC4X4 LOC4X3 )
	( HAS-SWITCH S9 LOC4X4 LOC4X3 LOC4X4 )
	( SAME-AGENT A1 A1 )
	( SAME-AGENT A2 A2 )
	( SAME-AGENT A3 A3 )
	( SAME-AGENT A4 A4 )
	( SAME-AGENT A5 A5 )
	( SAME-AGENT A6 A6 )
	( NEG-IN-JOINT )
)
( :GOAL
	( AND
		( AT A1 LOC3X1 )
		( AT A2 LOC4X1 )
		( AT A3 LOC3X3 )
		( AT A4 LOC4X1 )
		( AT A5 LOC1X1 )
		( AT A6 LOC4X4 )
		( NEG-IN-JOINT )
	)
)
)
