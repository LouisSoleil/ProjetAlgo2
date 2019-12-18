public struct TJoueur : Joueur {

	typealias ATPiece = TPiece

	var joueur : String {
		get {
			return self.joueur
		}
		set {
			joueur = newValue
		}
	}
	private var main : [String: Int] {
		get {
			return self.main
		}
		set{
			main = newValue
		}
	}


	enum Erreur : Error {
        case mauvaisparametre
    }
    
	// Initialise un joueur avec une couleur et un set de 8 pièces.
	// Le joueur a 2 sphères, 2 cylindres, 2 cubes et 2 cônes

	public init (c : String) throws {
		guard (c == "Blanc" || c == "Noir") else {
			throw Erreur.mauvaisparametre
		}
		if c == "Blanc" {
			self.joueur = "Blanc"
			self.main = [try TPiece(form : "Cube", coul : "Blanc").forme : 2, try TPiece(form : "Cone", coul : "Blanc").forme : 2, try TPiece(form : "Cylinde", coul : "Blanc").forme : 2, try TPiece(form : "Sphere", coul : "Blanc").forme : 2]
		}
		else if c == "Noir"{
			self.joueur = "Noir"
			self.main = [try TPiece(form : "Cube", coul : "Noir").forme : 2, try TPiece(form : "Cone", coul : "Noir").forme : 2, try TPiece(form : "Cylindre", coul : "Noir").forme : 2, try TPiece(form : "Sphere", coul : "Noir").forme : 2]
		}
	}

	

	public func EstDispoPiece (p : TPiece)-> Bool {
		for (cle, valeur) in main {
			if p.forme == cle {
				return valeur > 0
			}
		}
	}
// Renvoie False si le joueur ne possède pas cette pièce, True sinon.


	public mutating func RetirerPiece (p : TPiece) {  
		if EstDispoPiece(p : p) {
			for pion in main {
				if p.forme == pion.key {
					main[pion.key]! = main[pion.key]!-1
				}
			}
		}
	}

// Renvoie True lorsque la pièce a bien était retirée, False sinon.

	public func ChercherPiece (forme : TPiece) -> String? { 
		if EstDispoPiece(p : forme) {
			for pion in main {
				if pion.key == forme.forme {
					return pion.key
				}
			}
		}
		else {
			return nil 
		}
	}
// Renvoie la pièce de la forme passée en paramètre, renvoie vide si le joueur ne possède pas la pièce

	public func PieceDispo() -> [String: Int] {
		return self.main
	}
// Renvoie la liste des formes de chaques pièces que possède le joueur sous forme de string


}