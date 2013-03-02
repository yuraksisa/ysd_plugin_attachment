Gem::Specification.new do |s|
  s.name    = "ysd_plugin_attachment"
  s.version = "0.1.2"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-07-30"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "CMS extension to manage attachments"
  s.summary = "CMS extension to manage attachments"
  
  s.add_runtime_dependency "mime-types", "1.19"
    
  s.add_runtime_dependency "ysd_core_plugins"
  s.add_runtime_dependency "ysd_md_attachment"
   
end