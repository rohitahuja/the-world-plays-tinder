class HomeController < ApplicationController

  def index
  	@pyro = init()
	@profileData = {}

	update()

	respond_to do |format|
	  format.html
	  format.json { render json: @profileData }
	end
  end


  def init
  	fACEBOOK_ID = '100003742865040'
  	fACEBOOK_TOKEN = 'CAAGm0PX4ZCpsBAAkPoiojgN4IUjONDU1y5JZAkzkcsKcygpvw4s3WspOypvfZCbAuSzHlnQE1TYdCaRUBk6RkEwRRPVnw47DEcWxZCOQRB4mU4qS8bFUb8QUGHLxb2f3b6LwZAgJ7UjElq0WtOk4211CSUdqton2lo4CMWoFf2h4fFtTSjqpty5eJ291s9kZCYhusAsHVOB3hbGk7KVtBF716Oydnvc2EZD'
  	pyro = TinderPyro::Client.new
	pyro.sign_in(fACEBOOK_ID, fACEBOOK_TOKEN)
	return pyro

  end

 

  def update
  	temphash = @pyro.get_nearby_users
  	#binding.pry
  	@profileData["name"] = temphash["results"][0]["name"]
  	age = Time.now.year - temphash["results"][0]["birth_date"].byteslice(0,4).to_i
  	@profileData["age"] = age
  	@profileData["bio"] = temphash["results"][0]["bio"]
  	@profileData["photos"] = temphash["results"][0]["photos"][0]["processedFiles"][0]["url"]
  end

  def like

  end

  def dislike

  end
end
