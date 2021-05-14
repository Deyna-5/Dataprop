class PropertiesController < ApplicationController
       before_action :set_property, only: [:edit, :update, :destroy]

       def new
              @property = Property.new
       end

       def create
              @property = Property.new(property_params)

              if @property.save
                     redirect_to root_path, notice: "Propiedad agregada de forma éxitosa"
              else
                     render :new, alert: "Ocurrió un error, intente nuevamente"
              end
       end

       def edit
       end

       def update
              if @property.update
                     redirect_to root_path, notice: "Propiedad editada de forma éxitosa"
              else
                     render :edit, alert: "Ocurrió un error, intente nuevamente"
              end
       end

       def destroy
              @property.destroy
              redirect_to root_path, notice: "La propiedad se borró de forma éxitosa"
       end

       private
              def property_params
                     property.permit(:price, :direction, :area, :rooms, :bathrooms, :photo, :user_id)
              end

              def set_property
                     @property = Property.find(params[:id])
              end
end