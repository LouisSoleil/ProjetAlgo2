struct TPartie {

// Initialise un plateau vide qui est une grille de taille 4x4, ainsi que 2 joueurs et le premier Joueur courant 
// Aucune case n’est occupée 
// Chaque position peut prendre soit une pièce soit vide
	init(){
		var pos1 : [[Int](2), Piece?] = [[0,0], Nil]
		var pos2 : [[Int](2), Piece?] = [[0,1], Nil]
		var pos3 : [[Int](2), Piece?] = [[0,2], Nil]
		var pos4 : [[Int](2), Piece?] = [[0,3], Nil]
		var pos5 : [[Int](2), Piece?] = [[1,0], Nil]
		var pos6 : [[Int](2), Piece?] = [[1,1], Nil]
		var pos7 : [[Int](2), Piece?] = [[1,2], Nil]
		var pos8 : [[Int](2), Piece?] = [[1,3], Nil]
		var pos9 : [[Int](2), Piece?] = [[2,0], Nil]
		var pos10 : [[Int](2), Piece?] = [[2,1], Nil]
		var pos11 : [[Int](2), Piece?] = [[2,2], Nil]
		var pos12 : [[Int](2), Piece?] = [[2,3], Nil]
		var pos13 : [[Int](2), Piece?] = [[3,0], Nil]
		var pos14 : [[Int](2), Piece?] = [[3,1], Nil]
		var pos15 : [[Int](2), Piece?] = [[3,2], Nil]
		var pos16 : [[Int](2), Piece?] = [[3,3], Nil]
		var plateau : [[Int](2), Piece?](16) = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11, pos12, pos13, pos14, pos15, pos16]
	}

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