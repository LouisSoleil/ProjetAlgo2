protocol Joueur { 

	associatedtype ATPiece = Piece

	init(c : ATPiece.eCouleur) 
// Initialise un joueur avec une couleur et un set de 8 pièces.
// Le joueur a 2 sphères, 2 cylindres, 2 cubes et 2 cônes

	var couleur : ATPiece.eCouleur {get}
// La couleur du joueur 

	func EstDispoPiece (p : ATPiece) -> Bool
// Renvoie False si le joueur ne possède pas cette pièce, True sinon.


	func RetirerPiece (p : ATPiece) -> Bool 
// Renvoie True lorsque la pièce a bien était retirée, False sinon.

	func ChercherPiece (forme : ATPiece) -> ATPiece?  
// Renvoie la pièce de la forme passée en paramètre, renvoie vide si le joueur ne possède pas la pièce

	func PieceDispo() -> [ATPiece.eForme] 
// Renvoie la liste des formes de chaques pièces que possède le joueur sous forme de string


}