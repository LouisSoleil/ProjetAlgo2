struct TPartie : Partie {

	private var plateau : TPlateau

// Initialise un plateau vide qui est une grille de taille 4x4, ainsi que 2 joueurs et le premier Joueur courant 
// Aucune case n’est occupée 
// Chaque position peut prendre soit une pièce soit vide
	init(){

		self.plateau = TPlateau() //Création tableau vide
	}

	var JoueurCourant : Joueur {
		get{
			return self.JoueurCourant
			} 
	}
// Définit le joueur qui doit poser une pièce

	var FinDePartie : Bool {
		get{
			return self.FinDePartie
		}
	}
// Renvoie True si la partie est terminé, false sinon

	func AleaJoueur(j1 : Joueur , j2 : Joueur) -> Joueur {
		var joueurC : Int
		self.joueurC = Int.random(in: 0 ..< 2) + 1
		if self.joueurC == 1 {
			return j1 
		}
		else{
			return j2
		}
	}

	mutating func ChangerJoueurCourant(){
// Change le joueur courant une fois que ce dernier à posé sa pièce
// Post : Le joueur adverse devient donc le joueur courant  
		if self.JoueurCourant == Noir{
			JoueurCourant = Blanc
		}
		else {
			JoueurCourant = Noir
		}
	}


	func Gagnant() -> Joueur 
// Renvoie le joueur qui qui a gagné
// Post : un joueur a gagné si celui ci est le dernier à avoir déposer une piéce a une position et qu'à cette position LigneRemplie = True ou ColonneRemplie = True ou RegionRemplie = True.
//        Ce même joueur à gagné si le joueur adverse ne peux plus poser de pièces.

}