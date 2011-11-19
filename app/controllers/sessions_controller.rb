class SessionsController < ApplicationController

	def create
		
		params[:provider] ? service_route = params[:provider] : service_route = 'No service recognized (invalid callback)'
		# get the full hash from omniauth
    omniauth = request.env['omniauth.auth']
    redirect_to profile_path
    puts omniauth

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

end
