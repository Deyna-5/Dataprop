class HomeController < ApplicationController

       def index
              if user_signed_in?
                     @user_properties = Property.where(user_id: current_user.id)
              end
              @properties = Property.all
       end

       def explore
              @properties = Property.all.where.not(user_id: current_user.id)
       end

end