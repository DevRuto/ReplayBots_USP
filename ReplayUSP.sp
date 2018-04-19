#include <sourcemod>
#include <cstrike>
#include <smlib>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
    name = "Make Replay Bots Great Again",
    author = "Ocelot",
    description = "Gives Replay Bots USP again",
    version = "1.0",
    url = "http://www.superfunclimb.club"
};

public void OnPluginStart()
{
    HookEvent("player_spawn", Event_PlayerSpawn);
}

public Action Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
    int clientID = GetEventInt(event, "userid");
    int Client = GetClientOfUserId(clientID);
    
    Client_RemoveAllWeapons(Client);
    CreateTimer(0.1, Timer_GiveWeapons, clientID);
}

public Action Timer_GiveWeapons(Handle timer, any data)
{
    int Client = GetClientOfUserId(data);
    int Team = GetClientTeam(Client);
    
    if (Team == CS_TEAM_CT)
    {
        GivePlayerItem(Client, "weapon_usp_silencer");
        GivePlayerItem(Client, "weapon_knife");
    }
    else if (Team == CS_TEAM_T)
    {
        GivePlayerItem(Client, "weapon_usp_silencer");
        GivePlayerItem(Client, "weapon_knife_t");
    }
}  
