class HomeController < ApplicationController
  @@profileData = {}
  @@pyro
  @@initialized = false

  def index
    if (!@@initialized)
      @@pyro = init()
      @@initialized = true
    end
   
   update()

    respond_to do |format|
     format.html
     format.json { render json: @@profileData }
   end
  end


  def init
  	fACEBOOK_ID = '100003742865040'
  	fACEBOOK_TOKEN = 'CAAGm0PX4ZCpsBAC4CtsKS7hpW9ZCadpZAue1ItLLQXlAAvpPYm1kaj7BIZA2MZBnxVKo1bhoe6wfUcyQk9L5nscdvXZAmZCYdZA1p8nsYhOU87ZBPyRrbebrgW2eT80A6uwl6JFmUyxsi8YDnCwwJ3AmuJjcO1HeYi94sMexdd0PM26v8FYXjJYsMYY04v7LsWK8rnuswn1XeEJVKKkOJu6shHAjVasAddiMZD'
  	pyro = TinderPyro::Client.new
	pyro.sign_in(fACEBOOK_ID, fACEBOOK_TOKEN)
	return pyro

  end

 

  def update
  	temphash = @@pyro.get_nearby_users
  	#binding.pry
  	@@profileData["name"] = temphash["results"][0]["name"]
  	age = Time.now.year - temphash["results"][0]["birth_date"].byteslice(0,4).to_i
  	@@profileData["age"] = age
  	@@profileData["bio"] = temphash["results"][0]["bio"]
  	@@profileData["photos"] = temphash["results"][0]["photos"][0]["processedFiles"][0]["url"]
  end

  def like

  end

  def dislike

  end
end
