# sports-database-SQL
Contains sports statistics 
1.	Introduction 
This document provides an overview of the basketball database developed by team Excelente. The sections below will outline the application, the design/structure, and the methodology/ process of the database. 
2.	Background & Application
The goal of this database is to provide advanced basketball metrics freely to everyone. Advanced metrics play a big role in sports betting. Usually, the advanced metrics used by professional sports bettors are not shared with the public. Normally the only people who have access to these advanced metrics pay for them or know how to develop these metrics on their own using advanced analytics. The end goal of my database is to provide instant advanced analytics freely through the web for everyone.
3.	Use Cases
This database will be able to perform many functions, queries can be built that can pull payer stats by name, retrieve averages of player, find in-game career highs, etc. The data retrieved can be used to help decide which player is better to draft for fantasy sports or just to settle a debate between friends to find out which players have had a better career. The most unique function of this database will be the distribution of advanced analytics. Ultimately, the end goal is to have pre-built functions for useful advanced analytic stats that use the data provided by our database to create and distribute advanced analytics to the users of the website.      

4.	Assumptions
• A player can only play for one team. 
• Only two teams can participate in a match.
• Players from different teams cannot have team members in common. 
• Teams must have multiple players 
• All game stats must be a part of the same match.
• A Team cannot participate in a match with itself.
• Teams can participate in multiple matches.
• All Primary key(s) must be Unique.

5.	Methodology and Process
• Build a conceptual representation of the database.
• Identify important entities, relationships, and attributes.
• Determine the keys and integrity constraints.
• Check for redundancy and violations of normal forms.
• Add in data and test.

6.	Documentation and Relational data model description
 The Player entity has 14 attributes total with the attribute playerID serving as the sole primary key. This entity contains all details regarding the player, the player's career stats, physical attributes, etc. Player ID is also a foreign key in the TeamMembers relation. 
The Team entity has 1 primary key called TeamID which is used to uniquely identify the name of individual teams. The other 9 attributes contain details about each team in more depth like their records, city, mascot, etc. 
The TeamMembers entity contains two primary keys TeamID and PlayerID. Together these keys will build a uniquely pair a player with the team they play for. Both entities are also foreign keys.
The Match entity is used to assemble teams for matches. There are 2 Primary keys TeamID and MatchID which combine to uniquely identify the games teams participate in with 1 MatchID being identical for 2 TeamID.  
Game Stats is an entity with 2 Primary keys MatchID and PlayerID together these keys uniquely connect one player to on match they participated in. The other 4 attributes are dependent on the pair of primary keys and encompass player stats for that particular game.
Game Data is an entity that contains 2 Primary keys GameID and MatchID. The Game data’s primary keys will identify a match and the relevant data for the match. The other 5 attributes contain basic data for each match such as the date played, the arena name, and league. MatchID and League Name are also foreign keys.
League Data entity has one primary key called League name. This key is used to uniquely identify all leagues saved in the database. The other attributes contain basic data about each league such as the commissioner and tv ratings. League data is a foreign key to Game data that connects league information to game data. 
This database will hold the following data types ints, bits, text, and date.
7.	Iteration Evolution
Changes made to my database from iteration 2 to iteration 3 can be seen by comparing the figure below of my ER diagram for iteration 2 and comparing it to the current ER diagram. I decided to simplify my database by combining my player stats and player relation into a single relation called player. For this alteration to make sense I made the stats recorded under the player relation to be career stats. To record game stats I made another relation called Game stats.
This relation has 2 primary keys MatchID and PlayerID which combine to uniquely identify a single player’s stats for a single game. MatchID represents the match the player played in and PlayerID represents a single unique player. Both PlayerID and MatchID are foreign keys as well. The other 4 attributes are stats recorded the player for that game named PointsG, AssitsG, ReboundsG, and StealsG. Other then those two changes the diagram is mostly identical in its functional design. There are other minor changes to attributes that do not affect the function of the relations. These adjustments can be seen by observing the ER diagrams.

8.	Work Distribution
As the sole member of the team Excelente, the work could not be distributed to another person. A lot of work went into this project to bring it to the state it is in today. I spent a lot of time learning how to use the various software tools required to do this project. I wanted neat computerized diagrams, so I taught myself how to use online drawing tools to make my entity and relational data model diagrams. I had to learn how to use DB browser to create my SQL lite database. Moreover, I had to use by existing HTML and CSS skills to code my website using MS visual studio code. Although I was able to deploy my website and get the front end up and running unfortunately I did not have enough time to learn how to use PHP to get the backend of the website to communicate with my database.
9.	Concerns
I am happy with the design of my website's UI and database structure. I know that the core design works well. I still have concerns about getting the back end of my website up and running along with the front end. I did not have enough time in my schedule to learn PHP programming language which is needed to manage data in the backend of my website by the due date of iteration 3. Hopefully, in future iterations, I can find the time to learn PHP and finally build a fully functioning website if I were to continue this project. 
10.	Data Generation & Testing
I used Mockroo to generate data for the bulk of the data for my relational database. Mockroo is a website that generates realistic mock data for free. I imported this data with CSV and SQL file types. For all the data mokoro could not provide I added in manually. 
For testing, I used the data generated from Mockroo and created a simple nested select-from-where statement designed to replicate a box score. A box score is a statistical representation of every player's stats for a single game. Ensuring correctness was accomplished by confirming that the result made sense and resembled a box score. Creating a box score involves 6 of the 7 tables in the database, therefore this statement was a great way to test the connections between these tables.


11.	Normalization
All my relations in my database are in the third normal form. The following relations Player, Game data, League data, Team, Match, Game Stata, and Team Members only contains variables with a single atomic value which satisfies the first normal form. All of the relations previously mentioned also have no partial dependencies as no non-primary attribute is dependent on another attribute, which satisfies the second normal form. All entities except the Game Data entity satisfy the third normal form by not having any transitive dependencies. All tables in the 3NF are broken up into sections in which no single table has any attributes that have dependencies with other attributes within the same relation. Furthermore, no functional dependencies exist between non-prime attributes in the same relation. 
12.	Potential future goals
The potential future goals are to improve the website by making it more user friendly and making the data more functional. The next goal for the database is to replace the dummy data with real data so that it can be used for real sports betting. Additional goals include calculating advanced analytics from data in the database automatically. Lastly, I would like my database to provide advanced analytics for every sport, not just basketball

