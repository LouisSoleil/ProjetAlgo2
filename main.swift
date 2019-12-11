
let partie = Partie() // Initialise la partie

while(!finDePartie) {
    var v : Int = 0
    print("Au tour du joueur de couleur ",joueurCourant.couleur) //joueurCourant est défini lors de l'initialisation de la partie

    repeat{
        
        repeat {
            print("Séléctionner l'action que vous voulez effectuer :")
            print("1. Jouer")
            print("2. Voir les pièces qu'il vous reste")
            
            let action : Int = Int(readLine() ?? "0") ?? 0
        } while (action != 1 && action != 2)
        
        if(action == 2) {
            print(joueurCourant.PiecesDispo)
        }
        
        repeat {
            print("Entrez la forme de la pièce que vous voulez placer :")
            print("1. Cube")
            print("2. Cylindre")
            print("3. Sphère")
            print("4. Cône")
            let choix : Int = Int(readLine() ?? "0") ?? 0
            }while(choix != 1 && choix != 2 && choix != 3 && choix != 4)
        
        if (choix == 1) {
            var forme = eForme.Cube //Enum Forme
        }
        else if (choix == 2) {
            var forme = eForme.Cylindre
        }
        else if (choix == 3) {
            var forme = eForme.Sphere
        }
        else if (choix == 4) {
            var forme = eForme.Cone
        }
        
        let pi : Piece? = joueurCourant.chercherPiece(forme) //Renvoie une pièce de la forme demandée si possible, sinon renvoie vide
        
        if(pi != nil){ //Cas ou la pièce est disponible
            var choixCoordX : Int = -1
            var verifX : Bool = false //Bool qui vérifie que x entré soit valide (non vide et de type Int a la sortie)
            repeat {
                print("Entrez la coordonnée de la ligne sur laquelle placer votre pièce")
                if let x1 = readLine() {
                    if let x2 = Int(x1) {
                        if(Verif(x2)){ //Verif() : fonction qui vérifie si la coordonnée donnée est comprise dans le plateau de jeu
                            verifX = true
                            choixCoordX = x2
                        }
                    }
                }
            } while (!verifX)
            
            var choixCoordY = -1
            var verifY : Bool = false //Bool qui vérifie que y entré soit valide (non vide et de type Int a la sortie)
            repeat {
                print("Entrez la coordonnée de la colonne sur laquelle placer votre pièce")
                      if let y1 = readLine() {
                          if let y2 = Int(y1) {
                            if Verif(y2){ //Verif() : fonction qui vérifie si la coordonnée donnée est comprise dans le plateau de jeu
                                verifY = true
                                choixCoordY = y2
                            }
                          }
                        }
                      } while(!verifY)
            
            if (RegionDispo(pi,choixCoordX,choixCoordY) && LigneDispo(pi,choixCoordX,choixCoordY) && ColonneDispo(pi,choixCoordX,choixCoordY) && !isOccupied(pi,choixCoordX,y)) { //Vérifie que la pièce peut être posée ici : càd pas de pièce de même forme de l'adverse sur la même ligne/colonne/région
                placerPiece(pi,choixCoordX,choixCoordY)
                print("La pièce ",pi," est placée aux coordonnées ","(",choixCoordX,";",choixCoordY,")")
                joueurCourant.retirerPiece(pi)
                changerJoueurCourant()
                v = 1
            } else { //Cas où la pièce ne peut pas être placée car il y a déjà une pièce de même forme sur la ligne/colonne/région posée par l'adversaire
                print("La pièce que vous avez séléctionnée ne peut pas être placée ici")
            }
        } else { print("Vous n'avez plus de pièce de cette forme")} //Cas où la pièce n'est pas dispo dans la collection du joueur
    }while(v == 0)
    }
print ("Le gagnant est le joueur de couleur ",partie.Gagnant().couleur)

