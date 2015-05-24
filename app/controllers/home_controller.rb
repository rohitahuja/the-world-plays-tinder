class HomeController < ApplicationController

  def index
  	@pyro = init()
	@profileData = {}

	update()
  end


  def init
  	fACEBOOK_ID = '100003742865040'
  	fACEBOOK_TOKEN = 'CAAGm0PX4ZCpsBAAhZAiYBRuQJjb6kVt4PbnBD9uR0QzetgdZArcUAwzunBpYqtNQxeElx9a9JkDqcZArvFNBO7V7Pu3Aja6EYPmQw3W6VtH2rDpkZCWKvICEFYu8m5H9WkRoxYBZA6SpaE3PJZCibmoXWQnnKs0j8SMkZCuPFeYXXa5U6EQQx3fW7nX5nZBOKdhm3pxue4g5hkkUXq9o4pE1E2lEMyxSemFgZD'
  	pyro = TinderPyro::Client.new
	pyro.sign_in(fACEBOOK_ID, fACEBOOK_TOKEN)
	return pyro

  end

  def gethash

  end

  def update
  	temphash = @pyro.get_nearby_users
  	#binding.pry
  	@profileData["name"] = temphash["results"][0]["name"]
  	age = Time.now.year - temphash["results"][0]["birth_date"].byteslice(0,4).to_i
  	@profileData["age"] = age
  	@profileData["bio"] = temphash["results"][0]["bio"]
  	@profileData["photos"] = temphash["results"][0]["photos"]
  	



  end

  def like

  end

  def dislike

  end
end
