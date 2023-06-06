class Show < ActiveRecord::Base
    has_many :characters, dependent: :destroy
    belongs_to :network
  
    def show_characters
        Character.where(show_id: id)
    end

    def actors_list
        characters.includes(:actor).map { |character| character.actor.full_name }
    end  
end