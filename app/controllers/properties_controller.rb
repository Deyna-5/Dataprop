class PropertiesController < ApplicationController
       before_action :authenticate_user!
       before_action :set_property, only: [:edit, :update, :destroy]

       def new
              @property = Property.new
       end

       def create
              @property = Property.new(property_params)
              @property.user_id = current_user.id
              if @property.save
                     redirect_to root_path, notice: "Propiedad agregada de forma éxitosa"
              else
                     render :new, alert: "Ocurrió un error, intente nuevamente"
              end
       end

       def edit
       end

       def update
              if @property.user_id = current_user.id
                     if @property.update(property_params)
                            redirect_to root_path, notice: "Propiedad editada de forma éxitosa"
                     else
                            render :edit, alert: "Ocurrió un error, intente nuevamente"
                     end
              end
       end

       def destroy
              if @property.user_id = current_user.id
                     if @property.destroy
                     redirect_to root_path, notice: "La propiedad se borró de forma éxitosa"
                     else
                     redirect_to root_path, notice: "Ocurrió un error"
                     end
              end
       end

       private
              def property_params
                     params.require(:property).permit(:price, :direction, :area, :rooms, :bathrooms, :photo)
              end

              def set_property
                     @property = Property.find(params[:id])
              end
end