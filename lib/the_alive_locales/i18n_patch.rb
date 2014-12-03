module I18n
  class << self
    def translate(*args)
      tname = args.try :[], 0
      _args = args.try :[], 1
      scope = Array.wrap _args.try(:[],:scope) || _args.try(:[], 'scope')

      key   = [ scope, tname ].flatten
      value = super

      TheAliveLocales.dump(locale.to_s, key, value)

      value
    end

    alias_method :t, :translate
  end
end
