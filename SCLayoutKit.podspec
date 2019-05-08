Pod::Spec.new do |s|

    s.name         = "SCLayoutKit"
    s.version      = "1.0.0"
    s.summary      = "SCLayoutKit is autolayout helper kit"
    s.description  = <<-DESC
    SCLayoutKit aim to
  * Chainning property Attributes
                     DESC
  
    s.homepage     = "https://github.com/interactord/SCLayoutKit"
    s.license      = { :type => "MIT", :file => "LICENSE.md" }
    s.authors      = { "Scoon Moon" => "interactord@gmail.com" }
    s.platform     = :ios
    s.platform     = :ios, "12.2"
    s.swift_version = '5.0'
    s.pod_target_xcconfig = {
      'SWIFT_VERSION' => '5.0'
    }
    s.source       = { :git => "https://github.com/interactord/SCLayoutKit.git", :tag => s.version.to_s }
    s.source_files  = "SCLayoutKit/**/*.swift"
    s.frameworks  = 'UIKit', 'Foundation'
    s.requires_arc     = true  
  
  end