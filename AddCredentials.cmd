:: AddCredentials.cmd cr้er par Thierry Lemarchand
:: Ce batch permet de g้rer les informations d'identification de l'ordinateur.
::
:: Version 1.0 du 10/03/2020
:: Lire le fichier LisezMoi.txt pour plus d'informations.

@Echo Off

:: ================================================================================
::                               CONFIGURATION
:: ================================================================================
:: Entrez ici les param่tres du compte de l'utilisateur et du serveur.
Set User=AdminHSF
Set Pass=HenrySchein37
Set Server=Serveur
:: ================================================================================

:: Version :
Set Version=1.0

:Start
Cls
Echo                      ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo                      บ                                                                          บ
Echo                      บ      Utilitaire d'informations d'identification (credentials) v%version% :     บ
Echo                      บ                                                                          บ
Echo                      ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.
Echo           1 - Ajouter les informations d'identification pour %User%
Echo.
Echo           2 - Afficher la liste des informations d'identification
Echo.
Echo           3 - Lancer l'utilitaire de gestion des informations d'identification
Echo.
Echo           4 - Quitter
Echo.
Echo.
Set /P Var=Veuillez indiquer votre choix (1, 2, 3 ou 4) :
If %Var%==1 Goto :CredentialAdd
If %Var%==2 Goto :CredentialVue
If %Var%==3 Goto :CredentialManager
If %Var%==4 Exit
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

:CredentialAdd
Cls
If "%Server%"=="" Set Server=Serveur
Set /P Server=Veuillez indiquer le nom du serveur (Par dfaut : %Server%) : 
Echo.
Echo     Rcapitulatif des informations d'identifications
Echo.
Echo          Utilisateur    : %User%
Echo          Mot de passe   : %Pass%
Echo          Nom du Serveur : %Server%
Echo.
Echo Appuyez sur une touche pour confirmer l'ajout de ces informations d'identification.
Pause>Nul
cmdkey /add:%Server% /user:%User% /pass:%Pass%
Echo.
Echo Opration termine.
Echo Appuyez sur une touche pour revenir au menu.
Pause>Nul
Goto Start