Pod::Spec.new do |s|
    
    s.name             = 'HFMForms'
    s.version          = '0.1.0'
    
    s.author           = { 'Brian Drelling' => 'brian@harp.fm' }
    s.homepage         = 'https://github.com/HarpFM/HFMForms'
    s.license          = 'MIT'
    s.platform         = :ios, '9.0'
    s.social_media_url = 'http://twitter.com/HarpFM'
    s.source           = { :git => 'https://github.com/HarpFM/HFMForms', :tag => s.version }
    s.summary          = 'Allows easy generation of forms.'

    s.source_files = 'HFMForms/HFMForms/**/*.swift'

end
