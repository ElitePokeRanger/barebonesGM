include( 'shared.lua' );




function GM:HUDShouldDraw( name )
    if ( name == "CHudHealth" or name == "CHudBattery" or name == "CHudAmmo" or name == "CHudSecondaryAmmo" or name == "CHudDeathNotice") then
        return false
    end
    return true
end

surface.CreateFont("Default", {
	font = "PoetsenOne-Regular",
	size = 60,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})

function GM:HUDPaint()
self.BaseClass:HUDPaint()
local ply = LocalPlayer()
local HP = LocalPlayer():Health()

surface.SetTextPos( 50, 600)
surface.SetFont( "Default" )

if(ply:Team() != TEAM_SPEC) then
if(HP > 0) then
	if(HP > 70) then
	surface.SetTextColor(20,180,50,255)
	elseif(HP < 90 and HP > 80) then
	surface.SetTextColor(79, 178, 21,255)
	elseif(HP < 80 and HP > 70) then
	surface.SetTextColor(120, 178, 21,255)
	elseif(HP < 70 and HP > 50) then
	surface.SetTextColor(152, 175, 21, 255)
	elseif(HP < 50 and HP > 30) then
	surface.SetTextColor(170, 175, 21, 255)
	elseif(HP < 30 and HP > 10) then
	surface.SetTextColor(175, 108, 21, 255)
	else
	surface.SetTextColor(175, 70, 21,255)
	end	

	surface.DrawText( HP )
else
surface.SetTextColor(255,0,0,255)
surface.DrawText("DEAD")
end
else
surface.SetTextColor(211,211,211,255)
surface.DrawText("SPEC")

end

if(TeamHasWon) then
	if(WinningTeam == TEAM_COMBINE) then
		//surface.SetTextColor(20,180,50,255)
		//surface.SetTextPos()
	elseif(WinningTeam == TEAM_REBELS) then
		
	end	
end	

end
