# frozen_string_literal: true

source "https://rubygems.org"

gem "jekyll", "~> 4.4"

gem "jekyll-theme-chirpy", "~> 7.2", ">= 7.2.4"

gem 'jekyll-compose', group: [:jekyll_plugins]

gem "html-proofer", "~> 5.0"

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.2.0", platforms: [:mingw, :x64_mingw, :mswin]

if RUBY_PLATFORM =~ /linux-musl/
  gem "jekyll-sass-converter", "~> 3.0"
end
