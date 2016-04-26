@version = "1.0.4"
Pod::Spec.new do |s|
  s.name         = "StretchHeader"
  s.version      = @version
  s.summary      = "tableview stretch header"
  s.homepage     = "https://github.com/y-hryk/StretchHeader"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "y-hryk" => "dev.hy630823@gmail.com" }
  s.source       = { :git => "https://github.com/y-hryk/StretchHeader.git", :tag => @version }
  s.source_files = "StretchHeader/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
end
