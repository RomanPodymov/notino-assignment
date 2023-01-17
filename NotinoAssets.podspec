Pod::Spec.new do |s|
  s.name = "NotinoAssets"
  s.version = "1.0.0"
  s.summary = "Notino assignment for new candidates for Android and iOS positions."
  s.swift_versions = ['5.6']

  s.ios.deployment_target = "10.0"

  s.source = { :git => "https://github.com/RomanPodymov/notino-assignment.git", :tag => '1.0.0' }
  s.resource_bundles = {
    "NotinoAssets" => ["iOS/Resources/heart-bold.pdf", "iOS/Resources/heart.pdf", "iOS/Resources/ico-star-grey.pdf", "iOS/Resources/ico-star-pink.pdf"]
  }

  s.homepage = "https://github.com/RomanPodymov/notino-assignment"
  s.authors = { 'Roman Podymov' => 'podymfrombryansk@yandex.ru' }

  s.source_files = 'Sources/*.swift'
end