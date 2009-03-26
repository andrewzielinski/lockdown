module Lockdown
  module Frameworks
    module Rails
      module Controller
        
        def available_actions(klass)
          if klass.respond_to?(:action_methods)
            klass.action_methods
          else
            klass.public_instance_methods - klass.hidden_actions
          end
        end

        def controller_name(klass)
          klass.controller_name
        end

        # Locking methods
        module Lock
          def configure_lockdown
            puts "============> configure_lockdown!!!!!!!"
            check_session_expiry
            store_location
          end

          def set_current_user
            puts "============> set_current_user!!!!!!!"
            login_from_basic_auth? unless logged_in?
            if logged_in?
              Thread.current[:who_did_it] = Lockdown::System.
                call(self, :who_did_it)
            end
          end

          def check_request_authorization
            puts "============> checking request auth!!!!!!!"
            unless authorized?(path_from_hash(params))
              raise SecurityError, "Authorization failed for params #{params.inspect}"
            end
          end
  
          def path_allowed?(url)
            session[:access_rights] ||= Lockdown::System.public_access
            puts "============> in path_allowed checking url: #{url}\nresult: #{session[:access_rights].include?(url)}"
            session[:access_rights].include?(url)
          end
    
          def check_session_expiry
            if session[:expiry_time] && session[:expiry_time] < Time.now
              nil_lockdown_values
              Lockdown::System.call(self, :session_timeout_method)
            end
            session[:expiry_time] = Time.now + Lockdown::System.fetch(:session_timeout)
          end
          
          def store_location
            if (request.method == :get) && (session[:thispage] != sent_from_uri)
              session[:prevpage] = session[:thispage] || ''
              session[:thispage] = sent_from_uri
            end
          end

          def sent_from_uri
            request.request_uri
          end
      
          def authorized?(url, method = nil)
            return false unless url

            return true if current_user_is_admin?

            method ||= request.method

            url_parts = URI::split(url.strip)

            url = url_parts[5]

            return true if path_allowed?(url)

            begin
              hash = ActionController::Routing::Routes.recognize_path(url, :method => method)
              return path_allowed?(path_from_hash(hash)) if hash
            rescue Exception
              # continue on
            end

            # Passing in different domain
            return remote_url?(url_parts[2])
          end
    
          def access_denied(e)

            RAILS_DEFAULT_LOGGER.info "Access denied: #{e}"

            if Lockdown::System.fetch(:logout_on_access_violation)
              reset_session
            end
            respond_to do |format|
              format.html do
                store_location
                redirect_to Lockdown::System.fetch(:access_denied_path)
                return
              end
              format.xml do
                headers["Status"] = "Unauthorized"
                headers["WWW-Authenticate"] = %(Basic realm="Web Password")
                render :text => e.message, :status => "401 Unauthorized"
                return
              end
            end
          end

          def path_from_hash(hash)
            hash[:controller].to_s + "/" + hash[:action].to_s
          end

          def remote_url?(domain = nil)
            return false if domain.nil? || domain.strip.length == 0
            request.host.downcase != domain.downcase
          end

          def redirect_back_or_default(default)
            if session[:prevpage].nil? || session[:prevpage].blank?
              redirect_to(default) 
            else
              redirect_to(session[:prevpage])
            end
          end
  
          # Called from current_user.  Now, attempt to login by
          # basic authentication information.
          def login_from_basic_auth?
            username, passwd = get_auth_data
            if username && passwd
              set_session_user ::User.authenticate(username, passwd)
            end
          end

          @@http_auth_headers = %w(X-HTTP_AUTHORIZATION HTTP_AUTHORIZATION Authorization)
          # gets BASIC auth info
          def get_auth_data
            auth_key  = @@http_auth_headers.detect { |h| request.env.has_key?(h) }
            auth_data = request.env[auth_key].to_s.split unless auth_key.blank?
            return auth_data && auth_data[0] == 'Basic' ? Base64.decode64(auth_data[1]).split(':')[0..1] : [nil, nil] 
          end
        end # Lock
      end # Controller
    end # Rails
  end # Frameworks
end # Lockdown

