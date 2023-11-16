(defrule p1
	(or ?p <- (start))
	=>
	(printout t crlf crlf "	   Welcome to ProgPulse Guide ! An Expert to Choose Best Matching Programming Languages" crlf)
	(printout t "		________________________________________________________________")
	(printout t crlf crlf "Hi, I'm thrilled to help you to find the perfect programming language/framework according to your project requirements and personal preference."
        crlf crlf "To guide you on this exciting adventure, I'll need a bit more info. Don't worry, it's just a friendly chat!"  
	crlf crlf "What type of projects are you interested in?" 
	crlf crlf "1. Web Development" 
        crlf "2. Data Science and Analysis"
        crlf "3. Mobile App Development"
        crlf "4. Game Development"
        crlf "5. Automation and Scripting"
	crlf "6. No Specific Area"
	crlf crlf "Enter Your Answer (1|2|3|4|5): ")
	(assert (projectType (read)))
	(retract ?p)
)

;-------------Asking about preference for specific area in  Web Development----------------

(defrule read-webDevArea
	(projectType 1) =>
	(printout t crlf "What is your preferred area in Web Development?"
        crlf crlf "1. Frontend Development"
        crlf "2. Backend Development"
        crlf "3. Full-stack Development"
	crlf crlf "Enter Your Answer (1|2|3): ")
	(assert (preferenceWD (read))))	

;-------------Asking about preferred area in  Data Science and Analysis----------------

(defrule read-preferenceDataManipulation
	(projectType 2)
	=>
	(printout t crlf "Are you interested in Data Manipulation and Analysis?"
        crlf crlf "1. Yes"
	crlf "2. No"
     	crlf crlf "Enter Your Answer (1|2): ")
	(assert (dataManipulation (read))))

(defrule read-preferenceDatabase
	(projectType 2)(dataManipulation 2)
	=>
	(printout t crlf "Are you interested in Database Management and Querying?"
	crlf crlf "1. Yes" 
	crlf "2. No"
        crlf crlf "Enter Your Answer (1|2): ")
	(assert (database (read))))

;-------------Asking about specific platforms in Mobile App Development----------------		

(defrule read-platformSpecific
	(projectType 3) =>
	(printout t crlf "Are you targetting any specific platform?"
        crlf crlf "1. Yes"
        crlf "2. No"
        crlf crlf "Enter Your Answer (1|2): ")
	(assert (platformSpecific (read))))	

(defrule read-platformName
	(projectType 3)(platformSpecific 1) =>
	(printout t crlf "What is the platform that you specially target ?"
        crlf crlf "1. iOS"
        crlf "2. Android"
        crlf crlf "Enter Your Answer (1|2): ")
	(assert (platformName (read))))	

;-------------Asking about preffered area in Game Development----------------	

(defrule read-gamingDevArea
	(projectType 4) =>
	(printout t crlf "What is your preffered area in Game Development?"
        crlf crlf "1. 2D Game Development"
        crlf "2. 3D Game Development"
	crlf "3. No preference"
        crlf crlf "Enter Your Answer (1|2|3): ")
	(assert (gamingDevArea (read))))

(defrule read-preferred3Dfeature
	(projectType 4)(gamingDevArea 2) =>
	(printout t crlf "What is the 3D game feature are you prioritizing?"
        crlf crlf "1. Character Animation"
        crlf "2. Environmental Design"
        crlf crlf "Enter Your Answer (1|2): ")
	(assert (preferred3DFeature (read))))

;-------------Asking about specifications in Automation & Scripting----------------

(defrule read-scriptingArea
	(projectType 5) =>
	(printout t crlf "Are you focused on General Purpose Scripting?"
        crlf crlf "1. Yes"
        crlf "2. No"
        crlf crlf "Enter Your Answer (1|2): ")
	(assert (scriptingArea (read))))



;----------------------Programming Language Recommendation------------------------------------------

;-----------Rule-01 Web Development , Frontend Development Programming Languages ---------------------
(defrule recommendation1 (projectType 1)(preferenceWD 1) => 
(printout t crlf "Recommendation : Consider learning HTML , CSS and JavaScript" crlf crlf)) 

