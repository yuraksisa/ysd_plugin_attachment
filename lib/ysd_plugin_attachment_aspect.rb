module Huasi
  class AttachmentAspectDelegate
        include ContentManagerSystem::Support
    
    #
    # Custom representation (the attachments)
    #
    # @param [Hash] the context
    # @param [Object] the element
    #
    def custom(context={}, element)
    
      app = context[:app]
      
      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)
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
    def element_form_tab(context={})
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Edition form
    #
    def element_form(context={})
      
      app = context[:app]
      
      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
      photo_form = renderer.render('form', 'em')     
    
    end
    
    #
    # Edition extension
    #
    def element_form_extension(context={})
    
      app = context[:app]

      renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
      photo_form_extension = renderer.render('formextension', 'em')
        
              
    end
    
    #
    # View tab
    #
    def element_template_tab(context={})
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # View
    #
    def element_template(context={})
    
       app = context[:app]
    
       renderer = UIFieldSetRender::FieldSetRender.new('attachment', app)      
       template = renderer.render('view', 'em')
                
    end

  
  end
end