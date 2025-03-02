# frozen_string_literal: true

source "https://rubygems.org"

ruby ">=3.3.7"

# Stelle sicher, dass Jekyll explizit eingebunden ist, damit alle erforderlichen
# Abhängigkeiten (wie Nokogiri, async, etc.) korrekt aufgelöst werden.
gem "jekyll", "~> 4.4"

gem "jekyll-theme-chirpy", "~> 7.2", ">= 7.2.4"

# Da html-proofer während des Builds gebraucht wird und sonst als Test-Gem ausgeschlossen werden könnte,
# binden wir es hier außerhalb einer speziellen Gruppe ein.
gem "html-proofer", "~> 5.0"

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.2.0", platforms: [:mingw, :x64_mingw, :mswin]

# Falls du auf einem linux-musl basierten System baust, nutze eine angepasste Version des Sass-Converters
if RUBY_PLATFORM =~ /linux-musl/
  gem "jekyll-sass-converter", "~> 3.0"
end
