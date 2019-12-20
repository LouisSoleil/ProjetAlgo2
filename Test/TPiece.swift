public struct TPiece : Piece{

	public let couleur : String
	public let forme : String

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