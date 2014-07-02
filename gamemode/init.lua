AddCSLuaFile( "cl_init.lua" );
AddCSLuaFile( "shared.lua" );
include( 'shared.lua' );


function GM:PlayerInitialSpawn(ply)
	local teamID = team.BestAutoJoinTeam();
	ply:SetTeam(teamID);
end	

function GM:PlayerLoadout( ply )
if(ply:Team() != TEAM_SPEC) then
	ply:StripWeapons();
	if(ply:Team() == TEAM_REBELS) then
		local randomnum = math.random(1,9);
		ply:SetModel( "models/player/Group03/male_0"..randomnum..".mdl" );
		ply:Give( "weapon_crowbar" );
		ply:Give( "weapon_pistol");
		ply:SetPlayerColor( Vector(1, 0, 0) );
	elseif(ply:Team() == TEAM_COMBINE) then
		ply:SetModel( "models/player/combine_soldier.mdl" );
		ply:Give( "weapon_stunstick" );
		ply:Give( "weapon_pistol");
		ply:SetPlayerColor( Vector(0, 0, 1) );
	end
else
	ply:Spectate( 6 );
end	

end	

function GM:DoPlayerDeath( ply, attacker, dmg )
	ply:CreateRagdoll()
	ply:SetTeam(3);
	checkForEmptyTeams();
end

function GM:PlayerDisconnected( ply )
	checkForEmptyTeams();
end


// Custom functions
function restartGame()
		PrintMessage(3, "Restarting game...");
		TeamHasWon = false;  
		for k,v in pairs(player.GetAll()) do
		
		local t = team.BestAutoJoinTeam();
		v:SetTeam(t);
		v:Spawn();
		
		
		end
end

function checkForEmptyTeams()
	if( table.getn(team.GetPlayers(1)) == 0 ) and (!TeamHasWon) then
		PrintMessage(4, "The team "..team.GetName(2).." has won!");
		TeamHasWon = true;
		WinningTeam = TEAM_REBELS;
		
		timer.Simple(5, restartGame)

	elseif ( table.getn(team.GetPlayers(2)) == 0 ) and (!TeamHasWon) then
		PrintMessage(4, "The team "..team.GetName(1).." has won!");
		TeamHasWon = true;
		WinningTeam = TEAM_COMBINE;

		timer.Simple(5, restartGame)
	end	

end	