WLDiscordBot
============

WLDiscordBot est une ressource Lua pour FiveM qui connecte votre serveur à Discord pour gérer une whitelist (WL). 
Vous pouvez ajouter ou retirer des joueurs via Discord, recevoir des notifications et contrôler l'accès à votre serveur. 
Facile à installer et entièrement personnalisable.

Fonctionnalités
---------------
- Synchronisation de la whitelist avec Discord
- Ajouter ou retirer des joueurs directement depuis Discord
- Notifications Discord pour les ajouts et suppressions
- Contrôle simple et sécurisé de l’accès au serveur
- Compatible avec plusieurs rôles Discord

Installation
------------
1. Placez le dossier WLDiscordBot dans le répertoire 'resources' de votre serveur FiveM.
2. Ajoutez dans votre server.cfg :
   ensure WLDiscordBot
3. Ouvrez le fichier config.lua pour configurer votre bot Discord.

Configuration
-------------
Dans config.lua, remplacez les valeurs par celles de votre bot/serveur Discord :

- DiscordToken : Le token de votre bot Discord (à récupérer sur le portail développeur Discord)
- GuildId : L'ID de votre serveur Discord
- Roles : Table des rôles autorisés, avec le nom du rôle et son ID Discord
  Exemple :
    Roles = {
        ["Admin"] = "123456789012345678",
        ["VIP"] = "987654321098765432",
    }

Contribution
------------
Les contributions sont les bienvenues. Forkez le dépôt, créez une branche pour vos modifications et envoyez une pull request.

Auteur
------
AzizAnakin – [GitHub](https://github.com/AzizAnakin)
