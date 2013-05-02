Pod::Spec.new do |s|

  s.name         = "UIView+EasingFunctions"
  s.version      = "0.0.1"
  s.summary      = "A category on UIView that allows to use custom easing (AKA timing) functions in block-based animations."
  s.homepage     = "https://github.com/zrxq/UIView-EasingFunctions"
  s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
  s.author       = { "Zoreslav Khimich" => "me@zoreslav.com" }
  s.source       = { :git => "https://github.com/zrxq/UIView-EasingFunctions.git", :commit => "ffaf7590720058ac794441b2012d3571b28315f2" }
  s.source_files = 'UIView+EasingFunctions'
  s.framework  = 'QuartzCore'
  s.requires_arc = true

end
