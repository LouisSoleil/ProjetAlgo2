protocol Partie {

	init()
// Initialise un plateau vide qui est une grille de taille 4x4, ainsi que 2 joueurs et le premier Joueur courant 
// Aucune case n’est occupée 
// Chaque position peut prendre soit une pièce soit vide

	var JoueurCourant : Joueur {get}
// Définit le joueur qui doit poser une pièce

	var FinDePartie : Bool {get}
// Renvoie True si la partie est terminé, false sinon

	func AleaJoueur(j1 : Joueur , j2 : Joueur) -> Joueur 
// Choix du joueur qui commence la partie
// Post : le joueur choisis devient donc le joueur courant 

	mutating func ChangerJoueurCourant()
// Change le joueur courant une fois que ce dernier à posé sa pièce
// Post : Le joueur adverse devient donc le joueur courant  


	func Gagnant() -> Joueur 
// Renvoie le joueur qui qui a gagné
// Post : un joueur a gagné si celui ci est le dernier à avoir déposer une piéce a une position et qu'à cette position LigneRemplie = True ou ColonneRemplie = True ou RegionRemplie = True.
//        Ce même joueur à gagné si le joueur adverse ne peux plus poser de pièces.

}