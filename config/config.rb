require 'fileutils'
require 'nokogiri'

module Config
  # TODO: These need to be removed.
  config  = File.open('tiapp.xml')
  doc     = Nokogiri::XML(config)
  config.close


  PROJECT_ROOT        = FileUtils.pwd()

  IPHONE_SDK_VERSION  = "4.3"

  # ANDROID_SDK_ID 6 is Google APIs 2.2 
  # id:s can be listed with titanium mobile_sdk's avd.py command
  #   $ /Library/Application Support/Titanium/mobilesdk/osx/1.7.2/android <ANDROID_SDK_DIR>
  # which currently returns (not sure if this is system dependent)
  #
  # [{'skins': ['HVGA', 'HVGA-L', 'HVGA-P', 'QVGA-L', 'QVGA-P'], 
  #   'name': 'Android 1.5', 'id': '1'}, 
  #  {'skins': ['HVGA', 'QVGA', 'WVGA800', 'WVGA854'], 
  #   'name': 'Android 1.6', 'id': '2'}, 
  #  {'skins': ['HVGA', 'QVGA', 'WQVGA400', 'WQVGA432', 'WVGA800', 'WVGA854'], 
  #   'name': 'Android 2.1-update1', 'id': '3'}, 
  #  {'skins': ['WVGA854', 'WQVGA400', 'HVGA', 'WQVGA432', 'WVGA800', 'QVGA'], 
  #   'name': 'Google APIs Android 2.1-update1', 'id': '4'}, 
  #  {'skins': ['HVGA', 'QVGA', 'WQVGA400', 'WQVGA432', 'WVGA800', 'WVGA854'], 
  #   'name': 'Android 2.2', 'id': '5'}, 
  #  {'skins': ['WVGA854', 'WQVGA400', 'HVGA', 'WQVGA432', 'WVGA800', 'QVGA'], 
  #   'name': 'Google APIs Android 2.2', 'id': '6'}, 
  #  {'skins': ['HVGA', 'QVGA', 'WQVGA400', 'WQVGA432', 'WVGA800', 'WVGA854'], 
  #   'name': 'Android 2.3.1', 'id': '7'}, 
  #  {'skins': ['WVGA854', 'WQVGA400', 'HVGA', 'WQVGA432', 'WVGA800', 'QVGA'], 
  #   'name': 'Google APIs Android 2.3.1', 'id': '8'}, 
  #  {'skins': ['HVGA', 'QVGA', 'WQVGA400', 'WQVGA432', 'WVGA800', 'WVGA854'], 
  #   'name': 'Android 2.3.3', 'id': '9'}, 
  #  {'skins': ['WXGA'], 
  #   'name': 'Android 3.0', 'id': '10'}]
  
  ANDROID_SDK_DIR="/Users/mepihlaj/projects/android/android-sdk-mac_x86"
  ANDROID_SDK_ID="6"

  TI_SDK_VERSION      = "1.7.3"
  TI_DIR              = "/Library/Application\\ Support/Titanium"

  TI_ASSETS_DIR       = "#{TI_DIR}/mobilesdk/osx/#{TI_SDK_VERSION}"
  TI_IPHONE_DIR       = "#{TI_ASSETS_DIR}/iphone"
  TI_ANDROID_DIR      = "#{TI_ASSETS_DIR}/android"
  TI_IPHONE_BUILD     = "#{TI_IPHONE_DIR}/builder.py"
  TI_ANDROID_BUILD    = "#{TI_ANDROID_DIR}/builder.py"
  
  # Application
  # TODO: No reason for having APP_ID or APP_NAME. Still thinking through APP_DEVICE.
  APP_ID              = doc.xpath('ti:app/id').text
  APP_NAME            = doc.xpath('ti:app/name').text
end
