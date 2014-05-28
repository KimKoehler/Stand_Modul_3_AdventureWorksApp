require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super
    @default_menu = {
      "About" => '/app/Company',
      "Home" =>  '/app',
      "Settings" => '/app/Settings',
      "View Log" => :log,
      "Exit" => :close,
    }
    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
    
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
          @session = Session.find(:first)
          current_date = Time.new
          day_of_year = current_date.yday
          if @session.nil?
          @session = Session.create('last_load' => day_of_year)
          else
          if SyncEngine::logged_in == 1 
          SyncEngine.logout if day_of_year != @session.last_load_to_i 
          end
          end
          @session.last_load = day_of_year
          @session.save
  end
end
