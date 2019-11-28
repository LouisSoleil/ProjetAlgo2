protocol Pion {
	associatedtype Partie 


	// Description : Crée un pion
    // Données : Un tableau de 2 entiers [x,y] correspondant à la position initiale,(ligne, colonne),nom : le nom du pion (pion1, pion2,...) maître sinon et partie : Partie
    // Préconditions : x appartient à [0,4], y appartient à [0,4], [x,y] est une position inoccupée
    // Résultat : Pièce créée à la position indiquée
    // Lance une erreur si la position est déjà occupée par une pièce ou si il y a déjà un maître.
	init(position : [Int], nom : String, partie : Partie) {}

	var positionPion : [Int] {get}
	var nomPion : String {get}
	var joueur : Int {get} //permet de savoir à quel joueur appartient le pion : 1 joueur Rouge, 2 joueur Bleu

	// remplace la position la position actuel du pion par la position rentrée
	mutating func deplacerPion(p : Pion, pos : [Int]){}

	//Permet de renvoyer le pion associé au nom rentré
	func stringToPion(nom : String)->Pion? {}

	//modifie la position du pion pour la mettre sur null
	//il n'est plus sélectionnable par son joueur 
	mutating func estCapturé (p : Pion) {}

	

}