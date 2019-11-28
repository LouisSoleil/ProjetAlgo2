import Foundation 

var p : Partie = Partie();

while !(p.partieFinie){//tant que  c'est faux A

	var str : String = ""

	for i in 0...5 {
		for j in 0...5{
			if let t = p.pionAPosition(pos : [i,j]){
				str += t.nomPion
			}
			else{
				str += " CASE VIDE"
			}
		}
		print(str)
		str = ""
	}
	
	print("tour du joueur : ",(p.joueurCourant()))
	var iterateur1 : PionIT = PionIT(joueur : 1)
	var iterateur2 : PionIT = PionIT(joueur : 2)

	if p.joueurCourant() == 1{
		if p.tousLesMouvements(joueur : 1){ //renvoie True si le joueur peut faire au moins un mouvement 
			
			var repV : Bool = false
			
			print("Déplacements possible avec la carte 1 : ",(carte1.deplacementCarte))
			print("Déplacements possible avec la carte 2 : ",(carte2.deplacementCarte))
			repeat {
				print("Quelle carte voulez-vous utiliser (carte1 ou carte2) ?")
				let lectureC = readLine()
			}while(lectureC != "carte1" || lectureC != "carte2")
			

			repeat{
				print(p.pionDispo(joueur : 1))
				print("Quelle pion voulez-vous déplacer ?")
				let lectureP = readLine() 
			}while(!p.pionDispo(joueur : 1).contains(lectureP)) //on vérifie si le pion récupéré se trouve dans le tableau des pions disponibles du joueur
			
			print ("Vous pouvez aller en :",(mouvementPossible(c : stringToCarte(nom : lectureC), pos : stringToPion(nom : lectureP).positionPion)))
			
			while !repV { 
				print("A quelle position voulez-vous déplacer le pion (forme tableau)? Vous pouvez (changer) de carte")
				let lecturePos = readLine()
				if lecturePos == "changer" {
					print("Choississez une nouvelle carte")
					repV = true 
				}
				else if p.estPossibleMouvement(c : stringToCarte(nom : lectureC), pos : lecturePos) {
					jouerTour(c : stringToCarte(nom : lectureC), p : stringToPion(nom : lectureP), pos : lecturePos)//on change de joueur courant
					repV = true
				}
				else {	//Si il rentre une position indisponible
					print("Vous ne pouvez pas vous déplacer sur cette case")
				}
			}
		}

		else{
			print("Vous ne pouvez déplacer aucun pion, quelle carte voulez-vous échanger ?")
			let lectureC = readLine()
			p.passerTour(c : stringToCarte(nom : lectureC))
		}

	}
	else{
		if p.tousLesMouvements(joueur : 2){ //renvoie True si le joueur peut faire au moins un mouvement 
			
			var repV : Bool = false
			
			print("Déplacements possible avec la carte 1 : ",(carte1.deplacementCarte))
			print("Déplacements possible avec la carte 2 : ",(carte2.deplacementCarte))
			
			repeat {
				print("Quelle carte voulez-vous utiliser (carte1 ou carte2) ?")
				let lectureC = readLine()
			}while(lectureC != "carte1" || lectureC != "carte2")
			

			repeat{
				print(p.pionDispo(joueur : 2))
				print("Quelle pion voulez-vous déplacer ?")
				let lectureP = readLine() 
			}while(!p.pionDispo(joueur : 2).contains(lectureP)) //on vérifie si le pion récupéré se trouve dans le tableau des pions disponibles du joueur
			
			print ("Vous pouvez aller en :",(mouvementPossible(c : stringToCarte(nom : lectureC), pos : stringToPion(nom : lectureP).positionPion)))
			
			while !repV { 
				print("A quelle position voulez-vous déplacer le pion (forme tableau)? Vous pouvez (changer) de carte")
				let lecturePos = readLine()
				if lecturePos == "changer" {
					print("Choississez une nouvelle carte")
					repV = true 
				}
				else if p.estPossibleMouvement(c : stringToCarte(nom : lectureC), pos : lecturePos) {
					jouerTour(c : stringToCarte(nom : lectureC), p : stringToPion(nom : lectureP), pos : lecturePos)//on change de joueur courant
					repV = true
				}
				else {	//Si il rentre une position indisponible
					print("Vous ne pouvez pas vous déplacer sur cette case")
				}
			}
		}
		else{
			print("Vous ne pouvez déplacer aucun pion, quelle carte voulez-vous échanger ?")
			let lectureC = readLine()
			p.passerTour(c : stringToCarte(lectureC))
		}
	}
}

print("Félicitations joueur ",p.joueurCourant()," vous avez gagné !!! ") 

// !!attention!!  dans jouerTour(), il faut vérifier si le joueur a gagné la partie avant de changer le 
// joueur courant sinon on ne va pas afficher le bon gagnant
