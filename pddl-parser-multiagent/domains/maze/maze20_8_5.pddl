(define (problem maze20_8_5) (:domain maze)
(:objects
	a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 - agent
	loc1x1 loc1x2 loc1x3 loc1x4 loc1x5 loc1x6 loc1x7 loc1x8 loc2x1 loc2x2 loc2x3 loc2x4 loc2x5 loc2x6 loc2x7 loc2x8 loc3x1 loc3x2 loc3x3 loc3x4 loc3x5 loc3x6 loc3x7 loc3x8 loc4x1 loc4x2 loc4x3 loc4x4 loc4x5 loc4x6 loc4x7 loc4x8 loc5x1 loc5x2 loc5x3 loc5x4 loc5x5 loc5x6 loc5x7 loc5x8 loc6x1 loc6x2 loc6x3 loc6x4 loc6x5 loc6x6 loc6x7 loc6x8 loc7x1 loc7x2 loc7x3 loc7x4 loc7x5 loc7x6 loc7x7 loc7x8 loc8x1 loc8x2 loc8x3 loc8x4 loc8x5 loc8x6 loc8x7 loc8x8 - location
	d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 d49 d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 d74 d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 - door
	b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - bridge
	bt1 bt2 bt3 bt4 bt5 bt6 bt7 bt8 bt9 bt10 bt11 - boat
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - switch
)
(:init
	(at a1 loc3x6)
	(at a2 loc1x8)
	(at a3 loc3x7)
	(at a4 loc7x4)
	(at a5 loc4x7)
	(at a6 loc2x6)
	(at a7 loc2x5)
	(at a8 loc8x6)
	(at a9 loc5x6)
	(at a10 loc4x2)
	(at a11 loc5x7)
	(at a12 loc7x4)
	(at a13 loc1x3)
	(at a14 loc1x5)
	(at a15 loc5x3)
	(at a16 loc3x4)
	(at a17 loc2x5)
	(at a18 loc8x3)
	(at a19 loc6x1)
	(at a20 loc5x4)
	(has-door d1 loc1x1 loc1x2)
	(has-door d1 loc1x2 loc1x1)
	(has-door d2 loc1x1 loc2x1)
	(has-door d2 loc2x1 loc1x1)
	(has-door d3 loc1x2 loc1x3)
	(has-door d3 loc1x3 loc1x2)
	(blocked loc1x2 loc1x3)
	(blocked loc1x3 loc1x2)
	(has-switch s1 loc6x8 loc1x2 loc1x3)
	(has-door d4 loc1x2 loc2x2)
	(has-door d4 loc2x2 loc1x2)
	(has-door d5 loc1x3 loc1x4)
	(has-door d5 loc1x4 loc1x3)
	(has-boat bt1 loc1x3 loc2x3)
	(has-boat bt1 loc2x3 loc1x3)
	(has-boat bt2 loc1x4 loc1x5)
	(has-boat bt2 loc1x5 loc1x4)
	(has-door d6 loc1x4 loc2x4)
	(has-door d6 loc2x4 loc1x4)
	(has-door d7 loc1x5 loc1x6)
	(has-door d7 loc1x6 loc1x5)
	(blocked loc1x5 loc1x6)
	(blocked loc1x6 loc1x5)
	(has-switch s2 loc5x2 loc1x5 loc1x6)
	(has-door d8 loc1x5 loc2x5)
	(has-door d8 loc2x5 loc1x5)
	(has-door d9 loc1x6 loc1x7)
	(has-door d9 loc1x7 loc1x6)
	(has-door d10 loc1x6 loc2x6)
	(has-door d10 loc2x6 loc1x6)
	(has-door d11 loc1x7 loc1x8)
	(has-door d11 loc1x8 loc1x7)
	(has-door d12 loc1x7 loc2x7)
	(has-door d12 loc2x7 loc1x7)
	(has-door d13 loc1x8 loc2x8)
	(has-door d13 loc2x8 loc1x8)
	(has-door d14 loc2x1 loc2x2)
	(has-door d14 loc2x2 loc2x1)
	(has-boat bt3 loc2x1 loc3x1)
	(has-boat bt3 loc3x1 loc2x1)
	(has-door d15 loc2x2 loc2x3)
	(has-door d15 loc2x3 loc2x2)
	(has-door d16 loc2x2 loc3x2)
	(has-door d16 loc3x2 loc2x2)
	(has-bridge b1 loc2x3 loc2x4)
	(has-bridge b1 loc2x4 loc2x3)
	(has-door d17 loc2x3 loc3x3)
	(has-door d17 loc3x3 loc2x3)
	(has-door d18 loc2x4 loc2x5)
	(has-door d18 loc2x5 loc2x4)
	(has-door d19 loc2x4 loc3x4)
	(has-door d19 loc3x4 loc2x4)
	(has-door d20 loc2x5 loc2x6)
	(has-door d20 loc2x6 loc2x5)
	(has-door d21 loc2x5 loc3x5)
	(has-door d21 loc3x5 loc2x5)
	(has-boat bt4 loc2x6 loc2x7)
	(has-boat bt4 loc2x7 loc2x6)
	(has-door d22 loc2x6 loc3x6)
	(has-door d22 loc3x6 loc2x6)
	(has-door d23 loc2x7 loc2x8)
	(has-door d23 loc2x8 loc2x7)
	(has-door d24 loc2x7 loc3x7)
	(has-door d24 loc3x7 loc2x7)
	(blocked loc2x7 loc3x7)
	(blocked loc3x7 loc2x7)
	(has-switch s3 loc7x5 loc2x7 loc3x7)
	(has-door d25 loc2x8 loc3x8)
	(has-door d25 loc3x8 loc2x8)
	(has-door d26 loc3x1 loc3x2)
	(has-door d26 loc3x2 loc3x1)
	(has-bridge b2 loc3x1 loc4x1)
	(has-bridge b2 loc4x1 loc3x1)
	(has-door d27 loc3x2 loc3x3)
	(has-door d27 loc3x3 loc3x2)
	(has-door d28 loc3x2 loc4x2)
	(has-door d28 loc4x2 loc3x2)
	(has-door d29 loc3x3 loc3x4)
	(has-door d29 loc3x4 loc3x3)
	(blocked loc3x3 loc3x4)
	(blocked loc3x4 loc3x3)
	(has-switch s4 loc4x6 loc3x3 loc3x4)
	(has-door d30 loc3x3 loc4x3)
	(has-door d30 loc4x3 loc3x3)
	(has-door d31 loc3x4 loc3x5)
	(has-door d31 loc3x5 loc3x4)
	(blocked loc3x4 loc3x5)
	(blocked loc3x5 loc3x4)
	(has-switch s5 loc5x7 loc3x4 loc3x5)
	(has-door d32 loc3x4 loc4x4)
	(has-door d32 loc4x4 loc3x4)
	(has-door d33 loc3x5 loc3x6)
	(has-door d33 loc3x6 loc3x5)
	(has-bridge b3 loc3x5 loc4x5)
	(has-bridge b3 loc4x5 loc3x5)
	(has-door d34 loc3x6 loc3x7)
	(has-door d34 loc3x7 loc3x6)
	(has-door d35 loc3x6 loc4x6)
	(has-door d35 loc4x6 loc3x6)
	(has-bridge b4 loc3x7 loc3x8)
	(has-bridge b4 loc3x8 loc3x7)
	(has-door d36 loc3x7 loc4x7)
	(has-door d36 loc4x7 loc3x7)
	(has-boat bt5 loc3x8 loc4x8)
	(has-boat bt5 loc4x8 loc3x8)
	(has-door d37 loc4x1 loc4x2)
	(has-door d37 loc4x2 loc4x1)
	(has-boat bt6 loc4x1 loc5x1)
	(has-boat bt6 loc5x1 loc4x1)
	(has-door d38 loc4x2 loc4x3)
	(has-door d38 loc4x3 loc4x2)
	(has-door d39 loc4x2 loc5x2)
	(has-door d39 loc5x2 loc4x2)
	(blocked loc4x2 loc5x2)
	(blocked loc5x2 loc4x2)
	(has-switch s6 loc2x8 loc4x2 loc5x2)
	(has-door d40 loc4x3 loc4x4)
	(has-door d40 loc4x4 loc4x3)
	(has-bridge b5 loc4x3 loc5x3)
	(has-bridge b5 loc5x3 loc4x3)
	(has-door d41 loc4x4 loc4x5)
	(has-door d41 loc4x5 loc4x4)
	(has-door d42 loc4x4 loc5x4)
	(has-door d42 loc5x4 loc4x4)
	(has-door d43 loc4x5 loc4x6)
	(has-door d43 loc4x6 loc4x5)
	(has-door d44 loc4x5 loc5x5)
	(has-door d44 loc5x5 loc4x5)
	(has-boat bt7 loc4x6 loc4x7)
	(has-boat bt7 loc4x7 loc4x6)
	(has-door d45 loc4x6 loc5x6)
	(has-door d45 loc5x6 loc4x6)
	(has-door d46 loc4x7 loc4x8)
	(has-door d46 loc4x8 loc4x7)
	(has-door d47 loc4x7 loc5x7)
	(has-door d47 loc5x7 loc4x7)
	(has-door d48 loc4x8 loc5x8)
	(has-door d48 loc5x8 loc4x8)
	(has-door d49 loc5x1 loc5x2)
	(has-door d49 loc5x2 loc5x1)
	(has-door d50 loc5x1 loc6x1)
	(has-door d50 loc6x1 loc5x1)
	(has-door d51 loc5x2 loc5x3)
	(has-door d51 loc5x3 loc5x2)
	(has-door d52 loc5x2 loc6x2)
	(has-door d52 loc6x2 loc5x2)
	(has-door d53 loc5x3 loc5x4)
	(has-door d53 loc5x4 loc5x3)
	(has-boat bt8 loc5x3 loc6x3)
	(has-boat bt8 loc6x3 loc5x3)
	(has-door d54 loc5x4 loc5x5)
	(has-door d54 loc5x5 loc5x4)
	(has-door d55 loc5x4 loc6x4)
	(has-door d55 loc6x4 loc5x4)
	(has-bridge b6 loc5x5 loc5x6)
	(has-bridge b6 loc5x6 loc5x5)
	(has-bridge b7 loc5x5 loc6x5)
	(has-bridge b7 loc6x5 loc5x5)
	(has-door d56 loc5x6 loc5x7)
	(has-door d56 loc5x7 loc5x6)
	(has-door d57 loc5x6 loc6x6)
	(has-door d57 loc6x6 loc5x6)
	(has-door d58 loc5x7 loc5x8)
	(has-door d58 loc5x8 loc5x7)
	(has-door d59 loc5x7 loc6x7)
	(has-door d59 loc6x7 loc5x7)
	(has-door d60 loc5x8 loc6x8)
	(has-door d60 loc6x8 loc5x8)
	(has-door d61 loc6x1 loc6x2)
	(has-door d61 loc6x2 loc6x1)
	(has-bridge b8 loc6x1 loc7x1)
	(has-bridge b8 loc7x1 loc6x1)
	(has-door d62 loc6x2 loc6x3)
	(has-door d62 loc6x3 loc6x2)
	(has-door d63 loc6x2 loc7x2)
	(has-door d63 loc7x2 loc6x2)
	(has-door d64 loc6x3 loc6x4)
	(has-door d64 loc6x4 loc6x3)
	(has-door d65 loc6x3 loc7x3)
	(has-door d65 loc7x3 loc6x3)
	(has-door d66 loc6x4 loc6x5)
	(has-door d66 loc6x5 loc6x4)
	(has-door d67 loc6x4 loc7x4)
	(has-door d67 loc7x4 loc6x4)
	(has-boat bt9 loc6x5 loc6x6)
	(has-boat bt9 loc6x6 loc6x5)
	(has-door d68 loc6x5 loc7x5)
	(has-door d68 loc7x5 loc6x5)
	(has-door d69 loc6x6 loc6x7)
	(has-door d69 loc6x7 loc6x6)
	(has-boat bt10 loc6x6 loc7x6)
	(has-boat bt10 loc7x6 loc6x6)
	(has-door d70 loc6x7 loc6x8)
	(has-door d70 loc6x8 loc6x7)
	(has-door d71 loc6x7 loc7x7)
	(has-door d71 loc7x7 loc6x7)
	(has-door d72 loc6x8 loc7x8)
	(has-door d72 loc7x8 loc6x8)
	(has-door d73 loc7x1 loc7x2)
	(has-door d73 loc7x2 loc7x1)
	(blocked loc7x1 loc7x2)
	(blocked loc7x2 loc7x1)
	(has-switch s7 loc5x1 loc7x1 loc7x2)
	(has-door d74 loc7x1 loc8x1)
	(has-door d74 loc8x1 loc7x1)
	(has-boat bt11 loc7x2 loc7x3)
	(has-boat bt11 loc7x3 loc7x2)
	(has-door d75 loc7x2 loc8x2)
	(has-door d75 loc8x2 loc7x2)
	(blocked loc7x2 loc8x2)
	(blocked loc8x2 loc7x2)
	(has-switch s8 loc1x8 loc7x2 loc8x2)
	(has-door d76 loc7x3 loc7x4)
	(has-door d76 loc7x4 loc7x3)
	(has-door d77 loc7x3 loc8x3)
	(has-door d77 loc8x3 loc7x3)
	(has-door d78 loc7x4 loc7x5)
	(has-door d78 loc7x5 loc7x4)
	(has-bridge b9 loc7x4 loc8x4)
	(has-bridge b9 loc8x4 loc7x4)
	(has-door d79 loc7x5 loc7x6)
	(has-door d79 loc7x6 loc7x5)
	(has-door d80 loc7x5 loc8x5)
	(has-door d80 loc8x5 loc7x5)
	(has-bridge b10 loc7x6 loc7x7)
	(has-bridge b10 loc7x7 loc7x6)
	(has-door d81 loc7x6 loc8x6)
	(has-door d81 loc8x6 loc7x6)
	(blocked loc7x6 loc8x6)
	(blocked loc8x6 loc7x6)
	(has-switch s9 loc3x4 loc7x6 loc8x6)
	(has-door d82 loc7x7 loc7x8)
	(has-door d82 loc7x8 loc7x7)
	(has-door d83 loc7x7 loc8x7)
	(has-door d83 loc8x7 loc7x7)
	(has-door d84 loc7x8 loc8x8)
	(has-door d84 loc8x8 loc7x8)
	(blocked loc7x8 loc8x8)
	(blocked loc8x8 loc7x8)
	(has-switch s10 loc4x6 loc7x8 loc8x8)
	(has-door d85 loc8x1 loc8x2)
	(has-door d85 loc8x2 loc8x1)
	(has-door d86 loc8x2 loc8x3)
	(has-door d86 loc8x3 loc8x2)
	(has-door d87 loc8x3 loc8x4)
	(has-door d87 loc8x4 loc8x3)
	(has-door d88 loc8x4 loc8x5)
	(has-door d88 loc8x5 loc8x4)
	(blocked loc8x4 loc8x5)
	(blocked loc8x5 loc8x4)
	(has-switch s11 loc1x8 loc8x4 loc8x5)
	(has-door d89 loc8x5 loc8x6)
	(has-door d89 loc8x6 loc8x5)
	(has-door d90 loc8x6 loc8x7)
	(has-door d90 loc8x7 loc8x6)
	(has-door d91 loc8x7 loc8x8)
	(has-door d91 loc8x8 loc8x7)
)
(:goal (and
	(at a1 loc6x1)
	(at a2 loc5x5)
	(at a3 loc4x6)
	(at a4 loc4x4)
	(at a5 loc1x3)
	(at a6 loc6x4)
	(at a7 loc5x8)
	(at a8 loc1x1)
	(at a9 loc3x1)
	(at a10 loc1x2)
	(at a11 loc5x7)
	(at a12 loc1x5)
	(at a13 loc1x4)
	(at a14 loc6x3)
	(at a15 loc5x7)
	(at a16 loc3x8)
	(at a17 loc7x7)
	(at a18 loc5x1)
	(at a19 loc8x8)
	(at a20 loc4x2)
))
)
