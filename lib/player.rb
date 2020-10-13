

class Player
    attr_accessor :name, :life_points

    def initialize(name)

        @name = name
        @life_points = 100
    end

    def show_state
        puts "#{@name},tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    
    def gets_damage(less_points)
        @life_points = @life_points - less_points 
        if @life_points <= 0
        puts "le joueur #{@name} a été tué!"
        end   
    end

    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        damage = compute_damage
        puts " il lui inflige #{damage} points dommages"
        player.gets_damage(damage)   
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice = rand(1..6)
        puts " tu as trouvé une arme de niveau  #{dice}"
        if dice > weapon_level
            @weapon_level = dice
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
        puts "M@@@de elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        dice = rand(1..6)
        if dice == 1
            puts "Tu n'as rien trouvé..."
        elsif dice > 1 && dice < 6
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            if  @life_points > 100
                @life_points = 100
            end
        elsif life_pack == 6
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            if  @life_points > 100
                @life_points = 100
            end  
        end
    end

end





