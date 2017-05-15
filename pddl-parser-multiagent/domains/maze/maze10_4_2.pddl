(define (problem maze10_4_2) (:domain maze)
(:objects
	a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 - agent
	loc1x1 loc1x2 loc1x3 loc1x4 loc2x1 loc2x2 loc2x3 loc2x4 loc3x1 loc3x2 loc3x3 loc3x4 loc4x1 loc4x2 loc4x3 loc4x4 - location
	d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 - door
	b1 b2 b3 - bridge
	bt1 bt2 bt3 - boat
	s1 s2 - switch
)
(:init
	(at a1 loc2x4)
	(at a2 loc4x3)
	(at a3 loc1x2)
	(at a4 loc4x3)
	(at a5 loc2x4)
	(at a6 loc3x3)
	(at a7 loc4x1)
	(at a8 loc3x4)
	(at a9 loc2x3)
	(at a10 loc4x4)
	(has-door d1 loc1x1 loc1x2)
	(has-door d1 loc1x2 loc1x1)
	(has-door d2 loc1x1 loc2x1)
	(has-door d2 loc2x1 loc1x1)
	(has-door d3 loc1x2 loc1x3)
	(has-door d3 loc1x3 loc1x2)
	(has-bridge b1 loc1x2 loc2x2)
	(has-bridge b1 loc2x2 loc1x2)
	(has-door d4 loc1x3 loc1x4)
	(has-door d4 loc1x4 loc1x3)
	(blocked loc1x3 loc1x4)
	(blocked loc1x4 loc1x3)
	(has-switch s1 loc3x1 loc1x3 loc1x4)
	(has-door d5 loc1x3 loc2x3)
	(has-door d5 loc2x3 loc1x3)
	(has-boat bt1 loc1x4 loc2x4)
	(has-boat bt1 loc2x4 loc1x4)
	(has-bridge b2 loc2x1 loc2x2)
	(has-bridge b2 loc2x2 loc2x1)
	(has-door d6 loc2x1 loc3x1)
	(has-door d6 loc3x1 loc2x1)
	(has-bridge b3 loc2x2 loc2x3)
	(has-bridge b3 loc2x3 loc2x2)
	(has-door d7 loc2x2 loc3x2)
	(has-door d7 loc3x2 loc2x2)
	(has-boat bt2 loc2x3 loc2x4)
	(has-boat bt2 loc2x4 loc2x3)
	(has-door d8 loc2x3 loc3x3)
	(has-door d8 loc3x3 loc2x3)
	(blocked loc2x3 loc3x3)
	(blocked loc3x3 loc2x3)
	(has-switch s2 loc4x1 loc2x3 loc3x3)
	(has-door d9 loc2x4 loc3x4)
	(has-door d9 loc3x4 loc2x4)
	(has-boat bt3 loc3x1 loc3x2)
	(has-boat bt3 loc3x2 loc3x1)
	(has-door d10 loc3x1 loc4x1)
	(has-door d10 loc4x1 loc3x1)
	(has-door d11 loc3x2 loc3x3)
	(has-door d11 loc3x3 loc3x2)
	(has-door d12 loc3x2 loc4x2)
	(has-door d12 loc4x2 loc3x2)
	(has-door d13 loc3x3 loc3x4)
	(has-door d13 loc3x4 loc3x3)
	(has-door d14 loc3x3 loc4x3)
	(has-door d14 loc4x3 loc3x3)
	(has-door d15 loc3x4 loc4x4)
	(has-door d15 loc4x4 loc3x4)
	(has-door d16 loc4x1 loc4x2)
	(has-door d16 loc4x2 loc4x1)
	(has-door d17 loc4x2 loc4x3)
	(has-door d17 loc4x3 loc4x2)
	(has-door d18 loc4x3 loc4x4)
	(has-door d18 loc4x4 loc4x3)
)
(:goal (and
	(at a1 loc3x3)
	(at a2 loc4x1)
	(at a3 loc1x1)
	(at a4 loc3x4)
	(at a5 loc3x4)
	(at a6 loc1x3)
	(at a7 loc4x4)
	(at a8 loc4x1)
	(at a9 loc2x1)
	(at a10 loc4x1)
))
)
