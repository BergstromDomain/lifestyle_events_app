Ruby Gems
==================================================

##  RSpec
###  Installing RSpec
Install _RSpec_
```bash
sudo apt install ruby-rspec-core
```
Add _RSpec_ to the _Gemfile_
```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.9'
end
```
Run the _Bundler_ to install the new _gems_
```bash
bundle install
```

### Adding RSpec to the project
Run the generator to install _RSpec_ to the project
```bash
rails generate rspec:install
```
Generate an RSpec stub for the project
```bash
bundle binstubs rspec-core
```
Create a _feature_ folder under the _spec_ folder
```bash
mkdir spec/features
```

##  Capybara
###  Installing Capybara
Add _Capybara_ to the _Gemfile_
```ruby
group :test do
  gem 'capybara', '~> 3.29'
end
```
Run the _Bundler_ to install the new _gem_
```bash
bundle install
```


## Guard
### Adding Guard to the project
Add _Guard_ gems to the _Gemfile_
```ruby
group :development do
  gem 'guard', '~> 2.14.0'
  gem 'guard-rspec', '~> 4.7.2'
  gem 'guard-cucumber', '~> 2.1.2'
end
```

Run the _Bundler_ to install the new _gem_
```bash
bundle install
```

Initialize _Guard_ with the command:
```bash
guard init
```

### Updating the Guard file to include the features folder


### Running Guard
