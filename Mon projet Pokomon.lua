platform.apilevel = '2.5' --Version Librairies
require "physics"--appel de la librairie physics

function on.construction()
	sauvegarde = var.recall("sauvegarde")
	menuTexteSauvegarde ={}
	local i=1
	if  sauvegarde ~= nil then
		while sauvegarde[i] ~= nil do
			menuTexteSauvegarde [i] = "partie "..i
			i=i+1
		end
	end
	if i<=8 then
		sauvegarde = {}
		menuTexteSauvegarde [i] = "nouvelle partie "..i
	end
end




--INITIALISATION DES VARIABLES

--TEXTURE PERSONNAGE

persoBas = image.new(_R.IMG.PersoBas)
persoBas1 = image.new(_R.IMG.PersoBas1)

persoDroite = image.new(_R.IMG.PersoDroite)
persoDroite1 = image.new(_R.IMG.PersoDroite1)

persoGauche = image.new(_R.IMG.PersoGauche)
persoGauche1 = image.new(_R.IMG.PersoGauche1)

persoHaut = image.new(_R.IMG.PersoHaut)
persoHaut1 = image.new(_R.IMG.PersoHaut1)


persoBast = image.new(_R.IMG.PersoBasT)
persoBas1t = image.new(_R.IMG.PersoBas1T)

persoDroitet = image.new(_R.IMG.PersoDroiteT)
persoDroite1t = image.new(_R.IMG.PersoDroite1T)

persoGauchet = image.new(_R.IMG.PersoGaucheT)
persoGauche1t = image.new(_R.IMG.PersoGauche1T)

persoHautt = image.new(_R.IMG.PersoHautT)
persoHaut1t = image.new(_R.IMG.PersoHaut1T)



personnaget = persoBast
personnage = persoBas
--IMAGES ECRAN TITRE
ecranTitreIMG = image.new(_R.IMG.ecranTitre)
ecranTitreNuagesIMG = image.new(_R.IMG.ecranTitreNuages)
ecranTitreTexteIMG = image.new(_R.IMG.ecranTitreTextes)
ecranTitreTexteEnterIMG = image.new(_R.IMG.ecranTitreTexteEnter)

--IMAGE COMBATS
backgroundCombatIMG = image.new(_R.IMG.backgroundCombat)

--IMAGES POKOMON
pokomonLongSerpentFrontIMG = image.new(_R.IMG.pokomonLongSerpentFront)
pokomonLongSerpentBackIMG = image.new(_R.IMG.pokomonLongSerpentBack)
pokomonChampiPokoBackIMG = image.new(_R.IMG.pokomonChampiPokoFront)
pokomonChampiPokoFrontIMG = image.new(_R.IMG.pokomonChampiPokoBack)
pokomonPokOGMFrontIMG = image.new(_R.IMG.pokomonPokOGMFront)
pokomonPokOGMBackIMG = image.new(_R.IMG.pokomonPokOGMBack)
pokomonPokOignonFrontIMG = image.new(_R.IMG.pokomonPokOignonFront)
pokomonPokOignonBackIMG = image.new(_R.IMG.pokomonPokOignonBack)
pokomonRonfleurFrontIMG = image.new(_R.IMG.pokomonRonfleurFront)
pokomonRonfleurBackIMG = image.new(_R.IMG.pokomonRonfleurBack)
pokomonSalesMechesFrontIMG = image.new(_R.IMG.pokomonSalesMechesFront)
pokomonSalesMechesBackIMG = image.new(_R.IMG.pokomonSalesMechesBack)
pokomonTrichignonFrontIMG = image.new(_R.IMG.pokomonTrichignonFront)
pokomonTrichignonBackIMG = image.new(_R.IMG.pokomonTrichignonBack)
pokomonTricheFrontIMG = image.new(_R.IMG.pokomonTriche)
pokomonTricheBackIMG = pokomonTricheFrontIMG

--SAUVEGARDE
sacSauvegarde = {}
PDVsauvegardePoko = {}
IDsauvegardePoko = {}
nomPokomon = {}
--VARIABLES COODONEED POKOMON     A REFRESH /!\
xImagePokomonJoueurCombat = 42
yImagePokomonJoueurCombat = 75

xImagePokomonAdverseCombat = 210
yImagePokomonAdverseCombat = 8

animationsPokoAdverse , animationsPokoJoueur = true


--EcranTitre

abcNuages = 0 --abcPointOrigin[nomMenu]de l'image défilante des nuages de l'écran titre
indiceTimerTexteEcranTitre = 0 --Variable indice pour l'affichage clignotant du texte dans le timer

--Initialisation de la variable etat (gère les états du jeu/écran)
ecran = 1 --Variable ecran = etat de l'écran, qui est puisé dans la liste d'états
if typeFenetreMenu == nil then
    typeFenetreMenu = 2 --Type de fenêtre pour le menu (2=carré ; 1=entouré)
end

premiereOptionAffichee = {} --Utile pour décaler le texte

abcPointOrigin = {}
ordPointOrigin = {}
directionMenu = {}
optionSelect = {}
if justificationPolice == nil then
    justificationPolice = "r"
end
if typeTexte == nil then
    typeTexte = "sansserif"
end
if tailleTexte == nil then
    tailleTexte = 14
end
if typeFenetreDefaut == nil then
	typeFenetreDefaut = 2
end

--COULEURS
couleur = 
{
Noir = {r = 0 , v = 0 , b = 0},
Blanc = {r = 255 , v = 255 , b = 255},
Selecteur = {r = 0 , v = 0 , b = 0},
RougeComplet = {r = 255 , v = 0 , b = 0},
VertComplet = {r = 0 , v = 255 , b = 0},
BleuComplet = {r = 0 , v = 0 , b = 255}
}
if couleur.Defaut == nil then
    couleur.Defaut = couleur.Noir
end
if couleur.Bordure == nil then
    couleur.Bordure = couleur.Noir
end
if couleur.Background == nil then
    couleur.Background = couleur.Blanc
end
--FINCOULEURS

--FONCTION COMBAT
pokomonAdverse =  {sante = 0}

capacites=
{
{nom = "Morsure" , genre = "Degats" , degats = 20},
{nom = "Poce Bleux" , genre = "Degats" , degats = 30},
{nom = "Coup de poing" , genre = "Degats" , degats = 20},
{nom = "Ecrasement" , genre = "Degats" , degats = 25},
{nom = "Vomi vert" , genre = "Degats" , degats = 30},
{nom = "Cheveux étrangleurs", genre = "Degats" , degats = 25},
{nom = "Flammes" , genre = "Degats" , degats = 30},
{nom = "Mort immédiate" , genre = "Degats" , degats = 90000000}
}

pokodex = {
     {nom = "LongSerpent" , defense = 10 , santeMAX = 40 , sante = 40 ,  attaque = 12 , capacite = capacites[1] , front = pokomonLongSerpentFrontIMG , back = pokomonLongSerpentBackIMG,id=1},
     {nom = "ChampiPoko" , defense = 10 , santeMAX = 30 , sante = 30 , attaque = 15 , capacite = capacites[2] , front = pokomonChampiPokoFrontIMG , back = pokomonChampiPokoBackIMG,id=2},
     {nom = "PokOignon" , defense = 10 , santeMAX = 10 ,  sante = 10 , attaque = 30 , capacite = capacites[3] , front = pokomonPokOignonFrontIMG , back = pokomonPokOignonBackIMG,id=3},
     {nom = "PokOGM" , defense = 10 , santeMAX = 50 , sante = 50 , attaque = 20 , capacite = capacites[5] , front = pokomonPokOGMFrontIMG , back = pokomonPokOGMBackIMG,id=4},
     {nom = "Ronfleur" , defense = 20 , santeMAX = 60 , sante = 60 , attaque = 10 , capacite = capacites[4] , front = pokomonRonfleurFrontIMG , back = pokomonRonfleurBackIMG,id=5},
     {nom = "SalesMèches" , defense = 20 , santeMAX = 80 , sante = 80 , attaque = 35 , capacite = capacites[7] , front = pokomonSalesMechesFrontIMG , back = pokomonSalesMechesBackIMG,id=6},
     {nom = "Trichignon" , defense = 10 , santeMAX = 50 , sante = 50 , attaque = 20 , capacite = capacites[6] , front = pokomonTrichignonFrontIMG , back = pokomonTrichignonBackIMG,id=7},
     {nom = "Pokomon Triche" , defense = 10 , santeMAX = 5000000 , sante = 5000000 , attaque = 20 , capacite = capacites[8] , front = pokomonTricheFrontIMG , back = pokomonTricheBackIMG,id=8}
}


local i=1
listeNomPoko = {}
while pokodex[i] ~= nil do
listeNomPoko[i] = pokodex[i].nom
i=i+1
end

i=nil




--FIN FONCTION COMBAT



--FONCTION VAR TERRAIN
ligneM=100--déffinie le nombre de ligne maximal
colonneM=150--déffinie le nombre de collonne maximal
Herbe = {collision = false,id = 1,tex = image.new(_R.IMG.Tex1)}
Sable =  {collision = false ,id = 2,tex = image.new(_R.IMG.Tex2)}
HarbreHG = {collision = true ,id = 4,tex = image.new(_R.IMG.Tex3),texS = image.new(_R.IMG.Tex3s)}
HarbreHD = {collision = true ,id = 4.1,tex = image.new(_R.IMG.Tex4),texS = image.new(_R.IMG.Tex4s)}
HarbreBG = {collision = true ,id = 4.2,tex = image.new(_R.IMG.Tex5)}
HarbreBD = {collision = true ,id = 4.3,tex = image.new(_R.IMG.Tex6)}
Buisson = {collision = false ,id = 4.4,tex = image.new(_R.IMG.Tex7),texD = image.new(_R.IMG.Tex7d)}
SableBoD = {collision = false ,id = 2.1,tex = image.new(_R.IMG.Tex8)}
SableBoG = {collision = false ,id = 2.2,tex = image.new(_R.IMG.Tex9)}
SableBoH = {collision = false ,id = 2.3,tex = image.new(_R.IMG.Tex10)}
SableBoB = {collision = false ,id = 2.4,tex = image.new(_R.IMG.Tex11)}
SableBoCHD = {collision = false ,id = 2.5,tex = image.new(_R.IMG.Tex12)}
SableBoCHG = {collision = false ,id = 2.6,tex = image.new(_R.IMG.Tex13)}
SableBoCBG = {collision = false ,id = 2.8,tex = image.new(_R.IMG.Tex14)}
SableBoCBD = {collision = false ,id = 2.9,tex = image.new(_R.IMG.Tex15)}
SableBoCIBD = {collision = false ,id = 3,tex = image.new(_R.IMG.Tex16)}
SableBoCIBG = {collision = false ,id = 3.1,tex = image.new(_R.IMG.Tex17)}
SableBoCIHD = {collision = false ,id = 3.2,tex = image.new(_R.IMG.Tex18)}
SableBoCIHG = {collision = false ,id = 3.3,tex = image.new(_R.IMG.Tex19)}
StatuEnJeu = true
initialisation = true
deplacements = true
i = 0
nb = 0
nh = 0
nd = 0
ng = 0
h = 1
d = 1
g = 1
b = 1
d1 = 1
h1 = 1
b1 = 1
g1 = 1
tableau = {}
posX=0
posY=0

--TEXTE
Entrer = false
affichageText = {n,list={} , ligne,ancienStr = '' , FinTexte = true}
texteString=''
noir = {r=0,v=0,b=0}
blanc = {r=255,v=255,b=255}

--INITIALISATION DE NOS FONCTIONS

    pokomonActif = 1 --TESTTTTTT
    choixFait = false
 
function on.resize()
	L = platform.window:width()
    H = platform.window:height()
	ecranTitreIMG = ecranTitreIMG:copy(image.new(_R.IMG.ecranTitre):width()*(H/212),image.new(_R.IMG.ecranTitre):height()*(L/318))
	ecranTitreNuagesIMG = ecranTitreNuagesIMG:copy(image.new(_R.IMG.ecranTitreNuages):width()*(H/212),image.new(_R.IMG.ecranTitreNuages):height()*(L/318))
	ecranTitreTexteIMG = ecranTitreTexteIMG:copy(image.new(_R.IMG.ecranTitreTextes):width()*(H/212),image.new(_R.IMG.ecranTitreTextes):height()*(L/318))
	ecranTitreTexteEnterIMG = ecranTitreTexteEnterIMG:copy(image.new(_R.IMG.ecranTitreTexteEnter):width()*(H/212),image.new(_R.IMG.ecranTitreTexteEnter):height()*(L/318))
	backgroundCombatIMG = backgroundCombatIMG:copy(image.new(_R.IMG.backgroundCombat):width()*(H/212),image.new(_R.IMG.backgroundCombat):height()*(L/318))
	if ecran == 3  then
		timer.start(0.01)--mise a jour du player il démarre la clock
	end
    largeur1 = L/18
    espace = physics.Space()--déffinie l'espace de jeu
    inertiaboule = physics.misc.momentForCircle(100, 0, largeur1, physics.Vect(0,0))
    joueur = physics.Body(100, inertiaboule)-- définie la masse et linertie
    espace:addBody(joueur)--ajoute le joueur dans l'espace
    joueur:setPos(physics.Vect(posX,posY))--place le joueur a une position de départ
  
end

--DEBUT DU COMBAT



function combatExecutionDebut()
	nilUtilite = false
	animationCombatAdversaireActivee = true
	animationCombatJoueurActivee = true
	indicePokodex = 1
	while pokodex[indicePokodex] ~= nil do
		indicePokodex = (indicePokodex + 1)
	end
	indicePokodex = math.random(1 , (indicePokodex - 2))
	pokomonAdverse = {nom = pokodex[indicePokodex].nom , defense = pokodex[indicePokodex].defense , santeMAX = pokodex[indicePokodex].santeMAX , sante = pokodex[indicePokodex].sante ,  attaque = pokodex[indicePokodex].attaque , capacite = pokodex[indicePokodex].capacite , front = pokodex[indicePokodex].front , back = pokodex[indicePokodex].back,id=pokodex[indicePokodex].id}
	pokomonAdverse.santeMAX = math.random((pokomonAdverse.santeMAX - 5) , (pokomonAdverse.santeMAX + 25))
	pokomonAdverse.sante = pokomonAdverse.santeMAX
	pokomonAdverse.defense = math.random((pokomonAdverse.defense - 5) , (pokomonAdverse.defense + 25))
	pokomonAdverse.attaque = math.random((pokomonAdverse.attaque - 5) , (pokomonAdverse.attaque + 25))
	adversaireCapacite , adversaireAttaque , adversaireFuit , probaCapture , captureReussi , dressageEnCours , fuiteEnCours , actionJoueurFinit , texteCombatFinActive , actionAttaqueJoueur , actionAttraper , actionCapaciteJoueur , actionDefenseJoueur , actionFuirJoueur , choixObjetFait , choixAdverseFait , choixFait , repliqueSuivante = false
	texteDebutCombatActive , animationsPokoAdverse , animationsPokoJoueur = true
	chanceFuite = 4
	n = 0
	indiceAnimation , optionSelect["menuCombatSac"] , optionSelect["menuCombat"] = 1
	menuActif = "menuCombat"
	xImagePokomonJoueurCombat = 42
	yImagePokomonJoueurCombat = 75
	xImagePokomonAdverseCombat = 210
	yImagePokomonAdverseCombat = 8
