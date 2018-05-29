;
;;	Apartmentmovers Domain
;
(define (problem apartmentmovers1_1) (:domain apartmentmovers)
;
(:objects
	a1 a2 a3 a4 - agent
	loc1 loc2 loc3 loc4 loc5 - location
	table1 sofa1 bed1 table2 sofa2 bed2 table3 sofa3 bed3 - furniture
	TV1 fridge1 AC1 TV2 fridge2 AC2 TV3 fridge3 AC3 - electronics
	tr1 tr2 - truck
	carton1 - carton
	carton2 - carton		  
	carton3 - carton
)
;
(:init
	(agent-at a1 loc1)
	(agent-at a2 loc1)
	(agent-at a3 loc1)
	(agent-at a4 loc1)
	(can-walk a1)
	(can-walk a2)
	(can-walk a3)
	(can-walk a4)
	
	(truck-at tr1 loc1)
	(truck-at tr2 loc5)		
	
	(furniture-at sofa1 loc1)
	(furniture-at table1 loc1)
	(furniture-at bed1 loc1)	
	(electronics-at TV1 loc1)
	(electronics-at fridge1 loc1)
	(electronics-at AC1 loc1)
	
	(furniture-at sofa2 loc3)
	(furniture-at table2 loc3)
	(furniture-at bed2 loc3)	
	(electronics-at TV2 loc3)
	(electronics-at fridge2 loc3)
	(electronics-at AC2 loc3)
	
	(furniture-at sofa3 loc2)
	(furniture-at table3 loc2)
	(furniture-at bed3 loc2)
	(electronics-at TV3 loc2)
	(electronics-at fridge3 loc2)
	(electronics-at AC3 loc2)	
	
	(connected loc1 loc3 )
	(connected loc3 loc1 )
	(connected loc3 loc2 )
	(connected loc2 loc3 )
	(connected loc2 loc4 )
	(connected loc4 loc2 )
	(connected loc4 loc5 )
	(connected loc5 loc4 )
	
	(carton-at carton1 loc1)	
	(carton-at carton2 loc3)
	(carton-at carton3 loc2)
)
;
(:goal 
	(and
		(furniture-at sofa1 loc4)
		(furniture-at table1 loc4)
		(furniture-at bed1 loc4)	
		(electronics-at TV1 loc4)
		(electronics-at fridge1 loc4)
		(electronics-at AC1 loc4)
	
		(furniture-at sofa2 loc4)
		(furniture-at table2 loc4)
		(furniture-at bed2 loc4)	
		(electronics-at TV2 loc4)
		(electronics-at fridge2 loc4)
		(electronics-at AC2 loc4)
		
		(furniture-at sofa3 loc5)
		(furniture-at table3 loc5)
		(furniture-at bed3 loc5)
		(electronics-at TV3 loc5)
		(electronics-at fridge3 loc5)
		(electronics-at AC3 loc5)		
 	)
)
;
)
