# Be sure to run `pod spec lint UIView-EasingFunctions.podspec' to ensure this is a
Pod::Spec.new do |s|

  s.name         = "UIView+EasingFunctions"
  s.version      = "0.0.1"
  s.summary      = "A category on UIView that allows to assign custom easing (timing) functions to block-based animations"
  s.homepage     = "https://github.com/zrxq/UIView-EasingFunctions"
  s.author       = { "Zoreslav Khimich" => "me@zoreslav.com" }
  s.source       = { :git => "https://github.com/zrxq/UIView-EasingFunctions.git", :commit => "ffaf7590720058ac794441b2012d3571b28315f2" }

  # If this Pod runs on both platforms, then specify the deployment
  # targets.
  #
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'

  s.source_files = 'UIView+EasingFunctions'
  s.framework  = 'QuartzCore'
  s.requires_arc = true

end
