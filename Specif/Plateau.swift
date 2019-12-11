
protocol Plateau  {

	associatedtype ATPiece : ATPiece

	func isOccupied (x : Int , y : Int) -> Bool 
// La position donnée en paramètre est-elle occupée ? 
// Pre : x, y doivent correspondre à une coordonnée du plateau

	mutating func PlacerATPiece (p : ATATPiece , x : Int , y : Int) 
// Place une pièce donnée à la position donnée en paramètre
// Pre : x, y sont des entiers positifs qui doivent correspondre à une coordonnée du plateau 

	func QuelleATPiece (x : Int , y : Int) -> ATATPiece? 
// Pre : x et y sont des entiers positifs qui sont des coordonnées appertenant au plateau
// Permet de savoir quelle pièce se situe à la position donnée en paramètre 
// Renvoie la ATPiece se situant à la case de coordonnées passées en paramètre. Renvoie vide si aucune pièce se trouve à cette position 

	func Verif(x : Int) -> Bool
// Pre : Prend en paramètre une coordonnée du plateau
// Return True si cette coordonnée appartient au plateau, False sinon

	func LigneDispo (p : ATPiece , x : Int , y : Int) -> Bool 
// Permet de savoir si une pièce de la même forme du joueur adverse est présente sur la même ligne.
// Renvoie False si une pièce adverse de la même forme se trouve dans la même ligne, True sinon
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.

	func ColonneDispo (p : ATPiece , x : Int , y : Int) -> Bool 
// Permet de savoir si une pièce de la même forme du joueur adverse est présente sur la même colonne
// Renvoie False si une pièce adverse de la même forme se trouve dans la même colonne, True sinon
// Pre : x et y doivent correspondre aux coordonnées d'une position du plateau.

	func RegionDispo (p : ATPiece , x : Int , y : Int) -> Bool 
// Permet de savoir si une pièce de la même forme du joueur adverse est présente dans la même région
// Renvoie False si une pièce adverse de la même forme se trouve dans la même region, True sinon
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.

	func LigneRemplie (x : Int , y : Int) -> Bool 
// Renvoie True si la ligne des coordonnées de la case contient 4 ATPieces de formes différentes, False sinon 
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.

	func ColonneRemplie (x : Int , y : Int) -> Bool
// Renvoie True si la colonne des coordonnées de la case contient 4 ATPieces de formes différentes, False sinon 
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.

	func RegionRemplie (x : Int , y : Int) -> Bool
// Renvoie True si la ligne des coordonnées de la case contient 4 ATPieces de formes différentes, False sinon 
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.

	
}