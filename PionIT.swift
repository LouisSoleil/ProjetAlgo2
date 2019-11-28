protocol IteratorPion {

	//permet de créer un itérateur avec tous les pions du joueur rentré en paramètre
	init (joueur : Int){}
	
	//permet de parcourir la liste des pions
	mutating func next() -> Pion?{}
}