end


function combatExecutionFin(gc)
	if pokomonAdverse.sante == 0 then
		texteFinActive = true
		if not repliqueSuivante then
			Texte(gc,"Bravo ! Vous avez vaincu le "..pokomonAdverse.nom.." sauvage grâce à votre "..sac.pokomon[pokomonActif].nom.." !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				ecran = "écran de gain"
				texteCombatFinActive = true
				menuActif = "menuExploration"
				menuActive = false
			end
		end
	elseif sac.pokomon[pokomonActif].sante == 0 then
		texteFinActive = true
		Texte(gc,"Votre "..sac.pokomon[pokomonActif].nom.." est mort sous les attaques du "..pokomonAdverse.nom.." sauvage !",{r=0,v=0,b=0})
		if affichageText.FinTexte then
			ecran = "écran de défaite"
			sac.pokomon[pokomonActif].statut = "mort"
			texteCombatFinActive = true
			menuActif = "menuExploration"
			menuActive = false
		end
	end
end



function checkNbrObjetsExistants()
	indiceNbrObjetsExistants = 1
	nbrMaxAtteint = false
	nbrObjetsExistants = 0
	while not nbrMaxAtteint do
		nbrObjetsExistants = (nbrObjetsExistants + 1)
		indiceNbrObjetsExistants = (indiceNbrObjetsExistants + 1)
		if sac.objets[indiceNbrObjetsExistants] == nil then
		  nbrMaxAtteint = true
		end
	end
end



function combatAttaqueAdverse(gc)
	coefficientDefense = (pokomonAdverse.attaque/(sac.pokomon[pokomonActif].defense*0.1))
    sac.pokomon[pokomonActif].sante = (sac.pokomon[pokomonActif].sante - (math.floor(pokomonAdverse.attaque/(sac.pokomon[pokomonActif].defense*0.1))))
	if sac.pokomon[pokomonActif].sante < 0 then
		sac.pokomon[pokomonActif].sante = 0
	end
end



function combatAttaqueJoueur(gc)
    pokomonAdverse.sante = (pokomonAdverse.sante - (math.floor(sac.pokomon[pokomonActif].attaque/(pokomonAdverse.defense*0.1))))
	if pokomonAdverse.sante < 0 then
		pokomonAdverse.sante = 0
	end
end



function combatDefenseJoueur(gc)
    sac.pokomon[pokomonActif].defense = (sac.pokomon[pokomonActif].defense*2)
    defenseAugmenteeJoueur = true
end



function combatDefenseAdverse(gc)
    pokomonAdverse.defense = (pokomonAdverse.defense*2)
    defenseAugmenteeAdverse = true
end



function combatCapaciteJoueur(gc)
	pokomonAdverse.sante = (pokomonAdverse.sante - (math.floor(sac.pokomon[pokomonActif].capacite.degats/(pokomonAdverse.defense*0.1))))
	if pokomonAdverse.sante < 0 then
		pokomonAdverse.sante = 0
	end
end


function combatCapaciteAdverse(gc)
	sac.pokomon[pokomonActif].sante = (sac.pokomon[pokomonActif].sante - (math.floor(pokomonAdverse.capacite.degats/(sac.pokomon[pokomonActif].defense*0.1))))
	if sac.pokomon[pokomonActif].sante < 0 then
		sac.pokomon[pokomonActif].sante = 0
	end
end



function combatFuirJoueur(gc)
	fuiteEnCours = true
	choixFait = true
	if chanceFuite == 4 then
		chanceFuite = math.random(0 , 100)
	end
	if chanceFuite <= 80 then
		Texte(gc,"Vous avez pris la fuite !",{r=0,v=0,b=0})
	else
		Texte(gc,"Mais le "..pokomonAdverse.nom.." vous barre la route !",{r=0,v=0,b=0})
	end
end



function combatFuirAdverse(gc)
	initialisationTexteCombat = false
	ecran = 3
	deplacements = true
end



function combatAttraper(gc)
	dressageEnCours = true
	if not probaCapture then
		if sac.objets[1].quantite >= 1 then
			chanceCapture = math.random(0 , pokomonAdverse.santeMAX)
			sac.objets[1].quantite = (sac.objets[1].quantite - 1)
			if chanceCapture >= pokomonAdverse.sante then
				captureReussi = true
			else
				captureReussi = false
			end
		else
			captureReussi = nil
		end
		probaCapture = true
	end
	if captureReussi then
		Texte(gc,"Le "..pokomonAdverse.nom.." sauvage a été attrapé !",{r=0,v=0,b=0})
		if affichageText.FinTexte then
			captureReussi = false
			i = 1
			while sac.pokomon[i] ~= nil do
				i = (i + 1)
			end
			sac.pokomon[i] = {nom = pokomonAdverse.nom , defense = pokomonAdverse.defense , santeMAX = pokomonAdverse.santeMAX , sante = pokomonAdverse.sante ,  attaque = pokomonAdverse.attaque , capacite = pokomonAdverse.capacite , front = pokomonAdverse.front , back = pokomonAdverse.back, id = pokomonAdverse.id}
			ecran = 3
			deplacements = true
			menuActive , initialisationTexteCombat = false
		end
	elseif captureReussi == nil then
		Texte(gc,"Vous n'avez plus aucune Pokoball !",{r=0,v=0,b=0})
		if affichageText.FinTexte then
			actionJoueurFinit = true
			dressageEnCours = false
		end
	elseif not captureReussi then
		Texte(gc,"Vous n'avez pas réussi à attraper le "..pokomonAdverse.nom.." sauvage !",{r=0,v=0,b=0})
		if affichageText.FinTexte then
			probaCapture = false
			actionJoueurFinit = true
			dressageEnCours = false
		end
	end
end
    
	
	
function combatChoixAdverse()
    decision = math.random(1 , 100)
    adversaireFuit = false
    adversaireAttaque = false
    adversaireCapacite = false
    if decision <= 5 then
        adversaireFuit = true
    elseif decision > 5 and decision <= 80 then
        adversaireAttaque = true
    else
        adversaireCapacite = true
    end
end


			
function animationActionRapideHautLentBas(x , y)
	for i = 1 , 10 do
		x = (x + 2*i)
		y = (y - 2*i)
	end
	for i = 1 , 20 do
		x = (x - i)
		y = (y + i)
	end
end



function animationActionRapideBasLentHaut(x , y)
	for i = 1 , 20 do
		x = (x - i)
		y = (y + i)
	end
	for i = 1 , 10 do
		x = (x + 2*i)
		y = (y - 2*i)
	end
end



function animationCombatJoueur()
	if animationCombatJoueurHaut then
        if 75 < yImagePokomonJoueurCombat then
            yImagePokomonJoueurCombat = yImagePokomonJoueurCombat - 1
		elseif yImagePokomonJoueurCombat <= 75 then
			animationCombatJoueurHaut = false
		end
	elseif not animationCombatJoueurHaut then
		if yImagePokomonJoueurCombat < 85 then
            yImagePokomonJoueurCombat = yImagePokomonJoueurCombat + 1
        elseif 85 <= yImagePokomonJoueurCombat then
            animationCombatJoueurHaut = true
        end
	end
end



function animationCombatAdversaire()
	if animationCombatAdverseHaut then
        if yImagePokomonAdverseCombat < 13 then
            yImagePokomonAdverseCombat = yImagePokomonAdverseCombat + 1
	    elseif 13 <= yImagePokomonAdverseCombat then
	        animationCombatAdverseHaut = false
	    end
	elseif not animationCombatAdverseHaut then
		if 3 < yImagePokomonAdverseCombat then
            yImagePokomonAdverseCombat = yImagePokomonAdverseCombat - 1
        elseif yImagePokomonAdverseCombat <= 3 then
            animationCombatAdverseHaut = true
        end
	end
end



function combatExecution(gc)
	combatExecutionFin(gc)
	if not texteCombatFinActive then
		if actionCapaciteJoueur then
			Texte(gc,"Votre "..sac.pokomon[pokomonActif].nom.." utilise la capacité "..sac.pokomon[pokomonActif].capacite.nom.." sur "..pokomonAdverse.nom.." !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				actionCapaciteJoueur = false
				actionJoueurFinit = true
				combatCapaciteJoueur(gc)
			end
		elseif actionAttaqueJoueur then
			Texte(gc,"Votre "..sac.pokomon[pokomonActif].nom.." attaque "..pokomonAdverse.nom.." !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				actionAttaqueJoueur = false
				actionJoueurFinit = true
				combatAttaqueJoueur(gc)
			end
		elseif actionDefenseJoueur then
			Texte(gc,"Votre "..sac.pokomon[pokomonActif].nom.." se défend !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				actionDefenseJoueur = false
				actionJoueurFinit = true
				defenseAugmenteeJoueur = true
				combatDefenseJoueur(gc)
			end
		elseif actionAttraperJoueur then
			Texte(gc,"Vous tenter d'attraper le "..pokomonAdverse.nom.." sauvage !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				actionAttraperJoueur = false
				combatAttraper(gc)
			end
		elseif actionFuirJoueur then
			Texte(gc,"Vous tentez de fuir !",{r=0,v=0,b=0})
			if affichageText.FinTexte then
				actionFuirJoueur = false
				combatFuirJoueur(gc)
			end
		end
		combatExecutionFin(gc)
		if not choixAdverseFait then
			combatChoixAdverse()
			choixAdverseFait = true
		end
		if actionJoueurFinit then
			if adversaireCapacite then
				Texte(gc,"Le "..pokomonAdverse.nom.." énnemi utilise la capacité "..pokomonAdverse.capacite.nom.." !" , {r = 0 , v = 0 , b = 0})
				if affichageText.FinTexte then
					adversaireCapacite = false
					combatCapaciteAdverse(gc)
				end
			elseif adversaireAttaque then
				Texte(gc,"Le "..pokomonAdverse.nom.." énnemi attaque !",{r=0,v=0,b=0})
				if affichageText.FinTexte then
					adversaireAttaque = false
					combatAttaqueAdverse(gc)
				end
			elseif adversaireFuit then
				Texte(gc,"Le "..pokomonAdverse.nom.." énnemi a fuit !",{r=0,v=0,b=0})
				if affichageText.FinTexte then
					adversaireFuit = false
					combatFuirAdverse(gc)
				end
			end
			if defenseAugmenteeJoueur then
				sac.pokomon[pokomonActif].defense = (sac.pokomon[pokomonActif].defense/2)
				defenseAugmenteeJoueur = false
			end
			choixObjetFait = false
			menuActif = "menuCombat"
			combatExecutionFin(gc)
			if not texteCombatFinActive and affichageText.FinTexte then
				choixFait , choixAdverseFait , actionJoueurFinit = false
				optionSelect["menuCombatSac"] , optionSelect["menuCombat"] = 1
			end
		end
	end
end



function combatToutEnUn(gc)
	dos = sac.pokomon[pokomonActif].back:copy(sac.pokomon[pokomonActif].back:width()*(H/212),sac.pokomon[pokomonActif].back:height()*(L/318))
	devant = pokomonAdverse.front:copy(pokomonAdverse.front:width()*(H/212),pokomonAdverse.front:height()*(L/318))
	if choixFait == nil then
		choixFait = false
	end
	gc:drawImage(backgroundCombatIMG , 0 , -20*(L/318))
	gc:drawImage(dos, xImagePokomonJoueurCombat*(H/212) , yImagePokomonJoueurCombat*(L/318))
    gc:drawImage(devant, xImagePokomonAdverseCombat*(H/212) , yImagePokomonAdverseCombat*(L/318))
    affichagePV(gc,187*(H/212),85*(L/318),pokomonAdverse)
    affichagePV(gc,10*(H/212),158*(L/318),sac.pokomon[pokomonActif])
    texteMenuCombat = {"Attaque" , "Defense" , "Sac" , "Attraper" , "Fuir"}
    texteMenuCombatAttaque = {"Attaque Clasique" , sac.pokomon[pokomonActif].capacite.nom}
    texteCombatMenuSac = {}
    texteCombatObjetsSac = {}
    indiceTexteCombatMenuSac = 1
    checkNbrObjetsExistants()
    if texteDebutCombatActive then
	    Texte(gc,"Un "..pokomonAdverse.nom.." sauvage apparaît ! Votre "..sac.pokomon[pokomonActif].nom.." est là pour vous défendre ! \n A l'attaque !" , {r = 0 , v = 0 , b = 0})
	    if affichageText.FinTexte then
		    texteDebutCombatActive = false
	    end
    end
    for n = 1 , nbrObjetsExistants do
		if sac.objets[n].quantite > 0 then
		    texteCombatMenuSac[indiceTexteCombatMenuSac] = "X"..sac.objets[n].quantite.." "..sac.objets[n].nom
		    texteCombatObjetsSac[indiceTexteCombatMenuSac] = sac.objets[n].nom
			indiceTexteCombatMenuSac = indiceTexteCombatMenuSac + 1
	    elseif sac.objets[n].quantite == 0 then
			texteCombatObjetsSac[indiceTexteCombatMenuSac] = sac.objets[n].nom
		end
	end
    if not choixFait then
	    menuActive = true
	    if menuActif ~= "menuCombat" and menuActif ~= "menuCombatAttaque" and menuActif ~=  "menuCombatSac" or menuActif == "menuCombat" then
			menuActif = "menuCombat"
			menu(gc , 5 , 5 , texteMenuCombat , "menuCombat" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
		elseif menuActif == "menuCombatAttaque" then
			menu(gc , 5 , 5 , texteMenuCombat , "menuCombat" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
			menu(gc , 95 , 10 , texteMenuCombatAttaque , "menuCombatAttaque" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
		elseif menuActif == "menuCombatSac" then
			menu(gc , 5 , 5 , texteMenuCombat , "menuCombat" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
			menu(gc , 95 , 20 , texteCombatMenuSac , "menuCombatSac" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
		end
		if choixObjetFait then
			if not actionObjet then
				executionObjet(gc)
				actionObjet = true
			end
			if not nilUtilite then
				Texte(gc , "Vous avez utilisé 1 "..texteCombatObjetsSac[optionSelect["menuCombatSac"]].." !",{r=0,v=0,b=0})
				
			elseif nilUtilite then
				Texte(gc,"Vous avez utilisé 1 "..texteCombatObjetsSac[optionSelect["menuCombatSac"]].." ! \n Mais cela n'a aucune utilité ici !",{r=0,v=0,b=0})
				if affichageText.FinTexte then
					affichageText.n=-1
					choixObjetFait = false
					actionObjet = false
				end
			end
		end
	elseif fuiteEnCours then
		combatFuirJoueur(gc)
			if chanceFuite <=80 then
				if affichageText.FinTexte then
					chanceFuite = 4
					ecran = 3
					deplacements = true
					menuActive , initialisationTexteCombat = false
				end
			else
				if affichageText.FinTexte then
					actionJoueurFinit = true
					fuiteEnCours = false
					chanceFuite = 4
				end
			end
	elseif dressageEnCours then
		combatAttraper(gc)
    elseif choixFait and not fuiteEnCours then
		menuActive = false
		actionObjet = false
		combatExecution(gc)
    end
	indiceTexteCombatMenuSac = 1
end



function executionObjet(gc)
    if ecran == 4 then
        if texteCombatObjetsSac[optionSelect["menuCombatSac"]] == "Plante médicinale" then
            if sac.pokomon[pokomonActif].santeMAX > (sac.pokomon[pokomonActif].sante + 10) then
                sac.pokomon[pokomonActif].sante = (sac.pokomon[pokomonActif].sante + 10)
				sac.objets[2].quantite = (sac.objets[2].quantite - 1)
				nilUtilite = false
			else
				sac.pokomon[pokomonActif].sante = sac.pokomon[pokomonActif].santeMAX
            end
        else
			nilUtilite = true
		end
    end
end


function on.charIn(touche)
    if touche == "8" then
        on.arrowUp()
    elseif touche == "2" then
        on.arrowDown()
    elseif touche == "4" then
        on.arrowLeft()
    elseif touche == "6" then
        on.arrowRight()
    elseif touche == "5" then
        on.enterKey()
    elseif touche == "0" then
        on.escapeKey()
    end
    platform.window:invalidate()
end

-- fonction servant aux interfaces utilisateur

function arrondiRempli (gc, x, y, hauteur, largeur, bordure,couleur)
	if hauteur < largeur then
		rayon = math.floor(((bordure/100)*hauteur)/2)
	else
		rayon = math.floor(((bordure/100)*largeur)/2)
	end
	gc:setColorRGB(couleur.r,couleur.v,couleur.b)
	gc:fillRect(x, y+rayon, largeur, hauteur-rayon)
	gc:fillArc(x, y, 2*rayon, 2*rayon, 0, 360)
	gc:fillArc(x+largeur-2*rayon,y, 2*rayon, 2*rayon, 0, 360)
	gc:fillArc(x+largeur-2*rayon, y+hauteur-rayon, 2*rayon, 2*rayon, 0, 360)
	gc:fillArc(x, y+hauteur-rayon, 2*rayon, 2*rayon, 0, 360)
	gc:fillRect(x+rayon,y, largeur-2*rayon, 2*rayon)
	gc:fillRect(x+rayon, y+hauteur-rayon, largeur-2*rayon, 2*rayon)
end

function arrondiBordure (gc, x, y, hauteur, largeur, bordure,couleurExterne,couleurInterne,epaisseur)
	arrondiRempli (gc, x, y, hauteur, largeur, bordure,couleurExterne)
	if largeur>100 and epaisseur<2 then
		apaisseur=epaisseur+1
	end
	arrondiRempli (gc, x+epaisseur, y+epaisseur, math.abs(hauteur-2*epaisseur+1), math.abs(largeur-2*epaisseur), bordure,couleurInterne)
end

function affichagePV(gc , x , y , pokomon)--vieTotale est une var optionnelle
    gc:setFont("serif","r",12)
	arrondiBordure(gc, x , y , 50 , 130 , 15 , {r=0,v=0,b=0},{r=220,v=220,b=220},2)
    arrondiRempli (gc ,  x+20 , y+42, 4 , 100 , 100 , {r=0,v=0,b=0})
    if pokomon.sante < 0 then
        pokomon.sante = 0
    end
    local n = (pokomon.sante)/(pokomon.santeMAX)*100
    gc:drawString(pokomon.sante..'/'..pokomon.santeMAX,x+120-gc:getStringWidth(pokomon.sante..'/'..pokomon.santeMAX),y+20)
    gc:drawString(pokomon.nom,x+7,y+5)
    if n ~= 0 then
        arrondiBordure(gc , x + 20 , y + 42 , 4 ,n , 100,{r=0,v=0,b=0},{r=0,v=255,b=0},1)
    end
end

--Fonction s'occupant de l'écran titre animé
function ecranTitre(gc)
    if abcNuages == -320 then
        abcNuages = 0
    end
    gc:drawImage(ecranTitreIMG , 0 , 0)
    gc:drawImage(ecranTitreNuagesIMG , abcNuages*(H/212) , 156*(L/318))
    gc:drawImage(ecranTitreNuagesIMG , (abcNuages + 320)*(H/212) , 156*(L/318))
    if texteEcranTitre then
        gc:drawImage(ecranTitreTexteIMG , 0 , 0)
    else
        gc:drawImage(ecranTitreTexteEnterIMG , 0 , 0)
    end
    timer.start(0.1)
end

function on.timer() --s'execute par périodes
    if ecran == 1 then --ecran titre
        abcNuages = abcNuages - 1 --nuages se déplaçent vers la gauche
        indiceTimerTexteEcranTitre = indiceTimerTexteEcranTitre + 1 --Toutes les 0.4 sec, le texte clignote
        if indiceTimerTexteEcranTitre == 4 then
            texteEcranTitre = false --texte disparaît
        elseif indiceTimerTexteEcranTitre == 8 then
            texteEcranTitre = true --texte apparaît
            indiceTimerTexteEcranTitre = 0 --l'indice revient à sa valeur par défaut
        end
    elseif ecran == 3 then
	    
		espace:step(0.01)--on dit que l'on fait une mise a joure de l'espace de 0,01 seconde a l'espace
        
		if i > 1 then
			if personnage == persoBas1 and personnaget == persoBast then
				personnage = persoBas
				personnaget = persoBast
			elseif personnage == persoHaut1 and personnaget == persoHaut1t then
				personnage = persoHaut
				personnaget = persoHautt
			elseif personnage == persoDroite1 and personnaget == persoDroite1t then
				personnage = persoDroite
				personnaget = persoDroitet
			elseif personnage == persoGauche1 and personnaget == persoGauche1t then
				print(true)
				personnage = persoGauche
				personnaget = persoGauchet
			end
		end
		
		if i > 1 then -- arrete le joueur s'il n'appuie plus
            joueur:setVel(physics.Vect(0,0))
            i = 0
        end
        i = (i + 1) -- après deux milli secondes
        platform.window:invalidate()
    elseif ecran == 4 then
        if animationCombatAdversaireActivee then
			animationCombatAdversaire()
		end
		if animationCombatJoueurActivee then
			animationCombatJoueur()
	    end
	end
    platform.window:invalidate()
end

function Texte(gc,str,couleur)
	local i=1
	local affichage = {}
	local n = 1
	local mot = ''
	affichage[1] = ''
	if str ~= affichageText.ancienStr or str == affichageText.ancienStr and affichageText.n==-1 then
		affichageText = {n,list={} , ligne,ancienStr = '' , FinTexte = true}
		affichageText.ligne = 0
		while string.byte(str, i) ~= nil do
			
			if string.char( string.byte(str, i))=='\n'then
				n=n+1
				affichage[n]=''
				mot =''
				elseif string.char( string.byte(str, i)) ~=' '   then
				mot = mot ..string.char( string.byte(str, i))
			end
			
			if string.char( string.byte(str, i+1))==' ' or string.char( string.byte(str, i+1))=='' then
				if gc:getStringWidth(affichage[n] .. mot) > platform.window:width()-2*20 then
					
					n=n+1
					affichage[n]=''
					affichage[n]=affichage[n]..mot
					mot=''
					else
					if affichage[n]=='' then
						affichage[n]=affichage[n]..mot
						else
						affichage[n]=affichage[n]..' '..mot
					end
					mot=''
				end
			end
			i=i+1
		end
		affichageText.n = n
		affichageText.list = affichage
		affichageText.ancienStr = str
	end
	
	if str~='' and affichageText.ligne <= affichageText.n-1+(affichageText.n%2) then
	    affichageText.FinTexte = false	
		arrondiBordure(gc,10,platform.window:height()-60,50,platform.window:width()-2*10,20,noir,blanc,1)
		gc:setColorRGB(couleur.r,couleur.v,couleur.b)
		if affichageText.ligne < affichageText.n-2 then
			gc:fillPolygon({platform.window:width()-24 ,   platform.window:height()-14 ,  platform.window:width()-19 ,   platform.window:height()-9 ,  platform.window:width()-14 ,   platform.window:height()-14 , })
		end
		if Entrer == true and affichageText.ligne <= affichageText.n then
			affichageText.ligne = affichageText.ligne+2
			Entrer = false
			
		end
		for i=1+affichageText.ligne ,2+affichageText.ligne ,1 do 
			if i <= affichageText.n then
				gc:drawString(affichageText.list[i],15,platform.window:height()-70+(i-affichageText.ligne)*15)
			end
		end
	else
	affichageText.n = 0
	affichageText.FinTexte = true
	end

end

function menu(gc , abcOrigin , ordOrigin , nomlisteOptions , nomMenu , typeFenetreMenu , justificationPoliceMenu , typePoliceMenu , taillePoliceMenu , couleurPoliceMenu , couleurSelecteur , couleurBordureMenu , couleurBackgroundMenu) --tous les paramètres après "nomMenu" dont des arguments optionnels !
    nbrOptionsAffichees = 0
    nbrOptionsMAX = 1
    ordSelecteur = 15
    ordConstanteOption = 0
    widthMAX = 0
    heightMAX = 0
    direction = {}
    height = {}
    width = {}
	couleurBordure = {}
	typeFenetre = {}
	if typeFenetre[nomMenu] == nil then
		if typePoliceMenu == nil then
			typeFenetre[nomMenu] = typeFenetreDefaut
		else
			typeFenetre[nomMenu] = typePoliceMenu
		end
	end
	if couleurBordure[nomMenu] == nil then
		if couleurBordureMenu == nil then
			couleurBordure[nomMenu] = couleur.Bordure
		else
			couleurBordure[nomMenu] = couleurBordureMenu
		end
	end
	if couleurBackground == nil then
		couleurBackground = {}
	end
	if justifPolice == nil then
	    justifPolice = {}
	end
	if justifPolice[nomMenu] == nil then
		justifPolice[nomMenu] = {}
	end
	if typePolice == nil then
		typePolice = {}
	end
    if typePolice[nomMenu] == nil then
		typePolice[nomMenu] = {}
	end
	if taillePolice == nil then
		taillePolice = {}
	end
	if taillePolice[nomMenu] == nil then
		taillePolice[nomMenu] = {}
	end
	if couleurPolice == nil then
		couleurPolice = {}
	end
    if couleurPolice[nomMenu] == nil then
		couleurPolice[nomMenu] = {}
	end
    if (directionMenu[nomMenu] == nil) or (menuActif ~= nomMenu) then
        directionMenu[nomMenu] = 0
    end
	if optionSelect[nomMenu] == nil then
        optionSelect[nomMenu] = 1
    end
    if premiereOptionAffichee[nomMenu] == nil then
        premiereOptionAffichee[nomMenu] = 1
    end
    while nomlisteOptions[nbrOptionsMAX + 1] ~= nil do
        nbrOptionsMAX = (nbrOptionsMAX + 1)
    end
    indiceTexteActuel = {}
    if couleurSelecteur == nil then
        couleurSelecteur = couleur.Selecteur
    end
    if couleurBackground[nomMenu] == nil then
		if couleurBackgroundMenu == nil then
			couleurBackground[nomMenu] = couleur.Background
		else
			couleurBackground[nomMenu] = couleurBackgroundMenu
		end
    end
    for n = 1 , nbrOptionsMAX do
		if couleurPolice[nomMenu][n] == nil then
			if couleurPoliceMenu == nil then
				couleurPolice[nomMenu][n] = couleur.Defaut
			else
				couleurPolice[nomMenu][n] = couleurPoliceMenu
			end
		end
		if typePolice[nomMenu][n] == nil then
			if typePoliceMenu == nil then
				typePolice[nomMenu][n] = typeTexte
			else
				typePolice[nomMenu][n] = typePoliceMenu
			end
		end
        if justifPolice[nomMenu][n] == nil then
            if justificationPoliceMenu == nil then
				justifPolice[nomMenu][n] = justificationPolice
			else
				justifPolice[nomMenu][n] = justificationPoliceMenu
			end
        end
		if taillePolice[nomMenu][n] == nil then
			if taillePoliceMenu == nil then
				taillePolice[nomMenu][n] = tailleTexte
			else
				taillePolice[nomMenu][n] = taillePoliceMenu
			end
		end
        gc:setFont(typePolice[nomMenu][n] , justifPolice[nomMenu][n] , taillePolice[nomMenu][n])
        width[n] = gc:getStringWidth(nomlisteOptions[n])
        if (width[n] + abcOrigin + 23) > 318 and (taillePolice[nomMenu][n] ~= 6) then
            widthVerif = false
            while widthVerif ~= true do
                if (width[n] + abcOrigin + 23) > 318 then
                    taillePolice[nomMenu][n] = (taillePolice[nomMenu][n] - 1)
                    justifPolice[nomMenu][n] = "b"
                    gc:setFont(typePolice[nomMenu][n] , justifPolice[nomMenu][n] , taillePolice[nomMenu][n])
                    width[n] = gc:getStringWidth(nomlisteOptions[n])
                end
                if taillePolice[nomMenu][n] == 6 then
                    widthVerif = true
                elseif (width[n] + abcOrigin + 23) < 318 then
                    widthVerif = true
                end
            end
        end
        if width[n] > widthMAX then
            widthMAX = width[n]
        end
        if (n + (premiereOptionAffichee[nomMenu] - 1)) <= nbrOptionsMAX then
            height[(n + (premiereOptionAffichee[nomMenu] - 1))] =  gc:getStringHeight(nomlisteOptions[(n + (premiereOptionAffichee[nomMenu]) - 1)])
            if (heightMAX + height[(n + premiereOptionAffichee[nomMenu] - 1)] + ordOrigin + 9) < 211 then --Modif de laformure
                nbrOptionsAffichees = (nbrOptionsAffichees + 1)
                heightMAX = (heightMAX + height[(n + (premiereOptionAffichee[nomMenu] - 1))])
            end
        end
    end
    abcArc = {abcOrigin , (abcOrigin + 2) , (abcOrigin + widthMAX + 17) , (abcOrigin + widthMAX + 15) , abcOrigin , (abcOrigin + 2) , (abcOrigin + widthMAX + 17) , (abcOrigin + widthMAX + 15)}
    ordArc = {ordOrigin , (ordOrigin + 2) , ordOrigin , (ordOrigin + 2) , (heightMAX + ordOrigin + 5) , (heightMAX + ordOrigin + 3) , (heightMAX + ordOrigin + 5) , (heightMAX + ordOrigin + 3)}
    angleArc = {90 , 90 , 0 , 0 , 180 , 180 , 260 , 260}
    abcOriginLine = {(abcOrigin + 5) , (abcOrigin + 7) , (abcOrigin + 5) , (abcOrigin + 7) , (abcOrigin + 2) , (abcOrigin) , (abcOrigin + 27 + widthMAX) , (abcOrigin + widthMAX + 25)}
    ordOriginLine = {ordOrigin , (ordOrigin + 2) , (heightMAX + ordOrigin + 15) , (heightMAX + ordOrigin + 13) , (ordOrigin + 5) , (ordOrigin + 5) , (ordOrigin + 5) , (ordOrigin + 5)}
    abcProgressLine = {(abcOrigin + widthMAX + 22) , (abcOrigin + widthMAX + 20) , (abcOrigin + widthMAX + 22) , (abcOrigin + widthMAX + 20) , (abcOrigin + 2) , (abcOrigin) , (abcOrigin + 27 + widthMAX) , (abcOrigin + widthMAX + 25)}
    ordProgressLine = {ordOrigin , (ordOrigin + 2) , (heightMAX + ordOrigin + 15) , (heightMAX + ordOrigin + 13) , (ordOrigin + heightMAX + 8) , (ordOrigin + heightMAX + 10) , (ordOrigin + heightMAX + 11) , (ordOrigin + heightMAX + 9)}
    gc:setColorRGB(couleurBackground[nomMenu].r , couleurBackground[nomMenu].v , couleurBackground[nomMenu].b)
    if typeFenetre[nomMenu] == 1 then
        gc:fillRect(abcOrigin , ordOrigin , (widthMAX + 23) , ordOriginLine[3] - ordOrigin)
            gc:setColorRGB(couleurBordure[nomMenu].r , couleurBordure[nomMenu].v , couleurBordure[nomMenu].b)
        gc:drawRect(abcOrigin , ordOrigin , (widthMAX + 23) , ordOriginLine[3] - ordOrigin)
    elseif typeFenetre[nomMenu] == 2 then
        gc:fillRect((abcOrigin + 3), ordOrigin , (widthMAX + 20) , (ordOriginLine[3] - ordOrigin))
        gc:fillRect((abcOrigin), (ordOrigin + 3) , (widthMAX + 27) , (ordOriginLine[3] - ordOrigin - 6))
        for u = 1 , 8 do
            gc:fillArc(abcArc[u] , ordArc[u] , 10 , 10 , angleArc[u] , 90)
        end
        gc:setColorRGB(couleurBordure[nomMenu].r , couleurBordure[nomMenu].v , couleurBordure[nomMenu].b)
        for u = 1 , 8 do
            gc:drawArc(abcArc[u] , ordArc[u] , 10 , 10 , angleArc[u] , 90)
            gc:drawLine(abcOriginLine[u] , ordOriginLine[u] , abcProgressLine[u] , ordProgressLine[u])
        end
    elseif typeFenetre[nomMenu] == 3 then
        gc:setColorRGB(couleurBordure[nomMenu].r , couleurBordure[nomMenu].v , couleurBordure[nomMenu].b)
        for i = 1 , 2 do
            if heightMAX < (widthMAX + 26) then
                rayon = math.floor(((20/100)*heightMAX)/2)
            else
                rayon = math.floor(((20/100)*(widthMAX + 26))/2)
            end
            gc:fillRect(abcOrigin , ordOrigin +rayon, (widthMAX + 26), heightMAX-rayon)
            gc:fillArc(abcOrigin , ordOrigin , 2*rayon, 2*rayon, 0, 360)
            gc:fillArc(abcOrigin +(widthMAX + 26)-2*rayon,ordOrigin , 2*rayon, 2*rayon, 0, 360)
            gc:fillArc(abcOrigin +(widthMAX + 26)-2*rayon, ordOrigin +heightMAX-rayon, 2*rayon, 2*rayon, 0, 360)
            gc:fillArc(abcOrigin , ordOrigin +heightMAX-rayon, 2*rayon, 2*rayon, 0, 360)
            gc:fillRect(abcOrigin +rayon,ordOrigin , (widthMAX + 26)-2*rayon, 2*rayon)
            gc:fillRect(abcOrigin +rayon, ordOrigin +heightMAX-rayon, (widthMAX + 26)-2*rayon, 2*rayon)
            if i == 1 then
                abcOrigin = abcOrigin + 3
                ordOrigin = ordOrigin + 3
                heightMAX = heightMAX - 5
                widthMAX = widthMAX - 5
                gc:setColorRGB(couleurBackground[nomMenu].r , couleurBackground[nomMenu].v , couleurBackground[nomMenu].b)
            end
        end
    end
    for n = premiereOptionAffichee[nomMenu] , (nbrOptionsAffichees + premiereOptionAffichee[nomMenu] - 1) do
        gc:setFont(typePolice[nomMenu][n] , justifPolice[nomMenu][n] , taillePolice[nomMenu][n])
        gc:setColorRGB(couleurPolice[nomMenu][n].r , couleurPolice[nomMenu][n].v , couleurPolice[nomMenu][n].b)
        gc:drawString(nomlisteOptions[n] , (abcOrigin + 17) , (ordOrigin + ordConstanteOption + 5))
        ordConstanteOption = ordConstanteOption + height[premiereOptionAffichee[nomMenu]]
		justifPolice[nomMenu][n] = nil
		couleurPolice[nomMenu][n] = nil
		typePolice[nomMenu][n] = nil
		justifPolice[nomMenu][n] = nil
    end
    if directionMenu[nomMenu] == 1 then
        if optionSelect[nomMenu] == 1 then
            premiereOptionAffichee[nomMenu] = (nbrOptionsMAX - nbrOptionsAffichees + 1)
            optionSelect[nomMenu] = nbrOptionsMAX
        elseif optionSelect[nomMenu] == premiereOptionAffichee[nomMenu] then
            premiereOptionAffichee[nomMenu] = (premiereOptionAffichee[nomMenu] - 1)
            optionSelect[nomMenu] = (optionSelect[nomMenu] - 1)
        else
            optionSelect[nomMenu] = (optionSelect[nomMenu] - 1)
        end
    elseif directionMenu[nomMenu] == 3 then
        if optionSelect[nomMenu] == nbrOptionsMAX then
            premiereOptionAffichee[nomMenu] = 1
            optionSelect[nomMenu] = 1
        elseif (optionSelect[nomMenu] - premiereOptionAffichee[nomMenu]) == (nbrOptionsAffichees - 1) then
            premiereOptionAffichee[nomMenu] = (premiereOptionAffichee[nomMenu] + 1)
            optionSelect[nomMenu] = (optionSelect[nomMenu] + 1)
        else
            optionSelect[nomMenu] = (optionSelect[nomMenu] + 1)
        end
    end
    if optionSelect[nomMenu] ~= 1 then
        for i = premiereOptionAffichee[nomMenu] , (optionSelect[nomMenu] - 1) do
            ordSelecteur = (ordSelecteur + height[i])
        end
    end
    gc:setColorRGB(couleurSelecteur.r , couleurSelecteur.v , couleurSelecteur.b)
    gc:fillPolygon({(abcOrigin + 5) , (ordOrigin + ordSelecteur) , (abcOrigin + 15) , (ordOrigin + 5 + ordSelecteur) , (abcOrigin + 5) , (ordOrigin + 10 + ordSelecteur)})
    directionMenu[nomMenu] = 0
	couleurBackground[nomMenu] = nil
	couleurBordure[nomMenu] = nil
end


--Fonction pour l'environnement du joueur


function innitaialisationCarteAncienneSauvegarde()
	
	tableauDeSauvegarde1 =var.recall("tableau1"..indiceSauvegarde)
	tableauDeSauvegarde2 =var.recall("tableau2"..indiceSauvegarde)
	tableauDeSauvegarde3 =var.recall("tableau3"..indiceSauvegarde)
	tableauDeSauvegarde4 =var.recall("tableau4"..indiceSauvegarde)
	tableauDeSauvegarde5 =var.recall("tableau5"..indiceSauvegarde)
	tableauDeSauvegarde6 =var.recall("tableau6"..indiceSauvegarde)
	for ligne=1,100,1 do
        tableau [ligne]={}--creer une ligne dans tableau
        for colonne=1,150,1 do
			
			if ligne <= 50 and colonne <=50 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde1 [ligne][colonne])
			elseif ligne <= 50 and colonne <=100 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde2 [ligne][colonne-50])
			elseif ligne <= 50 and colonne <=150 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde3 [ligne][colonne-100])
			elseif ligne > 50 and colonne <=50 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde4 [ligne-50][colonne])
			elseif ligne > 50 and colonne <=100 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde5 [ligne-50][colonne-50])
			elseif ligne >50 and colonne <=150 then
			tableau [ligne][colonne] = convertionIdTerrainEnElement(tableauDeSauvegarde6 [ligne-50][colonne-100])
			end
		
		end
	end
	personnalisationSauvee = var.recall("personnalisationSauvee")
	if personnalisationSauvee then
		couleur.Selecteur = var.recall("couleur.Selecteur")
		couleur.Defaut = var.recall("couleur.Defaut")
		typeFenetreDefaut = var.recall("typeFenetreDefaut")
		couleur.Background = var.recall("couleur.Background")
		typeTexte = var.recall("typeTexte")
		justificationPolice = var.recall("justificationPolice")
		couleur.Bordure = var.recall("couleur.Bordure")
	end
	return (tableau)
end

function convertionIdTerrainEnElement(id)
	if id == 1 then
		return (Herbe)
	elseif id == 2 then
		return (Sable)
	elseif id == 2.1 then
		return (SableBoD)
	elseif id == 2.2 then
		return (SableBoG)
	elseif id == 2.3 then
		return (SableBoH)
	elseif id == 2.4 then
		return (SableBoB)
	elseif id == 2.5 then
		return (SableBoCHD)
	elseif id == 2.6 then
		return (SableBoCHG)
	elseif id == 2.8 then
		return (SableBoCBG)
	elseif id == 2.9 then
		return (SableBoCBD)
	elseif id == 3 then
		return (SableBoCIBD)
	elseif id == 3.1 then
		return (SableBoCIBG)
	elseif id == 3.2 then
		return (SableBoCIHD)
	elseif id == 3.3 then
		return (SableBoCIHG)
	elseif id == 4 then
		return (HarbreHG)
	elseif id == 4.1 then
		return (HarbreHD)
	elseif id == 4.2 then
		return (HarbreBG)
	elseif id == 4.3 then
		return (HarbreBD)
	elseif id == 4.4 then
		return (Buisson)
	end	
end


function initialisationDeNiveaux()--cette fonction prépare le niveau
    
	
    local CheminMax = ligneM*colonneM/10
    local StatutChemin = true
    local compteurDeChemin = 0    
    for ligne=1,ligneM,1 do
        tableau [ligne]={}--creer une ligne dans tableau
        for colonne=1,colonneM,1 do
            tableau [ligne][colonne]= 1
        end
    end
    for ligne=1,ligneM,1 do
		for colonne=1,colonneM,1 do		 	
		  if colonne==1 and colonne%2==1 and ligne%2==1  or ligne==1 and colonne%2==1 and ligne%2==1 or colonne==colonneM-1 and colonne%2==1 and ligne%2==1  or ligne==ligneM-1 and colonne%2==1 and ligne%2==1 then--permet d'encadrer la carte de mûre sauf au niveau de la sortie
					-- or ligne == 1 and ligne%2==1 or colonne==colonneM and colonne%2==1 or ligne==ligneM and ligne%2==1		
					tableau [ligne][colonne]= HarbreHG
					tableau [ligne][colonne+1]= HarbreHD
					if ligne+1 <= ligneM then
					tableau [ligne+1][colonne]= HarbreBG
                    tableau [ligne+1][colonne+1]= HarbreBD                    
					end
				elseif colonne > 2 and colonne < 13 and ligne >2 and ligne < 13 then
				    tableau [ligne][colonne]= Sable
				elseif tableau [ligne][colonne]== 1  then
				    tableau [ligne][colonne]= Herbe
				end
		
		end
	end
	local colonne = 8
	local ligne = 13
	local mouvement = "bas"
    while compteurDeChemin < CheminMax do
        if mouvement == "droite" then
            if colonneM-5>colonne+15 then
				n = math.random(colonne+10,colonne+15)
            else
				n = math.random(colonne+2,colonneM-5)
            end
			for x=colonne,n,1 do
				tableau [ligne][x] = Sable
				tableau [ligne+1][x] = Sable
				tableau [ligne-1][x] = Sable
				if compteurDeChemin < CheminMax and colonne+1 < colonneM then
					tableau [ligne+1][x+1]= Sable
					tableau [ligne-1][x+1]= Sable
				end
				colonne=x
				compteurDeChemin = compteurDeChemin+1
			end
				if ligne+7 >= ligneM-2 then
					mouvement = "haut"
				elseif ligne-7 <= 2 then 
					mouvement = "bas"
				else
					n = math.random(ligne,ligneM )/ligneM
					if n < 0.5 then
						mouvement = "bas"
					else
						mouvement = "haut"
					end
				end
		elseif mouvement == "bas" then
			if colonne+7 >= colonneM-2 then
				compteurDeChemin = CheminMax
			end
			n = math.random(ligne+2,ligneM-5)
			for x=ligne ,n,1 do
				tableau [x][colonne]= Sable
				tableau [x][colonne+1]= Sable
				tableau [x][colonne-1]= Sable
				if compteurDeChemin < CheminMax then
					tableau [x+1][colonne-1]= Sable
				end
				ligne=x
				compteurDeChemin = compteurDeChemin+1
			end
			mouvement = "droite"
		elseif mouvement == "haut" then
			if colonne+5 >= colonneM-2 then
				compteurDeChemin = CheminMax
			end
			n = math.random(5,ligne-2)
			for x=ligne ,n,-1 do
				tableau [x][colonne]= Sable
				tableau [x][colonne+1]= Sable
				tableau [x][colonne-1]= Sable
				if compteurDeChemin < CheminMax then
					tableau [x-1][colonne-1]= Sable
				end
				ligne=x
				compteurDeChemin = compteurDeChemin+1
			end
			mouvement = "droite"
		end
	end
	
	local g ={}
    for ligne=2,ligneM-1,1 do
		for colonne=2,colonneM-1,1 do			
			if   tableau [ligne][colonne]== Sable then
			  
				if ligne+23 < ligneM-7 or colonne+23<=colonneM or ligne-23 > 7 or colonne-23>7  then
					ok = true
					n=0
					for i=1 ,4,1 do
					
						if tableau [ligne+1][colonne]== Herbe then
							g[i]="bas"
							n=n+1
							
						end
						if tableau [ligne-1][colonne]== Herbe then
							g[i]="haut"
							n=n+1
						end
						if tableau [ligne][colonne+1]== Herbe then
							g[i]="droite"
							n=n+1
						end
						if tableau [ligne][colonne-1]== Herbe then
							g[i]="gauche"
							n=n+1
						end
					end 
					if math.random(0,100)<=100 and n~=0 then 
						n = math.random(1,n)
						n= g[n]
						
						if n=="bas" then
							for ligne1=ligne+1,ligne+24,1 do
								for colonne1=colonne,colonne+24,1 do
									
									if ligne1 >= ligneM-2 or colonne1 >= colonneM-2 or ligne1 <= 2 or colonne1 <= 2 then 
										ok = false
									elseif tableau [ligne1][colonne1-13]~=Herbe then 
									    ok = false	
									end
									
								end
							end
							
							if ok  then
								for ligne1=1,23,1 do
									for colonne1=1,23,1 do
										if ligne1>=11 and ligne1<=12 and colonne1<23 and colonne1>2 then
											tableau [ligne1+ligne][colonne1+colonne-13]= Sable
										elseif colonne1>=11 and colonne1<=14 and ligne1<23 then
											tableau [ligne1+ligne][colonne1+colonne-13]= Sable
										elseif colonne1==1 and colonne1%2==1 and ligne1%2==1  or ligne1==1 and colonne1%2==1 and ligne1%2==1 or colonne1==23 and colonne1%2==1 and ligne1%2==1  or ligne1==23 and colonne1%2==1 and ligne1%2==1 then--permet d'encadrer la carte de mûre sauf au niveau de la sortie-- or ligne1 == 1 and ligne1%2==1 or colonne==colonneM and colonne%2==1 or ligne1==ligne1M and ligne1%2==1		
											tableau [ligne1+ligne][colonne1+colonne-13]= HarbreHG
											tableau [ligne1+ligne][colonne1+1+colonne-13]= HarbreHD
											if ligne1+1 <= ligne+24 then
												tableau [ligne1+1+ligne][colonne1+colonne-13]= HarbreBG
												tableau [ligne1+1+ligne][colonne1+1+colonne-13]= HarbreBD                    
											end
										elseif colonne1%2==1 and ligne1%2==1 then
											if math.random(0,100)<=math.random(15,50) then
												tableau [ligne1+ligne][colonne1+colonne-13]= HarbreHG
												tableau [ligne1+ligne][colonne1+1+colonne-13]= HarbreHD
												if ligne1+1 <= ligne+24 then
													tableau [ligne1+1+ligne][colonne1+colonne-13]= HarbreBG
													tableau [ligne1+1+ligne][colonne1+1+colonne-13]= HarbreBD                    
												end
											end
										end
									end
								end
								for ligne1=1,23,1 do	
									for colonne1=1,23,1 do
										if tableau [ligne1+ligne][colonne1+colonne-13]==Herbe then 
											tableau [ligne1+ligne][colonne1+colonne-13]= Buisson
										end
									end
								end
							end
						elseif n=="droite" then
							for ligne1=ligne,ligne+24,1 do
								for colonne1=colonne+1,colonne+24,1 do
									
									if ligne1 >= ligneM-2 or colonne1 >= colonneM-2 or ligne1-13<2 or colonne1<2 then 
										ok = false
									elseif tableau [ligne1-13][colonne1]~=Herbe then 
									    ok = false	
									end
									
								end
							end
							
							if ok  then
								for ligne1=1,23,1 do
									for colonne1=1,23,1 do
										if ligne1>=11 and ligne1<=14 and colonne1<23 then
											tableau [ligne1+ligne-13][colonne1+colonne]= Sable
										elseif colonne1>=11 and colonne1<=12 and ligne1>2 and ligne1<23 then
											tableau [ligne1+ligne-13][colonne1+colonne]= Sable
										elseif colonne1==1 and colonne1%2==1 and ligne1%2==1  or ligne1==1 and colonne1%2==1 and ligne1%2==1 or colonne1==23 and colonne1%2==1 and ligne1%2==1  or ligne1==23 and colonne1%2==1 and ligne1%2==1 then--permet d'encadrer la carte de mûre sauf au niveau de la sortie-- or ligne1 == 1 and ligne1%2==1 or colonne==colonneM and colonne%2==1 or ligne1==ligne1M and ligne1%2==1		
											tableau [ligne1+ligne-13][colonne1+colonne]= HarbreHG
											tableau [ligne1+ligne-13][colonne1+1+colonne]= HarbreHD
											if ligne1+1 <= ligne+24 then
												tableau [ligne1+1+ligne-13][colonne1+colonne]= HarbreBG
												tableau [ligne1+1+ligne-13][colonne1+1+colonne]= HarbreBD                    
											end
										elseif colonne1%2==1 and ligne1%2==1 then
											if math.random(0,100)<=math.random(15,50) then
												tableau [ligne1+ligne-13][colonne1+colonne]= HarbreHG
												tableau [ligne1+ligne-13][colonne1+1+colonne]= HarbreHD
												if ligne1+1 <= ligne+24 then
													tableau [ligne1+1+ligne-13][colonne1+colonne]= HarbreBG
													tableau [ligne1+1+ligne-13][colonne1+1+colonne]= HarbreBD                    
												end
											end
										end
									end
								end
								for ligne1=1,23,1 do	
									for colonne1=1,23,1 do
										if tableau [ligne1+ligne-13][colonne1+colonne]==Herbe then 
											tableau [ligne1+ligne-13][colonne1+colonne]= Buisson
										end
									end
								end
							end
						end
					end
				end
			end
        end
    end

	
	for ligne=3,ligneM-3,1 do
		for colonne=3,colonneM-3,1 do
		
			if colonne%2==1 and ligne%2==1 and tableau [ligne][colonne]==Herbe and tableau [ligne][colonne+1]==Herbe and tableau [ligne+1][colonne]==Herbe and tableau [ligne+1][colonne+1]==Herbe then
				if math.random(0,100)<=math.random(15,50) then
					tableau [ligne][colonne]= HarbreHG
					tableau [ligne][colonne+1]= HarbreHD
					if ligne+1 <= ligne+24 then
						tableau [ligne+1][colonne]= HarbreBG
						tableau [ligne+1][colonne+1]= HarbreBD                    
					end
				end
			end
		end
	end
	
	for ligne=3,ligneM-8,5 do
		for colonne=3,colonneM-8,5 do
		
			
				if math.random(0,100)<=math.random(75,100) then                       
					for ligne1=1,5,1 do
						for colonne1=1,5,1 do
						  if   tableau [ligne+ligne1][colonne+colonne1]==Herbe then
							tableau [ligne+ligne1][colonne+colonne1]= Buisson
						  end
						end
					end
				end
			end
		end
	
	
	
	
    for ligne=2,ligneM-1,1 do
    
		for colonne=2,colonneM-1,1 do
			if tableau [ligne][colonne]== Sable then 
				if tableau [ligne][colonne+1].id == 1 or tableau [ligne][colonne+1].id >=4 and tableau [ligne][colonne+1].id <5     then
					tableau [ligne][colonne]=SableBoD
				elseif tableau [ligne][colonne-1].id == 1 or tableau [ligne][colonne-1].id >=4 and tableau [ligne][colonne-1].id <5 then
					tableau [ligne][colonne]=SableBoG
				elseif tableau [ligne-1][colonne].id == 1 or tableau [ligne-1][colonne].id >=4 and tableau [ligne-1][colonne].id <5 then
					tableau [ligne][colonne]=SableBoH
				elseif tableau [ligne+1][colonne].id == 1 or tableau [ligne+1][colonne].id >=4 and tableau [ligne+1][colonne].id <5 then
					tableau [ligne][colonne]=SableBoB
				end
			end
        end
    end

    for ligne=2,ligneM-1,1 do
        for colonne=2,colonneM-1,1 do
            if tableau [ligne][colonne].id >= 2 and tableau [ligne][colonne].id < 3 and tableau [ligne][colonne] ~= nil  then   
				if tableau [ligne][colonne] == SableBoD and tableau [ligne][colonne-1] == SableBoH  then
					tableau [ligne][colonne] = SableBoCHD
				elseif tableau [ligne][colonne] == SableBoG and tableau [ligne][colonne+1] == SableBoH  then            
					tableau [ligne][colonne] = SableBoCHG
				elseif tableau [ligne][colonne] == SableBoG and tableau [ligne][colonne+1] == SableBoB  then                  
					tableau [ligne][colonne] = SableBoCBD
				elseif tableau [ligne][colonne] == SableBoD and tableau [ligne][colonne-1] == SableBoB  then                                                  
					tableau [ligne][colonne] = SableBoCBG    
				elseif tableau [ligne+1][colonne] == SableBoD and tableau [ligne][colonne+1] == SableBoB  then                                                  
					tableau [ligne][colonne] = SableBoCIBD 
				elseif tableau [ligne+1][colonne] == SableBoG and tableau [ligne][colonne-1] == SableBoB  then                                                        
					tableau [ligne][colonne] = SableBoCIBG   
				elseif tableau [ligne-1][colonne] == SableBoD and tableau [ligne][colonne+1] == SableBoH or tableau [ligne-1][colonne] == SableBoD and tableau [ligne][colonne+1] == SableBoCHD  then                                                                                              
					tableau [ligne][colonne] = SableBoCIHD
				elseif tableau [ligne-1][colonne] == SableBoG and tableau [ligne][colonne-1] == SableBoH or  tableau [ligne-1][colonne] == SableBoCHG and tableau [ligne][colonne-1] == SableBoH  then                                                  				
					tableau [ligne][colonne] = SableBoCIHG
                                           
				end
            
            end
            
        end
    end
	conversionCartePourSauvegarde ()
	initialisation = false-- on terminine l'inisialisation pour que la carte des mur ne chage pas a chaque foix que la fonction on.paint se rafraichit
	on.save()
	return tableau-- on retourne la variable tableau pour pouvoir l'utilisé dans la fonction on.paint
end


function conversionCartePourSauvegarde () 

    tableauDeSauvegarde1 ={}
	tableauDeSauvegarde2 ={}
	tableauDeSauvegarde3 ={}
	tableauDeSauvegarde4 ={}
	tableauDeSauvegarde5 ={}
	tableauDeSauvegarde6 ={}
	
	for ligne=1,50,1 do
        tableauDeSauvegarde1 [ligne]={}--creer une ligne dans tableau
        for colonne=1,50,1 do
            tableauDeSauvegarde1 [ligne][colonne]= tableau [ligne][colonne].id 
		end
	end
    
	for ligne=1,50,1 do
        tableauDeSauvegarde2 [ligne]={}--creer une ligne dans tableau
        for colonne=51,100,1 do
            tableauDeSauvegarde2 [ligne][colonne-50]= tableau [ligne][colonne].id 
		end
	end
    
	for ligne=1,50,1 do
        tableauDeSauvegarde3 [ligne]={}--creer une ligne dans tableau
        for colonne=101,150,1 do
            tableauDeSauvegarde3 [ligne][colonne-100]= tableau [ligne][colonne].id 
		end
	end
	
	
	for ligne=51,100,1 do
        tableauDeSauvegarde4 [ligne-50]={}--creer une ligne dans tableau
        for colonne=1,50,1 do
            tableauDeSauvegarde4 [ligne-50][colonne]= tableau [ligne][colonne].id 
		end
	end
    
	for ligne=51,100,1 do
        tableauDeSauvegarde5 [ligne-50]={}--creer une ligne dans tableau
        for colonne=51,100,1 do
            tableauDeSauvegarde5 [ligne-50][colonne-50]= tableau [ligne][colonne].id 
		end
	end
    
	for ligne=51,100,1 do
        tableauDeSauvegarde6 [ligne-50]={}--creer une ligne dans tableau
        for colonne=101,150,1 do
            tableauDeSauvegarde6 [ligne-50][colonne-100]= tableau [ligne][colonne].id 
		end
	end

end


function Collision(posX,posY,velX, velY)        

     
    testY =math.floor((posY+10)/taillemur+1)--la fonction ceil fait un arrondi a l'inférieur  pour le  coté Droit et le Haut
    testX = math.floor((posX+10)/taillemur+1)-- on convertie les coordoné du joueur en nombre de mur
   
    if testY-1 > 0 and testY+1 <= ligneM and testX-1 > 0 and testX+1 <= colonneM  then
        
		if tableau[testY][testX]==Buisson and trouveUnPokomon and sac.pokomon[pokomonActif].sante > 0 then
		ecran = 4
		combatExecutionDebut()
		trouveUnPokomon = false
		else
			trouveUnPokomon = false
		end
		
        if tableau[testY-1][testX].collision == true  then --s'il y a un mur on empeche de passer par cette case
            h=0.5                               
            if posY < ((testY-1)*taillemur) then
                posY = ((testY-1)*taillemur)
                joueur:setVel( physics.Vect(0,0))
                
            end    
        else
            h=1
		end
        if tableau[testY][testX-1].collision == true then --s'il y a un mur on empeche de passer par cette case
            g=0.5
			if posX < ((testX-1)*taillemur) then
                posX = ((testX-1)*taillemur)
                joueur:setVel( physics.Vect(0,0))
            end
		else
			g=1
        end
                  
        if tableau[testY+1][testX].collision == true then --s'il y a un mur on empeche de passer par cette case                                   
			b=0.5
            if posY+hauteurPersonnage > ((testY)*taillemur) then                                   
                posY = ((testY)*taillemur-hauteurPersonnage)
                joueur:setVel( physics.Vect(0,0))
            end
		else
			b=1
        end
                                    
        if tableau[testY][testX+1].collision == true then --s'il y a un mur on empeche de passer par cette case      
			d=0.5
            if posX+largeurPersonnage > ((testX)*taillemur) then
                posX = ((testX)*taillemur-largeurPersonnage)
                velX = 0
                joueur:setVel( physics.Vect(0,0))
            end
		else
			d=1
        end
                                         
    end
                
    testY =math.floor((posY+hauteurPersonnage/1.45)/taillemur+1)--la fonction ceil fait un arrondi a l'inférieur  pour le  coté Droit et le Haut
    testX = math.floor((posX+largeurPersonnage/1.45)/taillemur+1)-- on convertie les coordoné du joueur en nombre de mur

    if testY-1 > 0 and testY+1 <= ligneM and testX-1 > 0 and testX+1 <= colonneM  then
        
		if tableau[testY][testX]==Buisson and trouveUnPokomon and sac.pokomon[pokomonActif].sante > 0 then
			ecran = 4
			combatExecutionDebut()
			trouveUnPokomon = false
		else
			trouveUnPokomon = false
		end
		
		
        if tableau[testY-1][testX].collision == true then --s'il y a un mur on empeche de passer par cette case
            h1=0.5                                
            if posY < ((testY-1)*taillemur) then
                posY = ((testY-1)*taillemur)
                joueur:setVel( physics.Vect(0,0))
            end    
        else
			h1=1	
		end
        if tableau[testY][testX-1].collision == true then --s'il y a un mur on empeche de passer par cette case
            g1=0.5
			if posX < ((testX-1)*taillemur) then
                posX = ((testX-1)*taillemur)
                joueur:setVel( physics.Vect(0,0))
            end
		else
			g1=1
        end
                  
        if tableau[testY+1][testX].collision == true then --s'il y a un mur on empeche de passer par cette case                                   
			b1=0.5
            if posY+hauteurPersonnage > ((testY)*taillemur) then                                   
                posY = ((testY)*taillemur-hauteurPersonnage)
                joueur:setVel( physics.Vect(0,0))
            end
		else
			b1=1
        end
                                    
        if tableau[testY][testX+1].collision == true then --s'il y a un mur on empeche de passer par cette case      
			d=0.5
            if posX+largeurPersonnage > ((testX)*taillemur) then
                posX = ((testX)*taillemur-largeurPersonnage)
                joueur:setVel( physics.Vect(0,0))
            end
		else
			d1=1
        end
                                         
    end
    if h<h1 then
		h=h1
    end
	if g<g1 then
		g=g1
    end
	if d<d1 then
		d=d1
    end
	if b<b1 then
		b=b1
    end
    return posX,posY,velX,velY
end


function AffichageEtDecoupageDeLaCarteEtDuJoueur (gc,posX,posY,tableau)

	if posX<math.floor((platform.window:width())/(taillemur*2))*taillemur then
        AffichagePosX=posX
        testX=math.floor((platform.window:width())/(taillemur*2))
        murPosX=taillemur*math.floor((platform.window:width())/(taillemur*2))
    else
        AffichagePosX=math.floor((platform.window:width())/(taillemur*2))*taillemur
        murPosX=posX
    end
    if posY< math.floor((platform.window:height())/(taillemur*2))*taillemur then
        AffichagePosY=posY
        testY=math.floor((platform.window:height())/(taillemur*2))
        murPosY=taillemur*math.floor((platform.window:height())/(taillemur*2))
    else
        AffichagePosY=math.floor((platform.window:height())/(taillemur*2))*taillemur
        murPosY=posY   
    end
		
    if posX >(colonneM-math.floor((platform.window:width())/(taillemur*2))-(math.floor((platform.window:width())/(taillemur))%2)-1)*taillemur then
        AffichagePosX=posX-(colonneM-math.floor((platform.window:width())/(taillemur))-1)*taillemur
        testX=colonneM-math.floor((platform.window:width())/(taillemur*2))
	murPosX=taillemur*(colonneM-math.floor((platform.window:width())/(taillemur*2))-(math.floor((platform.window:width())/(taillemur))%2)-1)
    end
  
    if posY>(ligneM- math.floor((platform.window:height())/(taillemur*2)) - (math.floor((platform.window:height())/(taillemur))%2) -1)*taillemur then
        AffichagePosY=posY-(ligneM- math.floor((platform.window:height())/(taillemur))-1)*taillemur
        testY=ligneM-math.floor((platform.window:height())/(taillemur*2))
        murPosY=taillemur*(ligneM- math.floor((platform.window:height())/(taillemur*2)) - (math.floor((platform.window:height())/(taillemur))%2) -1)
       
    end
   
    for ligne=testY-math.floor((platform.window:height())/(taillemur*2))-1,testY+math.floor((platform.window:height())/(taillemur*2))+2,1 do-- ici on interprete la liste pour faire apparaitre graphiquement c'est un peut comme dans l'exercice de la frise
        for colonne = testX-math.floor((platform.window:width())/(taillemur*2))-2,testX+math.floor((platform.window:width())/(taillemur*2))+2,1 do
            if ligne > 0 and ligne <=  ligneM and colonne > 0 and colonne <= colonneM then 
				
				if tableau [ligne][colonne] ~= nil then
					gc:drawImage(tableau [ligne][colonne].tex,(colonne+math.floor((platform.window:width())/(taillemur*2))-1)*taillemur-murPosX,(ligne+math.floor((platform.window:height())/(taillemur*2))-1)*taillemur-murPosY)
                
               
				end
            end
        end
    end
    gc:drawImage(personnage,AffichagePosX, AffichagePosY)-- on place le joueur graphiquement
	for ligne=testY-math.floor((platform.window:height())/(taillemur*2))-1,testY+math.floor((platform.window:height())/(taillemur*2))+3,1 do-- ici on interprete la liste pour faire apparaitre graphiquement c'est un peut comme dans l'exercice de la frise
           for colonne = testX-math.floor((platform.window:width())/(taillemur*2))-1,testX+math.floor((platform.window:width())/(taillemur*2))+2,1 do
               if ligne > 0 and ligne <=  ligneM and colonne > 0 and colonne <= colonneM then 
                   
                   if tableau [ligne][colonne] ~= nil then
                       
                   
                   
                   if tableau [ligne][colonne].texD ~= nil then
                                       gc:drawImage(tableau [ligne][colonne].texD,(colonne+math.floor((platform.window:width())/(taillemur*2))-1)*taillemur-murPosX,(ligne+math.floor((platform.window:height())/(taillemur*2))-1)*taillemur-murPosY)
                                   end        
                   end
               end
		   end
       
	   end

	 gc:drawImage(personnaget,AffichagePosX, AffichagePosY-6)-- on place le joueur graphiquement
	for ligne=testY-math.floor((platform.window:height())/(taillemur*2))-1,testY+math.floor((platform.window:height())/(taillemur*2))+3,1 do-- ici on interprete la liste pour faire apparaitre graphiquement c'est un peut comme dans l'exercice de la frise
           for colonne = testX-math.floor((platform.window:width())/(taillemur*2))-1,testX+math.floor((platform.window:width())/(taillemur*2))+2,1 do
               if ligne > 0 and ligne <=  ligneM and colonne > 0 and colonne <= colonneM then 
                   
                   if tableau [ligne][colonne] ~= nil then
                       
                   
                   
                   if tableau [ligne][colonne].texS ~= nil then
                                       gc:drawImage(tableau [ligne][colonne].texS,(colonne+math.floor((platform.window:width())/(taillemur*2))-1)*taillemur-murPosX,(ligne+math.floor((platform.window:height())/(taillemur*2))-2)*taillemur-murPosY)
                                   end        
                   end
               end
			   end
       end
end

function Defaite(gc)
	gc:fillRect(0,0,L,H)
	if affichageText.FinTexte then
	conseil = {"Si le pokomon adverse à plus de points de vie que le votre taché de fuire.","Utilisez en priorité les capacités de votre pokomon.","N'oubliez pas de soigné votre pokomon aprés chaque combat.","Utilisez des objets de soin durant le combat n'ayez pas peur d'en gaché il est facile d'en regagner."}
	g = math.random(1,4)
	end
	Texte(gc,"Vous savez, il arrive a tout le monde de perdre. \n Le plus important c'est de se relever, alors après vous pourrez gagner. \n Je vais vous donnez un petit conseil pour que cela ne reproduis pas. \n "..conseil[g].." \n je vais maintenant procéder au soin de votre pokomon actif \n ... \n voilà qui est fait ! Bon jeux !!",{r=0,v=0,b=0})
	if affichageText.FinTexte then
		sac.pokomon[pokomonActif].sante=sac.pokomon[pokomonActif].santeMAX
		ecran = 3
		deplacements = true
		g = nil
		conseil = nil
	end
end

function menuEcranDeux(gc)
	if menuActif == "menuExploration" then
	    deplacements = false
		menuActive = true
		texteMenuExploration = {"Sac" , "Paramètres" , "Sauvegarder la partie" , "Retour" , "Quitter" , "Triche"}
		justifPolice = {}
		couleurBackgroundMenu = {}
		justifPolice["menuExploration"] = {}
		justifPolice["menuExploration"][6] = "i"
		couleurPolice = {}
		couleurPolice["menuExploration"] = {}
		couleurPolice["menuExploration"][6] = couleur.RougeComplet
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
	elseif menuActif == "menuReglages" then
		texteReglages = {"Menu : Couleur Sélecteur" , "Menu : Couleur des textes" , "Menu : Types de fenêtres" , "Menu : Couleur du fond" , "Menu : Type de police" , "Menu : Justification Police" , "Menu : Couleur Bordures"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20 , 20 , texteReglages , "menuReglages")
	elseif menuActif == "menuCouleurSelecteur" then
		texteCouleurSelecteur = {"Noir" , "Blanc" , "Rouge" , "Vert" , "Bleu"}
		couleurPolice["menuCouleurSelecteur"] = {}
		couleurPolice["menuCouleurSelecteur"][1] = couleur.Noir
		couleurPolice["menuCouleurSelecteur"][2] = couleur.Noir
		couleurPolice["menuCouleurSelecteur"][2] = couleur.Blanc
		couleurPolice["menuCouleurSelecteur"][3] = couleur.RougeComplet
		couleurPolice["menuCouleurSelecteur"][4] = couleur.VertComplet
		couleurPolice["menuCouleurSelecteur"][5] = couleur.BleuComplet
		if optionSelect["menuCouleurSelecteur"] == 2 then
			couleurBackground["menuCouleurSelecteur"] = couleur.Noir
		else
			couleurBackground["menuCouleurSelecteur"] = couleur.Background
		end
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteCouleurSelecteur , "menuCouleurSelecteur")
	elseif menuActif == "menuCouleurTextes" then
		texteCouleurTextes = {"Noir" , "Blanc" , "Rouge" , "Vert" , "Bleu"}
		couleurPolice["menuCouleurTextes"] = {}
		couleurPolice["menuCouleurTextes"][1] = couleur.Noir
		couleurPolice["menuCouleurTextes"][2] = couleur.Blanc
		couleurPolice["menuCouleurTextes"][3] = couleur.RougeComplet
		couleurPolice["menuCouleurTextes"][4] = couleur.VertComplet
		couleurPolice["menuCouleurTextes"][5] = couleur.BleuComplet
		if optionSelect["menuCouleurTextes"] == 2 then
			couleurBackground["menuCouleurTextes"] = couleur.Noir
		else
			couleurBackground["menuCouleurTextes"] = couleur.Background
		end
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteCouleurTextes , "menuCouleurTextes")
	elseif menuActif == "menuTypesFenetres" then
		texteMenuTypesFenetres = {"Fenêtres rectangulaires" , "Fenêtres Originales" , "Fenêtres Minimalistes"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteMenuTypesFenetres , "menuTypesFenetres")
	elseif menuActif == "menuCouleurFond" then
		texteMenuCouleurFond = {"Noir" , "Blanc" , "Rouge" , "Vert" , "Bleu"}
		couleurPolice["menuCouleurFond"] = {}
		couleurPolice["menuCouleurFond"][1] = couleur.Noir
		couleurPolice["menuCouleurFond"][2] = couleur.Blanc
		couleurPolice["menuCouleurFond"][3] = couleur.RougeComplet
		couleurPolice["menuCouleurFond"][4] = couleur.VertComplet
		couleurPolice["menuCouleurFond"][5] = couleur.BleuComplet
		if optionSelect["menuCouleurFond"] == 2 then
			couleurBackground["menuCouleurFond"] = couleur.Noir
		else
			couleurBackground["menuCouleurFond"] = couleur.Background
		end
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteMenuCouleurFond , "menuCouleurFond")
	elseif menuActif == "menuTypePolice" then
		texeMenuTypePolice = {"Type 1" , "Type 2"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texeMenuTypePolice , "menuTypePolice")
	elseif menuActif == "menuJustificationPolice" then
		texteMenuJustificationPolice = {"Normal" , "Italique" , "Gras" , "Gras et italique"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteMenuJustificationPolice , "menuJustificationPolice")
	elseif menuActif == "menuCouleurBordures" then
		texteMenuCouleurBordures = {"Noir" , "Blanc" , "Rouge" , "Vert" , "Bleu"}
		couleurPolice["menuCouleurBordures"] = {}
		couleurPolice["menuCouleurBordures"][1] = couleur.Noir
		couleurPolice["menuCouleurBordures"][2] = couleur.Blanc
		couleurPolice["menuCouleurBordures"][3] = couleur.RougeComplet
		couleurPolice["menuCouleurBordures"][4] = couleur.VertComplet
		couleurPolice["menuCouleurBordures"][5] = couleur.BleuComplet
		if optionSelect["menuCouleurBordures"] == 2 then
			couleurBackground["menuCouleurBordures"] = couleur.Noir
		else
			couleurBackground["menuCouleurBordures"] = couleur.Background
		end
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteReglages , "menuReglages")
		menu(gc , 30*(L/318) , 30 , texteMenuCouleurBordures , "menuCouleurBordures")
	elseif menuActif == "menuSacExploration" then
		texteMenuSacExploration = {"Pokodex" , "Mes pokomon" , "Objets"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteMenuSacExploration , "menuSacExploration")
	elseif menuActif == "menuPokodex" then
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteMenuSacExploration , "menuSacExploration")
		menu(gc , 30*(L/318) , 30 , listeNomPoko , "menuPokodex")
		vignettePokomon(gc , L-65 , H-170 ,{r=0,v=0,b=0} , optionSelect["menuPokodex"] , 0.5/(H/212))
		affichagePV(gc , L-130 , H-100 , pokodex[optionSelect["menuPokodex"]])
	elseif menuActif == "menuChoixPokomon" then
		sauvegardeInventaire()
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteMenuSacExploration , "menuSacExploration")
		menu(gc , 30*(L/318) , 30 , nomPokomon, "menuChoixPokomon")
		vignettePokomon(gc , L-65 , H-170 ,{r=0,v=0,b=0} , sac.pokomon[optionSelect["menuChoixPokomon"]].id , 0.5/(H/212))
		affichagePV(gc , L-130 , H-100 , sac.pokomon[optionSelect["menuChoixPokomon"]])
	elseif menuActif == "menuObjet" then
		local texteMenuObjet = {"Pokoball x"..sac.objets[1].quantite , "Plante médicinale x"..sac.objets[2].quantite}	
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteMenuSacExploration , "menuSacExploration")
		menu(gc , 10*(L/318) , 30 , texteMenuObjet, "menuObjet")
		if selection then
			Texte (gc,sac.objets[optionSelect["menuObjet"]].description,{r=0,v=0,b=0})
			if affichageText.FinTexte then
				affichageText.n = -1
				selection = nil
			end
		end
	elseif menuActif == "menuDecisionPokomon" then
		sauvegardeInventaire()
		texteMenuDecision = {"Définir comme Pokomon actif", "Utiliser plante médicinale (X"..sac.objets[2].quantite..")"}
		menu(gc , 10 , 10 , texteMenuExploration , "menuExploration")
		menu(gc , 20*(L/318) , 20 , texteMenuSacExploration , "menuSacExploration")
		menu(gc , 30*(L/318) , 30 , nomPokomon , "menuChoixPokomon")
		menu(gc , 40*(L/318) , 40 , texteMenuDecision , "menuDecisionPokomon")
		if choixChangement then
			if (sac.pokomon[optionSelect["menuChoixPokomon"]].sante > 0) then
				Texte(gc , "Le Pokomon actif de votre équipe est à présent :"..sac.pokomon[optionSelect["menuChoixPokomon"]].nom,couleur.Noir)
				if affichageText.FinTexte  then
					pokomonActif = optionSelect["menuChoixPokomon"]
					menuActif = "menuChoixPokomon"
					choixChangement = nil
					affichageText.n = -1
				end
			else
				Texte(gc , sac.pokomon[optionSelect["menuChoixPokomon"]].nom.." ne peut pas être votre Pokomon actif dans cet état ! Prenez d'abord soin de lui en lui donnant des plantes médicinales",{r=0,v=0,b=0})
				if affichageText.FinTexte  then	
					menuActif = "menuChoixPokomon"
					choixChangement = nil
					affichageText.n = -1
				end
			end
		elseif choixSoin then
			if sac.pokomon[optionSelect["menuChoixPokomon"]].sante < sac.pokomon[optionSelect["menuChoixPokomon"]].santeMAX-10 and sac.objets[2].quantite>0 then
				Texte(gc , "Vous soignez :"..sac.pokomon[optionSelect["menuChoixPokomon"]].nom..". Il récupère ainsi 10 points de vie",{r=0,v=0,b=0})
				if affichageText.FinTexte then
					sac.pokomon[optionSelect["menuChoixPokomon"]].sante = (sac.pokomon[optionSelect["menuChoixPokomon"]].sante + 10)
					sac.objets[2].quantite = (sac.objets[2].quantite - 1)
					menuActif = "menuChoixPokomon"
					choixChangement = nil
					affichageText.n = -1
				end
			elseif sac.objets[2].quantite <= 0 then
				Texte(gc , "Vous n'avez plus aucune plante médicinale !",{r=0,v=0,b=0})
				if affichageText.FinTexte then	
					menuActif = "menuChoixPokomon"
					choixSoin = nil
					affichageText.n = -1
				end
			else
				Texte(gc , sac.pokomon[optionSelect["menuChoixPokomon"]].nom.." n'a pas assez perdu de vie pour être soigné",{r=0,v=0,b=0})
				if affichageText.FinTexte then	
					menuActif = "menuChoixPokomon"
					choixSoin = nil
					affichageText.n = -1
				end
			end
		end
	end