;-----------Rule-02 Web Development , Backend Development Programming Languages ---------------------
(defrule recommendation2 (projectType 1)(preferenceWD 2) => 
(printout t crlf "Recommendation : Consider learning Node.js , Springboot or Java" crlf crlf)) 

;-----------Rule-03 Web Development , Full-stack Development Programming Languages ---------------------
(defrule recommendation3 (projectType 1)(preferenceWD 3) => 
(printout t crlf "Recommendation : Consider learning full-stack HTML,CSS,JavaScript with Node.js , Springboot or Java" crlf crlf)) 



;-----------Rule-04 Data Science , Data Manipulation and Analysis Programming Languages ---------------------
(defrule recommendation4 (projectType 2)(dataManipulation 1) => 
(printout t crlf "Recommendation : Consider learning Python (with libraries like Pandas and NumPy) or R " crlf crlf)) 

;-----------Rule-05 Data Science , Database Management and Querying Programming Languages ---------------------
(defrule recommendation5 (projectType 2)(dataManipulation 2)(database 1) => 
(printout t crlf "Recommendation : Consider learning SQL or Python (with Django or Flask)" crlf crlf)) 

;-----------Rule-06 Data Science , Other areas Programming Languages ---------------------
(defrule recommendation6 (projectType 2)(dataManipulation 2)(database 2) => 
(printout t crlf "Recommendation : Consider learning MATLAB and Scala" crlf crlf)) 



;-----------Rule-07 Mobile App Development , iOS platform Programming Languages ---------------------
(defrule recommendation7 (projectType 3)(platformSpecific 1)(platformName 1) => 
(printout t crlf "Recommendation : Consider learning Swift" crlf crlf)) 

;-----------Rule-08 Mobile App Development , Android platform Programming Languages ---------------------
(defrule recommendation8 (projectType 3)(platformSpecific 1)(platformName 2) => 
(printout t crlf "Recommendation : Consider learning Kotlin or Java" crlf crlf)) 

;-----------Rule-09 Mobile App Development , Cross Platform Programming Languages ---------------------
(defrule recommendation9 (projectType 3)(platformSpecific 2) => 
(printout t crlf "Recommendation : Consider learning cross-platform frameworks like React Native or Flutter" crlf crlf)) 



;-----------Rule-10 Game Development , 2D Gaming Programming Languages ---------------------
(defrule recommendation10 (projectType 4)(gamingDevArea 1) =>
(printout t crlf "Recommendation : Consider learning Unity (C#)" crlf crlf))

;-----------Rule-11 Game Development , 3D Gaming, Prioritizing Character Animation Programming Languages ---------------------
(defrule recommendation12 (projectType 4)(gamingDevArea 2)(preferred3DFeature 1) =>
(printout t crlf "Recommendation : Consider learning Lumberyard and Blender Game Engine (BGE)" crlf crlf))

;-----------Rule-12 Game Development , 3D Gaming , Prioritizing Environmental Design Programming Languages ---------------------
(defrule recommendation11 (projectType 4)(gamingDevArea 2)(preferred3DFeature 2) =>
(printout t crlf "Recommendation : Consider learning engines like Unity (3D) or Unreal Engine" crlf crlf))

;-----------Rule-13 Game Development , No Specific Preffered Area Programming Languages ---------------------
(defrule recommendation13 (projectType 4)(gamingDevArea 3) =>
(printout t crlf "Recommendation : Consider Phaser(JavaScript) and PyGame(Python)" crlf crlf))



;-----------Rule-14 Automation & Scripting, General Purpose Programming Languages ---------------------
(defrule recommendation14 (projectType 5)(scriptingArea 1) =>
(printout t crlf "Recommendation : Consider learning Python, Ruby, or Bash" crlf crlf))

;-----------Rule-15 Automation & Scripting, Task specific Programming Languages ---------------------
(defrule recommendation15 (projectType 5)(scriptingArea 2) =>
(printout t crlf "Recommendation : Specify the task (e.g., automation, data processing) and learn relevant scripting languages" crlf crlf))


;-----------Rule-16 No preference for given specific areas of coding  ---------------------
(defrule recommendation16 (projectType 6) =>
(printout t crlf "Recommendation : Consider learning C to understand programming fundamentals.That will help you to learn other programming languages easily." crlf crlf))




















