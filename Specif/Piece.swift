protocol Piece {

	init() 
// Initialise la pièce avec une couleur et une forme.

	var couleur : eCouleur {get}
// La Couleur de la pièce

	var forme : eForme {get}
// La forme de la pièce

}


enum eForme {
	case Cube 
	case Cone
	case Cylindre
	case Sphere
}

enum eCouleur {
	case Blanc
	case Noir
}