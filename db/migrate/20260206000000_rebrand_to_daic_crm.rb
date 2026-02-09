class RebrandToDaicCrm < ActiveRecord::Migration[7.0]
  def up
    configs = {
      'INSTALLATION_NAME' => 'DAIC CRM',
      'BRAND_NAME' => 'DAIC CRM',
      'BRAND_URL' => 'https://www.daicapp.com',
      'WIDGET_BRAND_URL' => 'https://www.daicapp.com',
      'TERMS_URL' => 'https://www.daicapp.com/terms',
      'PRIVACY_URL' => 'https://www.daicapp.com/privacy'
    }
    configs.each do |name, value|
      config = InstallationConfig.find_by(name: name)
      config&.update!(value: value)
    end
    GlobalConfig.clear_cache
  end

  def down
    configs = {
      'INSTALLATION_NAME' => 'Chatwoot',
      'BRAND_NAME' => 'Chatwoot',
      'BRAND_URL' => 'https://www.chatwoot.com',
      'WIDGET_BRAND_URL' => 'https://www.chatwoot.com',
      'TERMS_URL' => 'https://www.chatwoot.com/terms-of-service',
      'PRIVACY_URL' => 'https://www.chatwoot.com/privacy-policy'
    }
    configs.each do |name, value|
      config = InstallationConfig.find_by(name: name)
      config&.update!(value: value)
    end
    GlobalConfig.clear_cache
  end
end
