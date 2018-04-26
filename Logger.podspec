
Pod::Spec.new do |s|
  s.name             = 'Logger'
  s.version          = '0.1.0'
  s.summary          = 'Logger class is used to print debug information during runtme'
  s.description      = <<-DESC
  s.swift_version = '>= 3.2, <= 4.0'
   It contain class methods,date formaters and different type of log types
			DESC
 
  s.homepage         = 'https://github.com/IpyCreator/swiftlogger'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Saurabh Mishra>' => '<saurabhmishra2290@gmail.com>','<Sauvik Dolui>' => 'sauvikdolui@gmail.com' }
  s.source           = { :git => 'https://github.com/IpyCreator/swiftlogger.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'swiftlogger/*'
 
end
