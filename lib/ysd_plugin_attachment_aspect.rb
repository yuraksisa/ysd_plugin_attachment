require 'ui/ysd_ui_fieldset_render' unless defined?UI::FieldSetRender

module Huasi
  class AttachmentAspectDelegate
        include ContentManagerSystem::Support
    
    #
    # Custom representation of the attachments)
    #
    # @param [Hash] the context
    # @param [Object] the element
    # @param [Object] aspect model
    #
    def custom(context={}, element, aspect_model)
    
      app = context[:app]
      
      renderer = ::UI::FieldSetRender.new('attachment', app)
      renderer.render('view','',{:element => element})
    
    end  
  
    # ========= Entity Management extension ========= 

    #
    # Information
    #
    def element_info(context={})
      app = context[:app]
      {:id => 'attachment', :description => "#{app.t.attachment.description}"} 
    end

    #
    # Edit Form tab
    #
    def element_form_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Form edition
    #
    def element_form(context={}, aspect_model)
      
      app = context[:app]
      
      renderer = ::UI::FieldSetRender.new('attachment', app)      
      photo_form = renderer.render('form', 'em')     
    
    end
    
    #
    # Form extension
    #
    def element_form_extension(context={}, aspect_model)
    
      app = context[:app]

      renderer = ::UI::FieldSetRender.new('attachment', app)      
      photo_form_extension = renderer.render('formextension', 'em')
        
              
    end
    
    #
    # View tab
    #
    def element_template_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # View
    #
    def element_template(context={}, aspect_model)
    
       app = context[:app]
    
       renderer = ::UI::FieldSetRender.new('attachment', app)      
       template = renderer.render('view', 'em')
                
    end

  
  end
end