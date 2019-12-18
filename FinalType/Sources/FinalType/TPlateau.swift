public struct TPlateau : Plateau{
	
	typealias ATPiece = TPiece
	private var jeu : [[TPiece?]]
	public init(){
		jeu = [ [nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil] ]
	}
	//var jeu : [[TPiece?]] = TPartie().plateau

	// La position donnée en paramètre est-elle occupée ? 
	// Pre : x, y doivent correspondre à une coordonnée du plateau
	public func isOccupied (x : Int , y : Int) -> Bool {
		if jeu[x][y] == nil{ //Si la case n'est pas vide
			return true
		}
		else {
			return false
		}
	}


	// Place une pièce donnée à la position donnée en paramètre
	// Pre : x, y sont des entiers positifs qui doivent correspondre à une coordonnée du plateau 
	public mutating func PlacerPiece (p :TPiece , x : Int , y : Int) {
		if !isOccupied(x:x, y:y){
			jeu[x][y] = p
		}
	}

// Pre : x et y sont des entiers positifs qui sont des coordonnées appertenant au plateau
// Permet de savoir quelle pièce se situe à la position donnée en paramètre 
// Renvoie la piece se situant à la case de coordonnées passées en paramètre. Renvoie vide si aucune pièce se trouve à cette position 
	public func QuellePiece (x : Int , y : Int) -> TPiece? {
		return jeu[x][y] //Vide ou contient une pièce
	}

// Pre : Prend en paramètre une coordonnée du plateau
// Return True si cette coordonnée appartient au plateau, False sinon
	public func Verif(x : Int) -> Bool{
		return (x == 1 || x == 2 || x == 3 || x == 0) 
	}

// Permet de savoir si une pièce de la même forme du joueur adverse est présente sur la même ligne.
// Renvoie False si une pièce adverse de la même forme se trouve dans la même ligne, True sinon
// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.
	public func LigneDispo (p :TPiece , x : Int , y : Int) -> Bool {
		var i : Int = 0
		var check : Bool = true
		while (i<3 && check == true){
			if !isOccupied(x : x , y : i){
				if (jeu[x][i]!.forme == p.forme && jeu[x][i]!.couleur != p.couleur){ //même forme mais pas même couleur
					check = false
				}
			}
			i+=1
		}//Arrêt : Forme adversaire présente sur la ligne
		return check
	}



// Permet de savoir si une pièce de la même forme du joueur adverse est présente sur la même colonne
// Renvoie False si une pièce adverse de la même forme se trouve dans la même colonne, True sinon
// Pre : x et y doivent correspondre aux coordonnées d'une position du plateau.
	public func ColonneDispo (p :TPiece , x : Int , y : Int) -> Bool {
		var i : Int = 0
		var check : Bool = true
		while i<3 && check == true{
			if jeu[i][y] != nil{
				if jeu[i][y]!.forme == p.forme && jeu[i][y]!.couleur != p.couleur{ //même forme mais pas même couleur
					check = false
				}
			}
		i+=1
		}//Arrêt : Forme adversaire présente sur la ligne
		return check
	}

	// Permet de savoir si une pièce de la même forme du joueur adverse est présente dans la même région
	// Renvoie False si une pièce adverse de la même forme se trouve dans la même region, True sinon
	// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.
	public func RegionDispo (p :TPiece , x : Int , y : Int) -> Bool {
		var check : Bool = true
		if (x == 0 || x == 1) { 
			if (y == 1 || y == 0){
				var i : Int = 0
				var j : Int = 0
				while (i < 1 && check == true){
					while (j < 1 && check == true){
						if jeu[i][j]!.forme == p.forme && jeu[i][y]!.couleur != p.couleur {
							check = false
						}
					}
				}
			}
			if (y == 2 || y == 3){
				var i : Int = 0
				var j : Int = 0
				while (i<1 && check == true) {
					while (j < 1 && check == true){
						if jeu[i][j]!.forme == p.forme && jeu[i][y]!.couleur != p.couleur {
							check = false
						}
					}
				}
			}
		}
		if (x == 2 || x == 3) {
			if (y == 1 || y == 0){
				var i : Int = 0
				var j : Int = 0
				while (i < 1 && check == true) {
					while (j < 1 && check == true){
						if jeu[i][j]!.forme == p.forme && jeu[i][y]!.couleur != p.couleur {
							check = false
						}
					}
				}
			}
			if (y == 2 || y == 3){
				var i : Int = 0
				var j : Int = 0
				while (i < 1 && check == true) {
					while (j < 1 && check == true){
						if jeu[i][j]!.forme == p.forme && jeu[i][y]!.couleur != p.couleur {
							check = false
						}
					}
				}
			}
		}
		return check
	}

	// Renvoie True si la ligne des coordonnées de la case contient 4ATPieces de formes différentes, False sinon 
	// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.
	public func LigneRemplie (x : Int , y : Int) -> Bool {
		var check : Bool = true	
		var i : Int = 0
		var tableauPiece : [TPiece] = [] 
		while (i < 3 && check == true){
			tableauPiece.append(jeu[i][y]!)
			if tableauPiece.contains(jeu[i][y]!.forme) {
				check = false
			}
			i+=1
		}
		return check
	}
	// Renvoie True si la colonne des coordonnées de la case contient 4ATPieces de formes différentes, False sinon 
	// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.
	public func ColonneRemplie (x : Int , y : Int) -> Bool{
		var check : Bool = true	
		var i : Int = 0
		var tableauPiece : [TPiece] = []
		while (i < 3 && check == true){
			tableauPiece.append(jeu[x][i]!)
			if tableauPiece.contains(jeu[x][i]!.forme) { //Si le plateau contient déjà cette forme
				check = false
			}
			i+=1
		}
		return check
	}
	// Renvoie True si la ligne des coordonnées de la case contient 4ATPieces de formes différentes, False sinon 
	// Pre : x et y sont des entiers positifs et doivent correspondre aux coordonnées d'une position du plateau.
	public func RegionRemplie (x : Int , y : Int) -> Bool {
		var check : Bool = true
		var tableauPiece : [TPiece] = []
		if (x == 0 || x == 1) {
			if (y == 0 || y == 1){
				var i : Int = 0
				var j : Int = 0
				while (i<1 && check == true ){
					while (j<1 && check == true){
						if isOccupied(x : i, y : j) { //Vérifie non vide
							tableauPiece.append(jeu[i][j]!)
							if tableauPiece.contains(jeu[i][j]!){
								check = false
							}
						}
						j+=1
					}
				i+=1
				}
			}
			else {//y=2 ou y=3
				var i : Int = 0
				var j : Int = 2
				while (i<1 && check == true){
					while (j<3 && check == true){
						if isOccupied(x : i, y : j) { //Vérifie non vide
							tableauPiece.append(jeu[i][j]!)
							if tableauPiece.contains(jeu[i][j]!){
								check = false
							}
						}
						j+=1
					}
				i+=1
				}
			}
		}
		else { //x==2 ou x==3
			if (y == 0 || y == 1){
				var i : Int = 2
				var j : Int = 0
				while (i<3 && check == true){
					while (j<1 && check == true){
						if isOccupied(x : i, y : j) { //Vérifie non vide
							tableauPiece.append(jeu[i][j]!)
							if tableauPiece.contains(jeu[i][j]!){
								check = false
							}
						}
						j+=1
					}
				i+=1
				}
			}
			else {//y=2 ou y=3
				var i : Int = 2
				var j : Int = 2
				while (i<3 && check == true){
					while (j<3 && check == true){
						if isOccupied(x : i, y : j) { //Vérifie non vide
							tableauPiece.append(jeu[i][j]!)
							if tableauPiece.contains(jeu[i][j]!){
								check = false
							}
						}
						j+=1
					}
				i+=1
				}
			}
		}
	return check
	}
}