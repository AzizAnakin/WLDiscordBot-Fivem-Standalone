WLDiscordBot
============

WLDiscordBot est une ressource Lua pour FiveM qui connecte votre serveur à Discord afin de gérer facilement une whitelist (WL). 
Ajoutez ou retirez des joueurs via Discord, recevez des notifications et contrôlez l'accès à votre serveur. Simple à installer et personnalisable.

Fonctionnalités
---------------
- Synchronisation de la whitelist avec Discord
- Ajouter ou retirer des joueurs depuis Discord
- Notifications Discord pour les ajouts et suppressions
- Contrôle simple et sécurisé de l’accès au serveur
- Facile à installer et personnalisable

Installation
------------
1. Téléchargez ou clonez le dépôt :
   git clone https://github.com/AzizAnakin/WLDiscordBot.git
2. Placez le dossier WLDiscordBot dans le répertoire 'resources' de votre serveur FiveM
3. Ajoutez dans votre server.cfg :
   ensure WLDiscordBot
4. Configurez le fichier config.lua avec votre token Discord et les paramètres de whitelist

Configuration
-------------
Dans config.lua, configurez les paramètres :
- DiscordToken : le token de votre bot Discord
- WhitelistRoleID : l'ID du rôle Discord autorisé à rejoindre le serveur
- NotificationChannelID : l'ID du canal Discord pour les notifications

Contribution
------------
Les contributions sont les bienvenues. Forkez le dépôt, créez une branche pour vos modifications et envoyez une pull request.

Auteur
------
AzizAnakin – https://github.com/AzizAnakin
