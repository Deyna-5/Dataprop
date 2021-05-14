class LikesController < ApplicationController
       before_action :authenticate_user!
       before_action :find_property
       before_action :find_like, only: [:destroy]

       def create
              if already_liked?
                     redirect_to explore_path, alert: "No puedes dar like más de una vez a una misma propiedad"
              else
                     @property.likes.create(user_id: current_user.id)
                     redirect_to explore_path, notice: "Haz dado like a una propiedad"
              end
       end

       def destroy
              if !(already_liked?)
                     redirect_to explore_path, notice: "No le puedes dar unlike"
              else
                     @like.destroy
                     redirect_to explore_path, notice: "Haz eliminado el like"
              end
       end

       private
              def find_like
                     @like = @property.likes.find(params[:id])
              end

              def find_property
                     @property = Property.find(params[:property_id])
              end

              def already_liked?
                     Like.where(user_id: current_user.id, property_id: params[:property_id]).exists?
              end
end
