class SessionsController < ApplicationController

	def create
		
		params[:provider] ? service_route = params[:provider] : service_route = 'No service recognized (invalid callback)'
		# get the full hash from omniauth
    omniauth = request.env['omniauth.auth']
    redirect_to profile_path
    puts omniauth
    @authhash = {}
    if omniauth and params[:provider]
      flash[:success] = omniauth
      if service_route == 'salesforce'
        @authhash[:email] = omniauth['info']['email'] || ''
        usr = Usr.find_by_email(@authhash[:email])
        if usr
          @authhash[:username] = omniauth['info']['email'] || ''
          srv = Service.find_by_username_and_type(@authhash, service_route)
          if srv
            srv.token = omniauth['token']
            srv.save!
          else
            @authhash = build_authhash(omniauth)
            create_service(@authhash)
          end
        else
          @authhash = build_authhash(omniauth)
          create_usr(@authhash)
        end
      end
    else
      fail
    end

	end

	def authenticateSF
    redirect_to '/auth/salesforce'
  end

	def fail
    flash[:error] = "Oops, there was an error in the authentaction process."
    redirect_to root_path
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

  def create_usr (authhash)
    debugger
    u = Usr.new
    u.name = authhash[:name]
    u.email = authhash[:email]
    u.save!
  end

  def create_service(authhash)

  end

  def build_authhash(omni)
    @authhash[:name] = omni['info']['name'] || ''
    return @authhash
  end

end
