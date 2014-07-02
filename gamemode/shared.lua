GM.Name = "Barebones Gamemode";
GM.Author = "KirbyPyro";

TEAM_COMBINE = 1;
TEAM_REBELS = 2;
TEAM_SPEC = 3;

team.SetUp( TEAM_COMBINE, "Combine", Color(19, 45, 242, 255) );
team.SetUp( TEAM_REBELS, "Rebels", Color(255, 0, 0, 255) );
team.SetUp( TEAM_SPEC, "Spectator", Color(211,211,211,255), false );

local TeamHasWon = false;
local WinningTeam = nil;