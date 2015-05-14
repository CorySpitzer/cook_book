source("https://rubygems.org")

gem("sinatra-activerecord")
gem("sinatra-contrib", :require => "sinatra/reloader")
gem("rake")
gem("pg")

group(:test) do
  gem('capybara', require: "capybara/rspec")
  gem("rspec")
  gem("pry")
  gem('launchy')
  gem('shoulda-matchers')
end

group(:production) do
  gem("sinatra")
end
