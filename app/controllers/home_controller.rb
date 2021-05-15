class HomeController < ApplicationController
       before_action :authenticate_user!

       def index
              if user_signed_in?
                     @user_properties = Property.where(user_id: current_user.id)
              end
              @properties = Property.all
       end

       def explore
              @properties = Property.all.where.not(user_id: current_user.id)
              @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(9)
       end

end