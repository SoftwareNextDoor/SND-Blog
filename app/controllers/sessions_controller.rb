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
          @authhash[:username] = omniauth['info']['user_name'] || ''
          srv = Service.find_by_uname_and_service_type( @authhash[:username], service_route)
          if srv.present?
            srv.token = omniauth['credentials']['token']
            srv.save!
          else
            srv = Service.new( build_service_attributes(omniauth))
            srv.service_type = service_route
            srv.save!
          end
        else
          Usr.create(build_usr_attributes(omniauth))
          srv = Service.new( build_service_attributes(omniauth))
          srv.service_type = service_route
          srv.save!
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

  def build_usr_attributes(omniauth)
    #Usr info
    usr_attributes = {}
    usr_attributes[:name] = omniauth['info']['name']
    usr_attributes[:email] = omniauth['info']['email']
    usr_attributes[:nickname] =  omniauth['info']['nickname']
    usr_attributes[:picture] = omniauth['info']['image']
    usr_attributes[:last_status_body] = omniauth['info']['user_type']
    usr_attributes[:profile] = omniauth['info']['urls']['profile']
    usr_attributes[:active] = true
    usr_attributes
  end

  def build_service_attributes(omniauth )
    #Service info
    service_attributes = {}
    service_attributes[:org_id] = omniauth['info']['organization_id']
    service_attributes[:instance_url] = omniauth['info']['urls']['query']
    service_attributes[:provider] = omniauth['info']['urls']['profile']
    service_attributes[:uname] = omniauth['info']['user_name']
    service_attributes[:uemail] = omniauth['info']['email']
    service_attributes[:token] = omniauth['credentials']['token']

    service_attributes[:active] = true
    service_attributes
  end

end
