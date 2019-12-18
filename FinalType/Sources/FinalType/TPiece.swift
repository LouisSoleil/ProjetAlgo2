public struct TPiece : Piece{

	public var couleur : String {
		get {
			return self.couleur
		}
		set {
			couleur = newValue
		}
	}
	public var forme : String {
		get {
			return self.forme
		}
		set {
			forme = newValue
		}
	}

	enum Erreur : Error {
        case mauvaisparametre
    }

	public init(form : String, coul : String) throws {
		guard (form == "Cube" || form == "Cone" || form == "Cylindre" || form == "Sphere" || coul == "Blanc" || coul == "Noir" ) else {
			throw Erreur.mauvaisparametre
		}
		self.couleur = coul
		self.forme = form

	}

	/*
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
	*/
}