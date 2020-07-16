
Pod::Spec.new do |s|
  s.name         = "RNTrueTime"
  s.version      = "1.0.0"
  s.summary      = "RNTrueTime"
  s.homepage     = "https://github.com/soarb/react-native-truetime"
  s.license      = "MIT"
  s.author       = { "author" => "benji@gooii.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/soarb/RNTrueTime.git", :tag => "master" }
  s.source_files = "ios/**/*.{h,m}"
  s.requires_arc = true
  s.dependency 'React'
  s.dependency 'TrueTime'
end

  
