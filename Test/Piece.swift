protocol Piece {

	init(form : String, coul : String) throws
// Initialise la pièce avec une couleur et une forme.

	var couleur : String {get}
// La Couleur de la pièce

	var forme : String {get}
// La forme de la pièce

}
