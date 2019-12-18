public struct TJoueur : Joueur {

	typealias ATPiece = TPiece

	private var joueur : String
	private var main : [TPiece] = [eForme : Int]

	enum Erreur : Error {
        case mauvaisparametre
    }
    
	// Initialise un joueur avec une couleur et un set de 8 pièces.
	// Le joueur a 2 sphères, 2 cylindres, 2 cubes et 2 cônes

	init(c : eCouleur) {
		guard (self.eCouleur == Blanc || self.eCouleur == Noir) else {throws Erreur.mauvaisparametre}
		if c == Blanc {
			self.joueur = Blanc
			self.main = [eForme.Cube : 2, eForme.Cone : 2, eForme.Cylindre : 2, eForme.Sphère : 2]
		}
		else if c == Noir{
			self.joueur = Noir
			self.main = [eForme.Cube : 2, eForme.Cone : 2, eForme.Cylindre : 2, eForme.Sphère : 2]
		}
	}

	var couleur : eCouleur {
		get {
			return self.couleur
		}
	}
// La couleur du joueur 

	func EstDispoPiece (p : TPiece) -> Bool{
		guard (p.eForme == Cube | p.eForme == Cone | p.eForme == Cylindre | p.eForme == Sphere) else {throws Erreur.mauvaisparametre}
		return self.main[p] > 0
	}
// Renvoie False si le joueur ne possède pas cette pièce, True sinon.


	func RetirerPiece (p : TPiece) -> Bool {
		if EstDispoPiece(p : p) {
			for (cle, valeur) in main {
				if p.eForme == cle {
					valeur = valeur - 1
				}
			}
			return true
		}
		else{
			return false
		}
	}
// Renvoie True lorsque la pièce a bien était retirée, False sinon.

	func ChercherPiece (forme : TPiece) -> TPiece? { 
		if EstDispoPiece(forme : p) {
			for cle in main {
				if cle.eForme == forme.eForme {
					return cle
				}
			}
		}
		else {
			return nil 
		}
	}
// Renvoie la pièce de la forme passée en paramètre, renvoie vide si le joueur ne possède pas la pièce

	func PieceDispo() -> [eForme] {
		return self.main
	}
// Renvoie la liste des formes de chaques pièces que possède le joueur sous forme de string


}