require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def welcome# Message de démarrage du jeu et initialisation du joueur
    puts"
    *************************************************|
    |   Bienvenue sur 'ILS VEULENT TOUS MA POO' !    |
    | Le but du jeu est d'être le dernier survivant !|
    **************************************************"


    puts "Quel est ton prénom ?"
    print ">"
    name = gets.chomp
    user = HumanPlayer.new(name)
    player1 = Player.new("Josiane")
    player2 = Player.new("José")    
    enemies = [player1,player2]
    fight(user, enemies, player1, player2)
end

#On lance le combat avec la demande d'une action de l'utilisateur
def fight(user, enemies, player1, player2)
    while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
            user.show_state
            puts "
            Quelle action veux-tu effectuer ?

            a - chercher une meilleure arme
            s - chercher à se soigner 
            
            attaquer un joueur en vue :

            0 - Josiane a #{player1.life_points} points de vie
            1 - José a #{player2.life_points} points de vie"
            puts "*******************************************************************"  
            choice = gets.chomp     
        puts "***********************************************************************"  
        
            if choice == "a" 
                user.search_weapon
            elsif choice == "s"
                user.search_health_pack
            elsif choice == "0"
                user.attacks(player1)
            elsif choice == "1"
                user.attacks(player2)
            end

        puts "***********************************************************************" 
        enemies.each do |x|
        break if x.life_points <= 0
        x.attacks(user)
        puts "Les autres joueurs t'attaquent !"
        end
    end 
        if user.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
            else 
            puts "Loser ! Tu as perdu !"
        end
end

welcome

