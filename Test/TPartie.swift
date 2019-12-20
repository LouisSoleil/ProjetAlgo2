public struct TPartie : Partie {

	typealias ATJoueur = TJoueur
	typealias ATPlateau = TPlateau

	var plateau : TPlateau

	var FinDePartie : Bool {
	// Renvoie True si la partie est terminé, false sinon
 		var check : Bool = false
 		let tab : [String:Int]=JoueurCourant.PieceDispo() //On récupère le tableau des pièces disponibles pour le joueur
 		var cpt : Int = 0 
 		for pion in tab {
 			if pion.value != 0 {
 				check = false
 			}
 			else {
 				check = true
 			}
 		
 		}
 		var i : Int = 0
 		var j : Int = 0
 		while i<4 && check==false{
 			while j<4 && check == false{
 				if (plateau.LigneRemplie(x:i,y:j) || plateau.ColonneRemplie(x:i,y:j) || plateau.RegionRemplie(x:i,y:j)){
 					check=true
 				}
 				j+=1
 			}
 		i+=1
		}
 	return check
 			//Si le joueur courant ne peux plus poser de pièce l'autre joueur à gagner
	}

	private var joueur1: TJoueur?
	private var joueur2: TJoueur?
	private var joueurCourant: TJoueur

// Initialise un plateau vide qui est une grille de taille 4x4, ainsi que 2 joueurs et le premier Joueur courant 
// Aucune case n’est occupée 
// Chaque position peut prendre soit une pièce soit vide
	public init(){
		self.plateau = TPlateau() //Création tableau vide
		do {
			self.joueur1 = try TJoueur(c: "Noir")
			self.joueur2 = try TJoueur(c: "Blanc")
		} catch {
			self.joueur1 = nil
			self.joueur2 = nil
		}
		self.joueurCourant = self.joueur2!
		self.joueurCourant = AleaJoueur(j1: joueur1!, j2: joueur2!)
	}

	var JoueurCourant : TJoueur {
		return self.joueurCourant
	}


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
		if self.JoueurCourant.joueur == "Noir"{
			self.joueurCourant = self.joueur2!
		}
		else {
			self.joueurCourant = self.joueur1!
		}
	}


	public func Gagnant() -> TJoueur {
		return self.JoueurCourant
	}
// Renvoie le joueur qui a gagné
// Post : un joueur a gagné si celui ci est le dernier à avoir déposer une piéce a une position et qu'à cette position LigneRemplie = True ou ColonneRemplie = True ou RegionRemplie = True.
//        Ce même joueur à gagné si le joueur adverse ne peux plus poser de pièces.

}