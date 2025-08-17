--[[
    Fichier de configuration Discord pour la whitelist
    Remplace les valeurs par celles de ton bot/serveur Discord
]]
Config = {
    -- Token du bot Discord (à récupérer sur le portail développeur Discord)
    DiscordToken = "VOTRE_TOKEN_ICI",

    -- ID du serveur Discord (Guild ID)
    GuildId = "VOTRE_GUILD_ID_ICI",

    -- Liste des rôles autorisés (whitelist)
    -- Remplace "NOM DU ROLE" par le nom que tu veux, et "ID_ROLE_ICI" par l'ID du rôle Discord
    Roles = {
        ["NOM DU ROLE"] = "ID_ROLE_ICI",
    }
}