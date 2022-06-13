class Game < ApplicationRecord
    belongs_to :hosting_user, class_name: "GuestUser" 
    belongs_to :joining_user,  optional: true, class_name: "GuestUser"
    

    enum status: [ :host_turn, :joining_turn, :host_win, :joining_win, :tie]

    def full?
      hosting_user != nil && joining_user != nil
    end

    def switch_player
      if status == "host_turn"
        self.status = "joining_turn"
      elsif status == "joining_turn"
        self.status = "host_turn"
      end

    private
end
