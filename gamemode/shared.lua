GM.Name = "Barebones Gamemode";
GM.Author = "KirbyPyro";

TEAM_COMBINE = 1; --!NOTE!--
TEAM_REBELS = 2; -- DO NOT USE THESE INTEGERS. --
TEAM_SPEC = 3;  -- Use TEAM_TEAMNAME for cleaner code and less confusion. --

team.SetUp( TEAM_COMBINE, "Combine", Color(19, 45, 242, 255) );
team.SetUp( TEAM_REBELS, "Rebels", Color(255, 0, 0, 255) );
team.SetUp( TEAM_SPEC, "Spectator", Color(211,211,211,255), false ); -- Players are moved to this team when they die if bb_suddendeath is enabled.

local TeamHasWon = false; -- If a team has won the game, either by getting the amount of kills specified by bb_killstowin or by eliminating the other team (if bb_suddendeath is enabled)
local WinningTeam = nil; -- Which team has won, either Combine or Rebels.