end

function Gain(gc)
	gc:setColorRGB(100,255,100)
	gc:fillRect(0,0,L,H)
	Texte(gc,"L'adversaire laisse tomber 5 Plantes médicinales que vous mettez dans votre sac !",{r=0,v=0,b=0})
	if affichageText.FinTexte then
		ecran = 3
		deplacements = true
		sac.objets[2].quantite = (sac.objets[2].quantite + 5)
	end
end
--EXECUTION DES FONCTIONS



--Fonction d'affichage
function on.paint(gc)
    if ecran == 1 then
        ecranTitre(gc)
		
        --gc:fillPolygon({abcPointenhaut a gauche , ordPointenhaut a gauche , abcPointenhaut a droite , ordPointenhaut a droite, abcPointenbas a droite ,ordPointenbas a droite, 100,0, 0,0
    elseif ecran == 2 then
        texteMenuPrincipal = { "Jouer" , "Long texte qui montre comment le menu s'adapte"}
        gc:setColorRGB(40 , 200 , 100)
        gc:fillRect(0 , 0 , 1000 , 1000)
        menuActive = true
        
        if menuActif == "menuPrincipal" then
				menu(gc , 10 , 10 , texteMenuPrincipal , "menuPrincipal" , typeFenetreMenu , nil , nil , nil , nil , couleur.RougeComplet)
		elseif menuActif == "menuSauvegarde" then
				menu(gc , 10 , 10 , texteMenuPrincipal , "menuPrincipal" , typeFenetreMenu , nil , nil , nil , nil , couleur.RougeComplet)
				menu(gc , 30 , 10 , menuTexteSauvegarde , "menuSauvegarde" , 2 , nil , nil , 12 , couleur.Blanc , couleur.VertComplet , couleur.BleuComplet , couleur.Noir)
		end
	elseif ecran == 3 then
		if initialisation then
		tableau = initialisationDeNiveaux(tableau)--creer le niveau et récupère la variable tableau
		end
		timer.start(0.01)
		taillemur = 30
		largeurPersonnage = 30-- définie la largeur
		hauteurPersonnage = 30-- définie la largeur
		pos = joueur:pos()--associe les position du joueur a pos
		vel = joueur:vel()--associe la velocité du joueur a vel
		velX = vel:x()--associe la velocite x du joueur a vel x
		velY = vel:y()--associe la velocite y du joueur a vel y
		posX = pos:x()--associe la position x du joueur a pos x
		posY = pos:y()--associe la position y du joueur a pos y    	
		posX,posY,velX,velY=Collision(posX,posY)
		joueur:setPos( physics.Vect(posX, posY) )-- on fait les déplacement du joueur
		AffichageEtDecoupageDeLaCarteEtDuJoueur(gc,posX,posY,tableau)
		menuEcranDeux(gc)
    elseif ecran == 4 then
		combatToutEnUn(gc)
    elseif ecran == "Commencement" then
		Debut(gc)
	elseif ecran == "écran de défaite" then
		Defaite(gc)
	elseif ecran == "écran de gain" then
		Gain(gc)
	end
end


function Debut(gc)
	if MiseEnContexte then
		Texte(gc , "Bonjour a toi Dresseur ! Bienvenue dans le monde merveilleux des Pokomons ! Dans ce monde , des creatures du nom de Pokomons vivent en paix et cohabitent ensembles ! Mais dis moi...C'est ta premiere venue dans ce monde ? Je vais donc t'expliquer les regles de ce monde: Hum...hum...Jeune Dresseur de Pokomons, tu vas debuter ta grande aventure dans ce monde , de nombreux dangers se dresseront devant toi , cependant je suis sûr que tu arriveras a les passer sans soucis et même reussir a te faire des compagnons sur qui tu pourras compter en commencant par ton premier Pokomon ! Quoi ?! Comment ca tu n'as pas de Pokomons ? Ne t'inquiètes pas pour si peu ! Justement je viens de recevoir 3 Pokomons robustes dont je n'ai guère besoin, je te laisse en choisir un !" , {r=0,v=0,b=0})
		if affichageText.FinTexte then
			MiseEnContexte = false
			MontrerLesStarter = true
		end
	elseif MontrerLesStarter then
		Carre1={r=0,v=0,b=0}
		Carre2={r=0,v=0,b=0}
		Carre3={r=0,v=0,b=0}
		Texte(gc , "Tu vas maintenant faire un choix décisif ! Choisis ton premier Pokomon ! Fais bien ton choix car tu ne pourras pas revenir en arriere !" , {r=0,v=0,b=0})
		if affichageText.FinTexte then
			if SelecteurDeStarter == 1 then
				Carre1={r=0,v=255,b=0}
			elseif SelecteurDeStarter == 2 then
				Carre2={r=0,v=255,b=0}
			else
				Carre3={r=0,v=255,b=0}
			end
		gc:setColorRGB(0,0,0)
		gc:drawString(pokodex[SelecteurDeStarter].nom,L/2-(gc:getStringWidth(pokodex[SelecteurDeStarter].nom)/2),H-42*(H/212))
		pokomonChoisis = true
		end
		vignettePokomon(gc,30*(L/318),(1/4)*H,Carre1,1,0.5)
		vignettePokomon(gc,125*(L/318),(1/4)*H,Carre2,2,0.5)
		vignettePokomon(gc,220*(L/318),(1/4)*H,Carre3,3,0.5)
	elseif finStarter  then
		gc:setColorRGB(0,0,255)
		gc:drawString(pokodex[SelecteurDeStarter].nom,L/2-(gc:getStringWidth(pokodex[SelecteurDeStarter].nom)/2),H-42*(H/212))
		local vignette = pokodex[SelecteurDeStarter].front:copy(pokodex[SelecteurDeStarter].front:width()*(H/212),pokodex[SelecteurDeStarter].front:height()*(L/318))
		gc:drawImage(vignette,100*(L/318),(1/4)*H)
		sac.pokomon[1]= {nom = pokodex[SelecteurDeStarter].nom , defense = pokodex[SelecteurDeStarter].defense , santeMAX = pokodex[SelecteurDeStarter].santeMAX , sante = pokodex[SelecteurDeStarter].sante ,  attaque = pokodex[SelecteurDeStarter].attaque , capacite = pokodex[SelecteurDeStarter].capacite , front = pokodex[SelecteurDeStarter].front , back = pokodex[SelecteurDeStarter].back, id = pokodex[SelecteurDeStarter].id}
		if affichageText.FinTexte then
			ecran = 3
			deplacements = true
		end
	end
end

function vignettePokomon(gc,x,y,couleur,id,FacteurTaille)
print(id)
	local vignette = pokodex[id].front:copy(pokodex[id].front:width()*(H/212)*FacteurTaille,pokodex[id].front:height()*(L/318)*FacteurTaille)
	arrondiBordure (gc, x, y, (pokodex[id].front:width()*(H/212)+5*2)*FacteurTaille , (pokodex[id].front:height()*(L/318)+5*2)*FacteurTaille , 50 , couleur,{r=255,v=255,b=255},2)
	gc:drawImage(vignette,x+5*FacteurTaille,y+5*FacteurTaille+10)
end

function sauvegardeInventaire()
	sacSauvegarde[1]=sac.objets[1].quantite
	sacSauvegarde[2]=sac.objets[2].quantite
	nombreDePoko = 1
	while sac.pokomon[nombreDePoko]~=nil do 
		
		PDVsauvegardePoko[nombreDePoko] = sac.pokomon[nombreDePoko].sante
		IDsauvegardePoko[nombreDePoko] = sac.pokomon[nombreDePoko].id
		nomPokomon[nombreDePoko] = sac.pokomon[nombreDePoko].nom
		nombreDePoko=nombreDePoko+1
	end
	nombreDePoko=nombreDePoko-1
end

function on.save()
	if indiceSauvegarde ~= nil and not inisialisation then
	sauvegardeInventaire ()
	var.store ("couleur.Selecteur" , couleur.Selecteur)
	var.store ("couleur.Defaut" , couleur.Defaut)
	var.store ("typeFenetreDefaut" , typeFenetreDefaut)
	var.store ("couleur.Background" , couleur.Background)
	var.store ("typeTexte" , typeTexte)
	var.store ("justificationPolice" , justificationPolice)
	var.store ("couleur.Bordure" , couleur.Bordure)
	var.store ("sauvegarde", sauvegarde)
	var.store ("tableau1"..indiceSauvegarde,tableauDeSauvegarde1)
	var.store ("tableau2"..indiceSauvegarde,tableauDeSauvegarde2)
	var.store ("tableau3"..indiceSauvegarde,tableauDeSauvegarde3)
	var.store ("tableau4"..indiceSauvegarde,tableauDeSauvegarde4)
	var.store ("tableau5"..indiceSauvegarde,tableauDeSauvegarde5)
	var.store ("tableau6"..indiceSauvegarde,tableauDeSauvegarde6)
	var.store ("posX"..indiceSauvegarde,posX)
	var.store ("posY"..indiceSauvegarde,posY)
	var.store ("sacSauvegarde"..indiceSauvegarde,sacSauvegarde)
	var.store ("nombreDePoko"..indiceSauvegarde,nombreDePoko)
	var.store ("PDVsauvegarde"..indiceSauvegarde,PDVsauvegardePoko)
	var.store ("IDsauvegarde"..indiceSauvegarde,IDsauvegardePoko)
	personnalisationSauvee = true
	var.store ("personnalisationSauvee" , personnalisationSauvee )
	end
end


--Fonction ENTER
function on.enterKey()
    if not affichageText.FinTexte then
    Entrer = true
	elseif ecran == 1 then
		menuActif = "menuPrincipal"
		ecran = 2
	elseif ecran == 2 then
			if (menuActif == "menuPrincipal") and (optionSelect["menuPrincipal"] == 1) then
				menuActif = "menuSauvegarde"
			end 
			if (menuActif == "menuSauvegarde") and optionSelect["menuSauvegarde"]~=nil then
				menuActive = false
				sac = {
					pokomon = {},
						objets = {
							{nom = "Pokoball" , description = "On dit que ces objets bourrés de technologie permettent de maintenir des Pokomon de manière portative et dans les meilleures conditions possibles", quantite = 0},
							{nom = "Plante médicinale" , description = "Les plantes médicinale ont la faculté de soigner les Pokomon leur origine est mistérieuse mais il parrait qu'aprés un combat de pokomon ces herbes poussent mystèrieusement " , quantite = 0}
						}
					}
				if  menuTexteSauvegarde[optionSelect["menuSauvegarde"] ] == "nouvelle partie "..optionSelect["menuSauvegarde"] then 
					nomPokomon = {}
					MiseEnContexte = true
					MontrerLesStarter = false
					pokomonChoisis = false
					finStarter = false
					SelecteurDeStarter = 1
					initialisation = true
					indiceSauvegarde=optionSelect["menuSauvegarde"]
					sauvegarde [indiceSauvegarde] = true
					menuTexteSauvegarde [indiceSauvegarde] = "partie "..indiceSauvegarde
					if indiceSauvegarde+1 <=4 then
						menuTexteSauvegarde [indiceSauvegarde+1] = "nouvelle partie "..indiceSauvegarde+1
					end
					sac.objets[1].quantite=42
					sac.objets[2].quantite=42
					posX = 64*3.5
					posY = 64*4
					joueur:setPos(physics.Vect(posX,posY))--place le joueur a une position de départ
					ecran = "Commencement"
				else 
					nomPokomon = {}
					indiceSauvegarde=optionSelect["menuSauvegarde"]
					sauvegarde [indiceSauvegarde] = true 
					initialisation = false
					innitaialisationCarteAncienneSauvegarde()
					posX=var.recall("posX"..indiceSauvegarde)
					posY=var.recall("posY"..indiceSauvegarde)
					joueur:setPos(physics.Vect(posX,posY))--place le joueur a une position de départ
					sac.objets[1].quantite = var.recall("sacSauvegarde"..indiceSauvegarde)[1]
					sac.objets[2].quantite = var.recall("sacSauvegarde"..indiceSauvegarde)[2]
					for i = 1, var.recall("nombreDePoko"..indiceSauvegarde,nombreDePoko),1 do
						sac.pokomon[i]=pokodex[var.recall("IDsauvegarde"..indiceSauvegarde,IDsauvegardePoko)[i]]
						sac.pokomon[i].sante = var.recall("PDVsauvegarde"..indiceSauvegarde,PDVsauvegardePoko)[i]
					end
					ecran = 3
					deplacements = true
				end
			elseif menuActif == "règle du jeu" then
			end
	elseif ecran == 3 then
		if menuActif == "menuExploration" then
            if optionSelect["menuExploration"] == 5 then
				optionSelect["menuSauvegarde"] = nil
				optionSelect["menuPrincipal"] = 1
				optionSelect["menuExploration"] = 1
				menuActif = "menuPrincipal"
				deplacements = true
				ecran = 2
			elseif optionSelect["menuExploration"] == 4 then
				optionSelect["menuExploration"] = 1
				menuActive = false
				menuActif = nil
				deplacements = true
			elseif optionSelect["menuExploration"] == 6 then
				indiceMaxPokomonSac = 1
				while sac.pokomon[indiceMaxPokomonSac] ~= nil do
					indiceMaxPokomonSac = (indiceMaxPokomonSac + 1)
				end
				sac.pokomon[indiceMaxPokomonSac] = {nom = "Pokomon Triche" , defense = 900000000 , santeMAX = math.random(400 , 900000) ,  attaque = 1000 , capacite = capacites[8] , front = pokomonTricheFrontIMG , back = pokomonTricheBackIMG, id=8}
				sac.pokomon[indiceMaxPokomonSac].sante = sac.pokomon[indiceMaxPokomonSac].santeMAX
				optionSelect["menuExploration"] = 1
				menuActive = false
				menuActif = nil
				deplacements = true
			elseif optionSelect["menuExploration"] == 1 then
				menuActif = "menuSacExploration"
			elseif optionSelect["menuExploration"] == 2 then
				menuActif = "menuReglages"
			elseif optionSelect["menuExploration"] == 2 then
				Texte(gc,"Votre jeu a été sauvegardé",{r=0,v=0,b=0})
				if affichageText.FinTexte then
					on.save()
					optionSelect["menuExploration"] = 1
					menuActive = false
					menuActif = nil
					deplacements = true
				end
			end
		elseif menuActif == "menuReglages" then
			if optionSelect["menuReglages"] == 1 then
				menuActif = "menuCouleurSelecteur"
			elseif optionSelect["menuReglages"] == 2 then
				menuActif = "menuCouleurTextes"
			elseif optionSelect["menuReglages"] == 3 then
				menuActif = "menuTypesFenetres"
			elseif optionSelect["menuReglages"] == 4 then
				menuActif = "menuCouleurFond"
			elseif optionSelect["menuReglages"] == 5 then
				menuActif = "menuTypePolice"
			elseif optionSelect["menuReglages"] == 6 then
				menuActif = "menuJustificationPolice"
			elseif optionSelect["menuReglages"] == 7 then
				menuActif = "menuCouleurBordures"
			end
		elseif menuActif == "menuCouleurSelecteur" then
			if optionSelect["menuCouleurSelecteur"] == 1 then
				couleur.Selecteur = couleur.Noir
			elseif optionSelect["menuCouleurSelecteur"] == 2 then
				couleur.Selecteur = couleur.Blanc
			elseif optionSelect["menuCouleurSelecteur"] == 3 then
				couleur.Selecteur = couleur.RougeComplet
			elseif optionSelect["menuCouleurSelecteur"] == 4 then
				couleur.Selecteur = couleur.VertComplet
			elseif optionSelect["menuCouleurSelecteur"] == 5 then
				couleur.Selecteur = couleur.BleuComplet
			end
		elseif menuActif == "menuCouleurTextes" then
			if optionSelect["menuCouleurTextes"] == 1 then
				couleur.Defaut = couleur.Noir
			elseif optionSelect["menuCouleurTextes"] == 2 then
				couleur.Defaut = couleur.Blanc
			elseif optionSelect["menuCouleurTextes"] == 3 then
				couleur.Defaut = couleur.RougeComplet
			elseif optionSelect["menuCouleurTextes"] == 4 then
				couleur.Defaut = couleur.VertComplet
			elseif optionSelect["menuCouleurTextes"] == 5 then
				couleur.Defaut = couleur.BleuComplet
			end
		elseif menuActif == "menuTypesFenetres" then
			if optionSelect["menuTypesFenetres"] == 1 then
				typeFenetreDefaut = 1
			elseif optionSelect["menuTypesFenetres"] == 2 then
				typeFenetreDefaut = 2
			elseif optionSelect["menuTypesFenetres"] == 3 then
				typeFenetreDefaut = 3
			end
		elseif menuActif == "menuCouleurFond" then
			if optionSelect["menuCouleurFond"] == 1 then
				couleur.Background = couleur.Noir
			elseif optionSelect["menuCouleurFond"] == 2 then
				couleur.Background = couleur.Blanc
			elseif optionSelect["menuCouleurFond"] == 3 then
				couleur.Background = couleur.RougeComplet
			elseif optionSelect["menuCouleurFond"] == 4 then
				couleur.Background = couleur.VertComplet
			elseif optionSelect["menuCouleurFond"] == 5 then
				couleur.Background = couleur.BleuComplet
			end
		elseif menuActif == "menuTypePolice" then
			if optionSelect["menuTypePolice"] == 1 then
				typeTexte = "sansserif"
			elseif optionSelect["menuTypePolice"] == 2 then
				typeTexte = "serif" 
			end
		elseif menuActif == "menuJustificationPolice" then
			if optionSelect["menuJustificationPolice"] == 1 then
				justificationPolice = "r"
			elseif optionSelect["menuJustificationPolice"] == 2 then
				justificationPolice = "i"
			elseif optionSelect["menuJustificationPolice"] == 3 then
				justificationPolice = "b"
			elseif optionSelect["menuJustificationPolice"] == 4 then
				justificationPolice = "bi"
			end
		elseif menuActif == "menuCouleurBordures" then
			if optionSelect["menuCouleurBordures"] == 1 then
				couleur.Bordure = couleur.Noir
			elseif optionSelect["menuCouleurBordures"] == 2 then
				couleur.Bordure = couleur.Blanc
			elseif optionSelect["menuCouleurBordures"] == 3 then
				couleur.Bordure = couleur.RougeComplet
			elseif optionSelect["menuCouleurBordures"] == 4 then
				couleur.Bordure = couleur.VertComplet
			elseif optionSelect["menuCouleurBordures"] == 5 then
				couleur.Bordure = couleur.BleuComplet
			end
		elseif menuActif == "menuSacExploration" then
			if optionSelect["menuSacExploration"] == 1 then
				menuActif = "menuPokodex"
			elseif optionSelect["menuSacExploration"] == 2 then
				optionSelect["menuChoixPokomon"] = 1
				sauvegardeInventaire()
				menuActif = "menuChoixPokomon"
			else
				menuActif = "menuObjet"
			end	
		elseif menuActif == "menuObjet" then
			selection = true
		elseif menuActif == "menuChoixPokomon" then
			menuActif = "menuDecisionPokomon"
		elseif menuActif == "menuDecisionPokomon" then
			if optionSelect["menuDecisionPokomon"] == 1 then
				choixChangement = true
			else
				choixSoin = true
			end
		end
    elseif ecran == 4 then
        if not choixFait then
			if menuActif == "menuCombat" and optionSelect["menuCombat"] == 1 then
				menuActif = "menuCombatAttaque"
            elseif menuActif == "menuCombatAttaque" then
				if optionSelect["menuCombatAttaque"] == 1 then
					choixFait = true
					choixAdverseFait = false
					actionAttaqueJoueur = true
				elseif optionSelect["menuCombatAttaque"] == 2 then
					choixFait = true
					choixAdverseFait = false
					actionCapaciteJoueur = true
				end
			elseif menuActif == "menuCombat" and optionSelect["menuCombat"] == 2 then
				choixFait = true
				choixAdverseFait = false
				actionDefenseJoueur = true
			elseif menuActif == "menuCombat" and optionSelect["menuCombat"] == 3 and not choixObjetFait then
				menuActif = "menuCombatSac"
			elseif menuActif == "menuCombat" and optionSelect["menuCombat"] == 4 then
				choixFait = true
				choixAdverseFait = false
				actionAttraperJoueur = true
			elseif menuActif == "menuCombat" and optionSelect["menuCombat"] == 5 then
				choixFait = true
				choixAdverseFait = false
				actionFuirJoueur = true
			elseif menuActif == "menuCombatSac" then
				choixAdverseFait = false
                menuActif = "menuCombat"
				choixObjetFait = true
			end
		end
	elseif ecran =="Commencement" and  MontrerLesStarter and affichageText.FinTexte and pokomonChoisis then
		finStarter = true
		MontrerLesStarter = false
	end
    platform.window:invalidate()
end

--Fonction ECHAP
function on.escapeKey()
	if not affichageText.FinTexte then
		Entrer = true
	elseif ecran == 2 then
		ecran = 1
	elseif ecran == 3 then
	   if menuActif == "menuExploration" then
	        optionSelect["menuExploration"] = 1
            menuActive = false
            menuActif = nil
			deplacements = true
		elseif not menuActive then
			menuActif = "menuExploration"
		elseif menuActif == "menuReglages" then
			menuActif = "menuExploration"
			optionSelect["menuReglages"] = 1
		elseif menuActif == "menuCouleurSelecteur" then
			menuActif = "menuReglages"
			optionSelect["menuCouleurSelecteur"] = 1
		elseif menuActif == "menuCouleurTextes" then
			menuActif = "menuReglages"
			optionSelect["menuCouleurTextes"] = 1
		elseif menuActif == "menuTypesFenetres" then
			menuActif = "menuReglages"
			optionSelect["menuTypesFenetres"] = 1
		elseif menuActif == "menuCouleurFond" then
			menuActif = "menuReglages"
			optionSelect["menuCouleurFond"] = 1
		elseif menuActif == "menuTypePolice" then
			menuActif = "menuReglages"
			optionSelect["menuTypePolice"] = 1
		elseif menuActif == "menuJustificationPolice" then
			menuActif = "menuReglages"
			optionSelect["menuJustificationPolice"] = 1
		elseif menuActif == "menuCouleurBordures" then
			menuActif = "menuReglages"
			optionSelect["menuCouleurBordures"] = 1
		elseif menuActif == "menuSacExploration" then
			menuActif = "menuExploration"
			optionSelect["menuSacExploration"] = 1
		elseif menuActif == "menuChoixPokomon" then
			menuActif = "menuSacExploration"
		elseif menuActif == "menuPokodex" then
			menuActif = "menuSacExploration"
		elseif menuActif == "menuDecisionPokomon" then
			menuActif = "menuChoixPokomon"
		elseif menuActif == "menuObjet" and selection == nil then
			menuActif = "menuSacExploration"
		end
	elseif ecran == 4 then
		if menuActif == "menuCombatAttaque" then
			menuActif = "menuCombat"
		elseif menuActif == "menuCombatSac" then
			menuActif = "menuCombat"
		end
	end
    platform.window:invalidate()
end


--Fonction FLECHE BAS
function on.arrowDown()
    if menuActive and affichageText.FinTexte then
        directionMenu[menuActif] = 3
    end
	if ecran == 3 then
		if deplacements then
			if math.random(0,100) <= 1 then
			trouveUnPokomon = true
			end
			joueur:setVel(physics.Vect(0 , 640*b))--vecteur vers le bas
			i = 0 --permet de réinitialisé la montre i
            nh = 0
            nd = 0
            ng = 0
			nb = (nb + 1)
			if nb <= 2 then
				personnage = persoBas
				personnaget = persoBast
				elseif nb <= 4 then--fait annimation
				personnage = persoBas1
				personnaget = persoBast
			else
			nb = 0
			end
		end
	end
    platform.window:invalidate()
end

--Fonction FLECHE HAUT
function on.arrowUp()
    if menuActive and affichageText.FinTexte then
        directionMenu[menuActif] = 1
    end
	if ecran == 3 then
		if deplacements then
			if math.random(0,100) <= 1 then
				trouveUnPokomon = true
			end
			nb = 0
            nd = 0
            ng = 0
			joueur:setVel(physics.Vect(0,-640*h))--vecteur vers le haut
			i = 0  --permet de réinitialisé la montre i
			nh = (nh + 1)
			if  nh <= 2 then
				personnage = persoHaut
				personnaget = persoHautt
			elseif nh <= 4 then
				personnage = persoHaut1
				personnaget = persoHaut1t
			else   
				nh = 0
			end
		end
	end
    platform.window:invalidate()
end

--Fonction FLECHE GAUCHE
function on.arrowLeft()
	if ecran == 3 then
		if deplacements then
			if math.random(0,100) <= 1 then
				trouveUnPokomon = true
			end
			nb = 0
            nh = 0
            nd = 0
			joueur:setVel(physics.Vect(-640*g , 0))--vecteur vers la gauche
			i = 0 --permet de réinitialisé la montre i
			ng = (ng + 1)
			if ng <= 2 then --fait annimation
				ng=ng+1
				personnage = persoGauche
				personnaget = persoGauchet
			elseif ng <= 4 then --fait annimation
				ng=ng+1
				personnage = persoGauche1
				personnaget = persoGauche1t
			else    
			ng = 0 
			end
		end
	elseif ecran == "Commencement" and SelecteurDeStarter > 1 and MontrerLesStarter and affichageText.FinTexte   then
		SelecteurDeStarter = SelecteurDeStarter-1
	end
end

--Fonction FLECHE DROITE
function on.arrowRight()
	if ecran == 3 then
		if deplacements then
			if math.random(0,100) <= 1 then
				trouveUnPokomon = true
			end
			nb = 0
            nh = 0
            ng = 0
			joueur:setVel(physics.Vect(640*d , 0))--vecteur vers la droite
			i = 0  --permet de réinitialisé la montre i
			nd = (nd + 1)
			if  nd <= 2 then
				nd=nd+1
				personnage = persoDroite
				personnaget = persoDroitet
			elseif nd <= 4 then
				nd=nd+1
				personnage = persoDroite1
				personnaget = persoDroite1t
			else 
				nd = 0
			end
		end
	elseif ecran == "Commencement" and SelecteurDeStarter < 3 and MontrerLesStarter and affichageText.FinTexte   then
		SelecteurDeStarter = SelecteurDeStarter+1
	end
end