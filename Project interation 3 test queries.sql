/* Find the team Rafi Gayler plays for */
SELECT Team_Name, First_Name, Last_Name
FROM TeamMembers, Team, Player AS p
WHERE p.First_Name = "Rafi" AND p.Last_Name = "Gayler" AND p.PlayerID = TeamMembers.PlayerID AND TeamMembers.TeamID = Team.TeamID
;
/* Find all of Antonino McDougal's teammates Salary and height  */

SELECT First_Name, Last_Name, Salary, Height, TeamID
FROM TeamMembers, Player AS p
WHERE p.PlayerID = TeamMembers.PlayerID 
AND TeamMembers.TeamID = (SELECT TeamID
					      FROM TeamMembers , Player AS p
						  WHERE p.First_Name = "Antonino" And p.Last_Name = "McDougal" AND p.PlayerID = TeamMembers.PlayerID) 
;						
/* Return the individual stats for player Dave Gillaspy for match 4  */	

SELECT PointsG, AssistsG, ReboundsG, StealsG, Last_Name, First_Name
FROM  Player, GameStats 
WHERE GameStats.MatchID = 4 AND GameStats.PlayerID = Player.PlayerID 
AND GameStats.PlayerID = (SELECT PlayerID
						  FROM Player
						  WHERE Player.First_Name = "Dave" AND  Player.Last_Name = "Gillaspy")
;
/* Return the all the players that played in match 4 with Dave Gillaspy and their stats and team name  */	

SELECT  First_Name, Last_Name, Team_Name, PointsG, AssistsG, ReboundsG, StealsG, Season_Stage, League_Name
FROM  Player AS p, GameStats AS gs, Team AS t, TeamMembers AS tm, Matches AS m, GameData as gd, LeagueData as ld 
WHERE p.PlayerID = tm.PlayerID AND t.TeamID = tm.TeamID AND gs.PlayerID = tm.PlayerID AND gs.MatchID = 4 AND gd.MatchID = m.MatchID AND ld.LeagueName = gd.League_Name
GROUP BY First_Name
;

/* return the sum of all Salarys for each team and league name*/

SELECT Team_Name, sum(Salary) as Team_Payroll
FROM Team, Player, TeamMembers
WHERE  Player.PlayerID = TeamMembers.PlayerID AND Team.TeamID = TeamMembers.TeamID
GROUP BY Team_Name





							