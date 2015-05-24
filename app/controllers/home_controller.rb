class HomeController < ApplicationController
  @@profileData = []
  @@data = {}
  @@pyro
  @@initialized = false
  @@init_time = 0
  @@cap = 0 

  def index
    if (!@@initialized)
      @@pyro = init()
      @@initialized = true
    end
   
   update()

    respond_to do |format|
     format.html
     format.json { render json: @@data }
   end
  end


  def init
    @@init_time = Time.now.to_i
  	fACEBOOK_ID = '100003742865040'
  	fACEBOOK_TOKEN = 'CAAGm0PX4ZCpsBAC4CtsKS7hpW9ZCadpZAue1ItLLQXlAAvpPYm1kaj7BIZA2MZBnxVKo1bhoe6wfUcyQk9L5nscdvXZAmZCYdZA1p8nsYhOU87ZBPyRrbebrgW2eT80A6uwl6JFmUyxsi8YDnCwwJ3AmuJjcO1HeYi94sMexdd0PM26v8FYXjJYsMYY04v7LsWK8rnuswn1XeEJVKKkOJu6shHAjVasAddiMZD'
  	pyro = TinderPyro::Client.new
	 pyro.sign_in(fACEBOOK_ID, fACEBOOK_TOKEN)
	   temphash = pyro.get_nearby_users

     populate_data(temphash)

    
   return pyro
  end

 def populate_data(temphash)
  temphash["results"].each_with_index do |person, index|
    profdata = {}
    profdata["name"] = person["name"]
    age = Time.now.year - person["birth_date"].byteslice(0,4).to_i
    profdata["age"] = age
    profdata["bio"] = person["bio"]
    profdata["photos"] = person["photos"][0]["processedFiles"][0]["url"]
    profdata["end"] = Time.now.to_i + index*10
    @@profileData << profdata
   end
 end

  def update
    if @@profileData.length > 3
      @@data = @@profileData.shift
    end
  	populate_data(@@pyro.get_nearby_users)
    @@data = @@profileData.shift
  end

  def like

  end

  def dislike

  end
end
