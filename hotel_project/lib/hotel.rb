require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, hash) #the hash keys are room names values = capacity
        @name = name
        @rooms = Hash.new()
        hash.keys.each do |room_name|
            @rooms[room_name] = Room.new(hash[room_name])
        end
    end

    def name
        newarr = @name.split(" ").map {|word| word.capitalize}
        newarr.join(" ")
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person) #review this part
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        
        @rooms.values.each do |room_name|
            if !room_name.full? #if any room is not full return false
                return true
            end
        end
        false
    end

    def list_rooms
        roomlist = @rooms.keys
        roomlist.each do |room_name|
           puts room_name + @rooms[room_name].available_space.to_s
           
        end
    end

end
