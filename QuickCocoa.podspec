
Pod::Spec.new do |s|
  
  s.name         = "QuickCocoa"
  s.version      = "1.0.2"
  s.platform     = :ios, '8.0'
  s.summary      = "Objective-C library."
  s.description  = <<-DESC
		A convenient tire to do UI jobs.
                       DESC
  
  s.homepage     = "https://github.com/briceZhao/QuickCocoa"
  
  s.license      = "MIT"

  s.author             = { "briceZhao" => "zx_brice@126.com" }

  s.source       = { :git => "https://github.com/briceZhao/QuickCocoa.git", :tag => "#{s.version}" }

  s.requires_arc = true

  s.source_files  = 'QuickCocoa/*.{h,m}'

  s.framework  = "UIKit", "Foundation"

end
