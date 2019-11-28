protocol Carte {


	/*
	permet d'initialiser toutes les cartes du jeu
	la carte possède un nom Carte1, Carte2 ou CarteP (pour le la carte du plateau)
	une liste de déplacement possible 
	un entier qui indique à quel joueur elle appartient : 1 joueur rouge, 2 joueur bleu, 3 plateau
	*/
	init(){}


    var nomCarte : String {get} // carte du joueur (Carte1 ou Carte2)
    var alias : String {get} //nom de la carte (Dragon, Chèvre, ...)
    var deplacementCarte : [[Int]] {get}
    var joueurCarte : Int {get}
    var couleur : Int {get} // 1 : couleur rouge ; 2 : couleur bleue


    //fonction qui permet d'échanger la carte avec celle du plateau
    //il faut échanger le nom de la carte et le propriétaire de la carte
    mutating func echangerCarte (){}

    //permet de renvoyer la carte associée au nom rentré en paramètre
    //Si cela ne correspond à aucune carte on renvoie vide
    func stringToCarte(nom : String) -> Carte? {}

}