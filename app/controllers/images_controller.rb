class ImagesController < ApplicationController
	require 'unirest'

	def create
    #make a new image and add to the database
    image = Image.new(
      callback_url: params[:callback_url], 
      attachment: params[:attachment], 
      objects_to_annotate: params[:objects_to_annotate] 
    )
    	if image.save
       response = Unirest.post("https://api.scaleapi.com/v1/task/cuboidannotation", parameters: params)
       render json: response.as_json
    	else
      render json: {errors: image.errors.full_messages}, status: 422
   	    end
	end
end
