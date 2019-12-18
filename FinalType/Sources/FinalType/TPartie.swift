public struct TPartie : Partie {

	typealias ATJoueur = TJoueur
	typealias ATPlateau = TPlateau

	var plateau : TPlateau

// Initialise un plateau vide qui est une grille de taille 4x4, ainsi que 2 joueurs et le premier Joueur courant 
// Aucune case n’est occupée 
// Chaque position peut prendre soit une pièce soit vide
	public init(){
		self.plateau = TPlateau() //Création tableau vide
	}

	var JoueurCourant : TJoueur {
		get{
			return self.JoueurCourant
			} 
		set {
			JoueurCourant = newValue
		}
	}
// Définit le joueur qui doit poser une pièce

	private var joueurPC : TJoueur{
		get {
			return self.joueurPC
		}
		set {
			joueurPC = newValue
		}
	}

	var FinDePartie : Bool {
		get{
			return self.FinDePartie
		}
	}
// Renvoie True si la partie est terminé, false sinon

	public func AleaJoueur(j1 : TJoueur , j2 : TJoueur) -> TJoueur {
		let joueurC : Int = Int.random(in: 0 ..< 2) + 1
		if joueurC == 1 {
			return j1 
		}
		else{
			return j2
		}
	}

	public mutating func ChangerJoueurCourant(){
// Change le joueur courant une fois que ce dernier à posé sa pièce
// Post : Le joueur adverse devient donc le joueur courant 
		self.joueurPC = self.JoueurCourant 
		if self.JoueurCourant.joueur == "Noir"{
			JoueurCourant.joueur = "Blanc"
		}
		else {
			JoueurCourant.joueur = "Noir"
		}
	}


	public func Gagnant() -> TJoueur {
		return joueurPC
	}
// Renvoie le joueur qui a gagné
// Post : un joueur a gagné si celui ci est le dernier à avoir déposer une piéce a une position et qu'à cette position LigneRemplie = True ou ColonneRemplie = True ou RegionRemplie = True.
//        Ce même joueur à gagné si le joueur adverse ne peux plus poser de pièces.

}