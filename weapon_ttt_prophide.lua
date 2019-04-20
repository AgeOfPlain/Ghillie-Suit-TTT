if SERVER then
	AddCSLuaFile()
	util.AddNetworkString( "DisguiseDestroyed" )
	util.AddNetworkString( "PD_ChatPrint" ) 
	
end



if CLIENT then
	SWEP.PrintName = "Ghillie Suit"
    SWEP.Slot = 2
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = true
	
	SWEP.Icon = "vgui/ttt/exho_propdisguiser.png"
 
   SWEP.EquipMenuData = {
      type = "item_weapon",
      desc = "A Ghillie Suit, left click puts it on, makes it so that other players cannot see your nametag but it comes with a slight debuff of moving slightly slower, Right Click removes it\n\nCreated by Business Cat & Merlin\n\n\nMeow?"
   };
end

SWEP.HoldType			= "normal"
SWEP.Base				= "weapon_tttbase"
SWEP.Kind 				= WEAPON_EQUIP2
SWEP.CanBuy 			= { ROLE_TRAITOR, ROLE_ASSASSIN }
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.AutoSpawnable 		= false
SWEP.ViewModel          = "models/weapons/c_pistol.mdl"
SWEP.WorldModel         = "models/weapons/w_pistol.mdl"
SWEP.ViewModelFlip		= false
SWEP.UseHands 			= true



function SWEP:PrimaryAttack()
	local ply = self.Owner
	
	if not self:GetNWBool("PD_WepDisguised") then
		ply:SetNWBool("PD_Disguised", true)
		self:SetNextPrimaryFire(CurTime()+2)
		ply:SetSkin( models/player/ghilliesuit_forest.mdl )
		PD_Msg("You are now disguised.", ply)
		Player:SetLaggedMovementValue(0.65)
	else    
		PD_Msg("You are already disguised.", ply)
		return
	end
end

function SWEP:SecondaryAttack()
	local ply = self.Owner
	if not self:GetNWBool("PD_WepDisguised") then
		PD_Msg("You are already undisguised ya dipshit.", ply)
	else
		-- Undisguise code here
		Player:SetLaggedMovementValue(0.65)
	end

end

function SWEP:Reload()

end



