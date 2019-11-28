protocol Partie {
	associatedtype Carte
	associatedtype Pion //?

	/* crée une partie : 
	la partie contient 2 joueurs : 1 (rouge) et 2 (bleu)
	elle contient l'arche du joueur 1 et l'arche du joueur 2
	elle contient aussi le maître et les 4 pions élèves du joueur 1 placés sur la ligne de l'arche du joueur 1
	le maître et les 4 élèves du joueur 2 placés sur la ligne de l'arche du joueur 2
	le joueur 1 pioche 2 cartes, le joueur 2 pioche 2 cartes.
	une cinquième carte est tirée pour la partie, elle sera appellé carte plateau
	quand la partie est créée elle n'est pas finie
	*/ 
	init() 
	

    var partieFinie : Bool {get}// Indique si la partie est finie(True) ou encore en cours (False)
    var cartePlateau : Carte {get}

    //permet de passer du joueur 1 au joueur 2 et inversement, cela modifie le joueur courant
    mutating func changerJoueur() {}

    //renvoie le pion posé sur la position en paramètre, s'il y en a un
    //Si il n'y a pas de pion à cette position on renvoie vide
    func pionAPosition (pos : [Int]) -> Pion?{}

    // prend une position (idéalement celle d'un pion) et une des cartes du joueur 
    // renvoie toutes les positions disponibles pour cette position et cette carte
    func mouvementPossible(c : Carte, pos : [Int]) -> [[Int]] {}

    //renvoit true si le mouvement est possible, false sinon
    //Si sur la nouvelle position il y a un pion du joueur courant alors le mouvement est impossible
    //On ne peut pas sortir du plateau
    func estPossibleMouvement (c : Carte, p : Pion, pos : [Int]) -> Bool{}

    //permet de vérifier si il y a au moins un mouvement possible pour le joueur en cours
    //il faut utiliser l'itérateur pour parcourir tous les pions du joueur rentré en paramètre
    //et il faut tester avec les deux cartes que possède le joueur
    //renvoie true s'il existe au moins un mouvement, false sinon
    func tousLesMouvements (joueur : Int) -> Bool{}

    //On prend en paramètre un pion du joueur courant et une position
    //si la position est disponible, le pion est déplacé dans cette position 
    //On vérifie si le maître arrive sur l'arche adverse ou si un des pions di joueur courant capture le maître adverse
    //On change le joueur courant.
    mutating func jouerTour (c : Carte, p : Pion, pos : [Int]) {}

   //si aucun déplacement n'est possible on passe le tour sans rien faire.
   //on rentre en paramètre la carte qui va être échangé avec la carte du plateau
    mutating func passerTour (c : Carte){}

  	//renvoit le joueur courant : 1 si c'est le joueur rouge, 2 si c'est le joueur bleu
  	func joueurCourant () -> Int {}

    //Renvoie la liste des pions que le joueur peut jouer
    func pionDispo(joueur : Int)->[Pion]?{}


}