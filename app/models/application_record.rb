class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #def user_params
    #params.require(:user).permit(:name, :introduction)
  #end
end
