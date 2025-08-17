-- Message affiché si l'utilisateur n'est pas whitelisté
local notWhitelistedMessage = "❌ Accès refusé : vous n'êtes pas autorisé à rejoindre ce serveur."

-- Prépare le token Discord pour l'API (préfixe "Bot ")
local FormattedToken = "Bot " .. Config.DiscordToken

-- Effectue une requête HTTP vers l'API Discord
-- method : "GET", "POST", etc.
-- endpoint : chemin de l'API (ex: "guilds/ID/members/ID")
-- jsondata : données à envoyer (table Lua)
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
        data = {data=resultData, code=errorCode, headers=resultHeaders}
    end, method, #jsondata > 0 and json.encode(jsondata) or "", {
        ["Content-Type"] = "application/json",
        ["Authorization"] = FormattedToken
    })

    -- Attend la réponse de l'API
    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

-- Récupère l'identifiant Discord du joueur (source FiveM)
function GetDiscordId(src)
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if id:match("discord:") then
            return id:gsub("discord:", "")
        end
    end
    return nil
end

-- Récupère la liste des rôles Discord du joueur
function GetRoles(user)
    local discordId = GetDiscordId(user)
    if discordId then
        local endpoint = ("guilds/%s/members/%s"):format(Config.GuildId, discordId)
        local member = DiscordRequest("GET", endpoint, {})
        if member.code == 200 then
            local data = json.decode(member.data)
            return data.roles -- Retourne la table des rôles
        else
            print("[Whitelist] Erreur API Discord: "..(member.data or "inconnue"))
        end
    else
        print("[Whitelist] Discord non détecté.")
    end
    return nil
end

-- Événement déclenché quand un joueur tente de se connecter
AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer() -- On met la connexion en attente
    deferrals.update("Vérification du rôle Discord...")

    -- Vérifie que le joueur a Discord d'ouvert
    local discordId = GetDiscordId(src)
    if not discordId then
        deferrals.done("Discord non détecté, vérifie qu'il est ouvert.")
        return
    end

    -- Récupère les rôles du joueur
    local roles = GetRoles(src)
    if not roles then
        deferrals.done("Impossible d'obtenir les rôles. Assure-toi d'être dans le bon Discord.")
        return
    end

    -- Vérifie si le joueur possède le rôle whitelist
    local allowed = false
    for _, roleId in ipairs(Config.Roles["Wl"] and { Config.Roles["Wl"] } or {}) do
        for _, userRole in ipairs(roles) do
            if tostring(userRole) == tostring(roleId) then
                allowed = true
                break
            end
        end
        if allowed then break end
    end

    -- Autorise ou refuse la connexion
    if allowed then
        deferrals.done()
    else
        deferrals.done(notWhitelistedMessage)
    end
end)


-- Vérifie au démarrage si le token et le Guild ID sont valides
Citizen.CreateThread(function()
    local guild = DiscordRequest("GET", "guilds/"..Config.GuildId, {})
    if guild.code == 200 then
        local data = json.decode(guild.data)
        print("[Whitelist] Connecté au serveur Discord : "..data.name.." ("..data.id..")")
    else
        print("[Whitelist] Erreur connexion Discord : "..(guild.data or guild.code))
    end
end)

