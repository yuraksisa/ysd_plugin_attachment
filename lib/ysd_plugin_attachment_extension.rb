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
            
        SystemConfiguration::Variable.first_or_create({:name => 'default_storage'}, 
                                                      {:value => '', :description => 'Default storage for attachments', :module => :attachment}) 
       
                                                              
    end
   
    # ========= Information ========= 
   
    #
    # Information
    #
    def content_element_info(context={})
      app = context[:app]
      {:id => 'attachment', :description => "#{app.t.attachment.description}"} 
    end
 
    # ========= Content render ========
    
    #
    # Renders the context custom
    #
    # @param [Hash] the context
    # @param [Object] the content
    #
    def content_custom(context={}, content)
    
      app = context[:app]
      
      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)
      renderer.render('view','',{:element => content})
    
    end
     
    # ========= CMS Extension ========= 

    #
    # Renders the tab
    #
    def content_element_form_tab(context={})
      app = context[:app]
      info = content_element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Add fields to edit the photo information in the content form
    #
    def content_element_form(context={})
      
      app = context[:app]
      
      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
      photo_form = renderer.render('form', 'em')     
    
    end
    
    #
    # Support to edit the photo information in the content form
    #
    def content_element_form_extension(context={})
    
      app = context[:app]

      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
      photo_form_extension = renderer.render('formextension', 'em')
        
              
    end
    
    #
    # Renders the tab
    #
    def content_element_template_tab(context={})
      app = context[:app]
      info = content_element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # Show the attachment information in the content render
    #
    def content_element_template(context={})
    
       app = context[:app]
    
       renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
       photo_template = renderer.render('view', 'em')
                
    end
    
  end
end