Pod::Spec.new do |s|
    
    s.name             = 'HFMForms'
    s.version          = '0.1.1'
    
    s.author           = { 'Brian Drelling' => 'brian@harp.fm' }
    s.homepage         = 'https://github.com/HarpFM/HFMForms'
    s.license          = 'MIT'
    s.platform         = :ios, '9.0'
    s.social_media_url = 'http://twitter.com/HarpFM'
    s.source           = { :git => 'https://github.com/HarpFM/HFMForms', :tag => 'v' + s.version.to_s }
    s.summary          = 'Library for form layouts that supports custom views and basic elements. Utilizes UIStackViews for structure.'

    s.source_files = 'HFMForms/HFMForms/**/*.swift'

end
