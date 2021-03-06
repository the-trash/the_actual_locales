require "the_actual_locales/version"

module TheActualLocales
  class Engine < ::Rails::Engine
    config.after_initialize do
      require "the_actual_locales/i18n_patch"
    end
  end

  def self.log_path locale
    "#{ Rails.root }/log/actual_locale.#{ locale }.yml"
  end

  def self.dump locale, path, value
    # Create actual file if not exists
    log_path = self.log_path(locale)
    File.open(log_path, 'w+').close unless File.exists? log_path

    # Open and read actual locale file
    i18n_log = File.open(log_path, "r")
    log_content = i18n_log.read
    i18n_log.close

    # Read YAML
    # Create { 'en' => {} } if exception
    locale_data = (begin; YAML.load(log_content); rescue; {}; end) || {}
    locale_data[locale] = {} unless locale_data[locale]

    # Set base values
    path_size     = path.size - 1
    current_level = locale_data[locale]

    # Set base values
    path.each_with_index do |v, i|
      _value = (path_size == i) ? value : {}
      current_level[v.to_s] = _value unless current_level[v.to_s]
      current_level = current_level[v.to_s]
    end

    # Open actual locale file and write
    i18n_log = File.open(log_path, 'w')
    i18n_log.write locale_data.to_yaml
    i18n_log.close
  end
end
