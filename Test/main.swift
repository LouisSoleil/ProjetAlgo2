

var partie : TPartie = TPartie() // Initialise la partie

while(!partie.FinDePartie) { //Modif : findepartie=> partie.FinDePartie
    var v : Int = 0
    print("Au tour du joueur de couleur ",partie.JoueurCourant.joueur) //JoueurCourant est défini lors de l'initialisation de la partie, Modif : JoueurCourant.couleur=>partie.JoueurCourant.couleur
    var action : Int //placement en haut précedemment let action : Int = Int(readline(....))
    repeat{

         // Affichage du plateau
        for y in 0..<4 {
            var msg = ""
            for x in 0..<4 {
                if let piece = partie.plateau.QuellePiece(x: x, y: y) {
                    if piece.couleur == "Noir" {
                        msg += "\u{001B}[34m"
                    }

                    switch piece.forme {
                        case "Cone":
                            msg += "  Cône  "
                            break
                        case "Sphere":
                            msg += " Sphere "
                            break
                        case "Cylindre":
                            msg += "Cylindre"
                        case "Cube":
                            msg += "  Cube  "
                            break
                        default:
                            break
                    }

                    msg += "\u{001B}[0m"
                } else {
                    msg += "   --   "
                }

                if x == 1 {
                    msg += " | "
                }
            }
            print(msg)
            if(y == 1) {
                print("---------------------------------")
            }
        }
        
        repeat {
            print("Séléctionner l'action que vous voulez effectuer :")
            print("1. Jouer")
            print("2. Voir les pièces qu'il vous reste")
            
            action = Int(readLine() ?? "0") ?? 0
        } while (action != 1 && action != 2)
        
        if(action == 2) {
            print(partie.JoueurCourant.PieceDispo()) //PieceDispo est une fonction est non une propriété
        }

        var choix : Int

        repeat {
            print("Entrez la forme de la pièce que vous voulez placer :")
            print("1. Cube")
            print("2. Cylindre")
            print("3. Sphère")
            print("4. Cône")
            print()
            choix = Int(readLine() ?? "0") ?? 0
        } while(choix != 1 && choix != 2 && choix != 3 && choix != 4)
        
        var f : TPiece?
        do {
            if (choix == 1) {
                f = try TPiece(form: "Cube", coul: partie.JoueurCourant.joueur) //Modif : eForme.Cube => TPiece.eForme.Cube
            }
            else if (choix == 2) {
                f = try TPiece(form: "Cylindre", coul: partie.JoueurCourant.joueur)//idem
            }
            else if (choix == 3) {
                f = try TPiece(form: "Sphere", coul: partie.JoueurCourant.joueur) // idem
            }
            else if (choix == 4) {
                f = try TPiece(form: "Cone", coul: partie.JoueurCourant.joueur)//idem
            }

            let forme = f!

            let pi = partie.JoueurCourant.ChercherPiece(forme : forme)

        
            if(pi != nil) { //Cas ou la pièce est disponible
                var choixCoordX : Int = -1
                var verifX : Bool = false //Bool qui vérifie que x entré soit valide (non vide et de type Int a la sortie)
                repeat {
                    print("Entrez la coordonnée de la ligne sur laquelle placer votre pièce")
                    if let x1 = readLine() {
                        if let x2 = Int(x1) {
                            if(partie.plateau.Verif(x:x2)){ //Verif() : fonction qui vérifie si la coordonnée donnée est comprise dans le plateau de jeu
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
                            if partie.plateau.Verif(x:y2){ //Verif() : fonction qui vérifie si la coordonnée donnée est comprise dans le plateau de jeu
                                verifY = true
                                choixCoordY = y2
                            }
                        }
                    }
                } while(!verifY)

                //Vérifie que la pièce peut être posée ici : càd pas de pièce de même forme de l'adverse sur la même ligne/colonne/région, Modif : partie.plateau
                if (
                    partie.plateau.RegionDispo(p:forme,x:choixCoordX,y:choixCoordY) && 
                    partie.plateau.LigneDispo(p:forme,x:choixCoordX,y:choixCoordY) && 
                    partie.plateau.ColonneDispo(p:forme,x:choixCoordX,y:choixCoordY) && 
                    !partie.plateau.isOccupied(x:choixCoordX,y:choixCoordY)
                ) { 
                    partie.plateau.PlacerPiece(p: forme, x: choixCoordX, y: choixCoordY)                                                                                                                                                          //Modif des paramètres pour correspondre au protocol
                    print("La pièce ", pi! ," est placée aux coordonnées ","(",choixCoordX,";",choixCoordY,")")
                    partie.JoueurCourant.RetirerPiece(p: forme)
                    partie.ChangerJoueurCourant()
                    v = 1
                } else { //Cas où la pièce ne peut pas être placée car il y a déjà une pièce de même forme sur la ligne/colonne/région posée par l'adversaire
                    print("La pièce que vous avez séléctionnée ne peut pas être placée ici")
                }
            } else { 
                print("Vous n'avez plus de pièce de cette forme")
            } //Cas où la pièce n'est pas dispo dans la collection du joueur
        }
    } while(v == 0)
}
print ("Le gagnant est le joueur de couleur ",partie.Gagnant().joueur)

