Pod::Spec.new do |spec|
spec.name         = "Core"
spec.version      = "0.0.1"
spec.summary      = "Brief description"
spec.description  = <<-DESC
This is a way longer description
DESC
spec.homepage     = "https://github.com/Rezki-Pratama/Modularization-Core"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "Rezki Pratama" => "rezki.pratama7777@gmail.com" }
spec.documentation_url = "https://github.com/Rezki-Pratama/Modularization-Core/blob/0.0.1/README.md"
spec.platforms = { :ios => "14.0", :osx => "10.15", :watchos => "6.0" }
spec.swift_version = "5.1"
spec.source       = { :git => "https://github.com/Rezki-Pratama/Modularization-Core.git", :tag => "#{spec.version}" }
spec.source_files  = "Sources/Core/**/*.swift"
spec.dependency 'Realm+JSON', '~> 0.2'
spec.ios.deployment_target = "9.0"
end
