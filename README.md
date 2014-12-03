## TheAliveLocales

Way to find alive localizations keys into your i18n locale files

This gem collect all executed `I18n.translate` and `I18n.t` calls and dump it into YAML file at `#{ Rails.root }/log/`

### Installation

```ruby
group :development do
  gem 'the_alive_locales', '~> 0.0.1'
end
```

And then execute:

```sh
bundle
```

### Usage

1. Install gem
2. Visit required pages with required locales
3. Learn `/log/alive_locale.LOCALE_NAME.yml`

#### MIT license
