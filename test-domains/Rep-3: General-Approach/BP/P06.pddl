;
(define (problem push-box-1_1) (:domain boxpushing)
;
(:objects	
	a1 a2 a3 a4 a5 a6 a7 - agent
	box1 box2 box3 box4 box5 box6 box7 box8 box9 - box
	loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 - location
)
;
(:init
	(agent-at-loc a1 loc2)
	(agent-at-loc a2 loc2)
	(agent-at-loc a3 loc2)
	(agent-at-loc a4 loc2)
	(agent-at-loc a5 loc5)
	(agent-at-loc a6 loc5)
	(agent-at-loc a7 loc5)
	
	(box-at-loc box1 loc1)
	(box-at-loc box2 loc1)
	(box-at-loc box3 loc1)
	(box-at-loc box4 loc6)
	(box-at-loc box5 loc6)
	(box-at-loc box6 loc6)
	(box-at-loc box7 loc1)
	(box-at-loc box8 loc1)
	(box-at-loc box9 loc1)
	(connected loc1 loc2)
	(connected loc2 loc1)
	(connected loc3 loc2)
	(connected loc2 loc3)
	(connected loc4 loc3)
	(connected loc3 loc4)
	(connected loc4 loc5)
	(connected loc5 loc4)
	(connected loc6 loc5)
	(connected loc5 loc6)
	(connected loc6 loc7)
	(connected loc7 loc6)
	(connected loc7 loc8)
	(connected loc8 loc7)
	(connected loc9 loc8)
	(connected loc8 loc9)
)
;
(:goal 
	(and
		(box-at-loc box1 loc6)
		(box-at-loc box2 loc6)
		(box-at-loc box3 loc6)
		(box-at-loc box4 loc1)
		(box-at-loc box5 loc1)
		(box-at-loc box6 loc1)  
		(box-at-loc box7 loc8)
		(box-at-loc box8 loc8)
		(box-at-loc box9 loc8)
	)
)
;
)
