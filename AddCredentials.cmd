:: Version 1.1 du 13/12/2020 - Par Tlem33  
:: https://github.com/Tlem33/AddCredentials
::

@Echo Off

:: ================================================================================
::                               CONFIGURATION
:: ================================================================================
:: Entrez ici les paramètres du compte de l'utilisateur et du serveur.
Set User=AdminHSF
Set Pass=HenrySchein37
Set Server=Serveur
:: ================================================================================

:: Version :
Set Version=1.1

:Start
Cls
Echo                      ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo                      º                                                                          º
Echo                      º      Utilitaire d'informations d'identification (credentials) v%version% :     º
Echo                      º                                                                          º
Echo                      ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo.
Echo.
Echo           1 - Ajouter les informations d'identification pour %User%
Echo.
Echo           2 - Ajouter les informations d'identification pour un utilisateur
Echo.
Echo           3 - Afficher la liste des informations d'identification
Echo.
Echo           4 - Lancer l'utilitaire de gestion des informations d'identification
Echo.
Echo           5 - Quitter
Echo.
Echo.
Set /P Var=Veuillez indiquer votre choix (1, 2, 3, 4 ou 5) :
If %Var%==1 Goto :HSFCredentialAdd
If %Var%==2 Goto :CredentialAdd
If %Var%==3 Goto :CredentialVue
If %Var%==4 Goto :CredentialManager
If %Var%==5 Exit
Goto :Start


:CredentialVue
Cls
cmdkey /list
Echo Appuyez sur une touche pour revenir au menu.
Pause>Nul
Goto Start


:CredentialManager
Call control /name Microsoft.CredentialManager
Goto Start


:HSFCredentialAdd
Cls
If "%Server%"=="" Set Server=Serveur
Set /P Server=Veuillez indiquer le nom du serveur (Par d‚faut : %Server%) : 
Echo.
Echo     R‚capitulatif des informations d'identifications
Echo.
Echo          Utilisateur    : %User%
Echo          Mot de passe   : %Pass%
Echo          Nom du Serveur : %Server%
Echo.
Echo Appuyez sur une touche pour confirmer l'ajout de ces informations d'identification.
Pause>Nul
cmdkey /add:%Server% /user:%User% /pass:%Pass%
Echo.
Echo Op‚ration termin‚e.
Echo Appuyez sur une touche pour revenir au menu.
Pause>Nul
Goto Start


:CredentialAdd
Cls
Set /P User=Veuillez indiquer le nom de l'utilisateur : 
Set /P Pass=Veuillez indiquer le mot de pass : 
Set /P Server=Veuillez indiquer le nom du serveur : 
Echo.
Echo     R‚capitulatif des informations d'identifications
Echo.
Echo          Utilisateur    : %User%
Echo          Mot de passe   : %Pass%
Echo          Nom du Serveur : %Server%
Echo.
Echo Appuyez sur une touche pour confirmer l'ajout de ces informations d'identification.
Pause>Nul
cmdkey /add:%Server% /user:%User% /pass:%Pass%
Echo.
Echo Op‚ration termin‚e.
Echo Appuyez sur une touche pour revenir au menu.
Pause>Nul
Goto Start