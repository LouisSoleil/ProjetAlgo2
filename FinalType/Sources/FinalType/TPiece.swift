public struct TPiece : Piece{
	
	var couleur : String {
		get {
			return self.couleur
		}
		set {
			couleur = newValue
		}
	}
	var forme : String {
		get {
			return self.forme
		}
		set {
			forme = newValue
		}
	}

	init() {
		
		self.forme = "Cube"
		self.couleur = "Blanc"
		self.forme = "Cone"
		self.couleur = "Blanc"
		self.forme = "Cylindre"
		self.couleur = "Blanc"
		self.forme = "Sphere"
		self.couleur = "Blanc"
		self.forme = "Cube"
		self.couleur = "Noir"
		self.forme = "Cone"
		self.couleur = "Noir"
		self.forme = "Cylindre"
		self.couleur = "Noir"
		self.forme = "Sphere"
		self.couleur = "Noir"

	}

	/*
	enum eForme {
		case Cube (String)
		case Cone (String) 
		case Cylindre (String)
		case Sphere (String)
	}

	enum eCouleur {
		case Blanc (String)
		case Noir (String)
	}
	*/
}