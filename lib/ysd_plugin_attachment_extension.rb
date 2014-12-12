require 'ysd_md_attachment_base'
require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Huasi Profile Extension
#
module Huasi

  class AttachmentExtension < Plugins::ViewListener
    include ContentManagerSystem::Support

    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})
            
        SystemConfiguration::Variable.first_or_create({:name => 'attachment.default_storage'}, 
                                                      {:value => '', :description => 'Default storage for attachments', :module => :attachment}) 
       
                                                              
    end
   
    # --------- Menus --------------------
    
    #
    # It defines the admin menu menu items
    #
    # @return [Array]
    #  Menu definition
    #
    def menu(context={})
      
      app = context[:app]

      menu_items = [{:path => '/configuration/storages',              
                     :options => {:title => app.t.site_admin_menu.storage_management,
                                  :link_route => "/admin/files/storages",
                                  :description => 'Manage the data storages. It allows to define attachments recipients.',
                                  :module => :attachment,
                                  :weight => 3}}]                      
    
    end    

    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => '/admin/files/storages',
                 :regular_expression => /^\/admin\/files\/storages/, 
                 :title => 'Storage', 
                 :description => 'Manages the data storages: creation and update of data storages',
                 :fit => 1,
                 :module => :attachment }]
      
    end
   
    # ========= Aspects ==================
    
    #
    # Retrieve an array of the aspects defined in the plugin
    #
    # The attachment aspect (complement)
    #
    def aspects(context={})
      
      app = context[:app]
      
      aspects = []
      aspects << ::Plugins::Aspect.new(:attachments, app.t.aspect.attachments, Model::Attachment, AttachmentAspectDelegate.new)
                                               
      return aspects
       
    end   
       
  end
end