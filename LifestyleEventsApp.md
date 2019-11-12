Lifestyle Events App
==================================================

##  Creating the Lifestyle Events App
Move to the working directory and create a new application without the testing framework
```bash
rails new lifestyle_events_app -T
```
Move to the application folder and run the _Bundler_ to install the _gems_
```bash
bundle install
```
Start the server
```bash
cd lifestyle_events_app
rails server
```

View the local application in Firefox
- http://localhost:3000/


##  Git
###  Initializing the Git Repository
```bash
git init
git status
git add -A
git status
git commit -m "Initializing Lifestyle Events App"
```

### Pushing an existing repository from the command line
```bash
git remote add origin git@github.com:BergstromDomain/lifestyle_events_app.git
git push -u origin master
git remote -v
```

##  RSpec and Capybara
###  Installing RSpec and Capybara
Install _RSpec_
```bash
sudo apt install ruby-rspec-core
```
Add _RSpec_ and _Capybara_ to the _Gemfile_
```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'capybara', '~> 2.7.1'
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
Generate a stub for the project
```bash
bundle binstubs rspec-core
```
Create a _feature_ folder under the _spec_ folder
```bash
mkdir spec/features
```




```bash
```

```bash
```

```bash
```












####################################################################################################
##  Configure RSpec
####################################################################################################

# Update .rspsec
--color
--require spec_helper
--format progress
--no-profile
--no-fail-fast
--order defined


####################################################################################################
##  Feature test for Lifestyle Events app
####################################################################################################

git checkout -b lifestyle-events-feature-success 		# Create a branch
git branch

mkdir spec/features

# Create RSpec file creating_lifestyle_event_spec.rb
require "rails_helper"

RSpec.featur "Creating Lifestyle Events" do
  scenario "A user created a new lifestyle event" do
    visit "/"

    click_link "New Lifestyle Event"

    fill_in "Name", with: "Adam Alpha"
    fill_in "Date", with: "1-Jan-2001"
    fill_in "Event Type", with: "Birthday"

    click_button "Create Lifestyle Event"

    expect(page).to have_content("Lifestyle event has been created")
    expect(page.current_path).to eq(lifestyle_events_path)
  end
end



####################################################################################################
##  Generate a Lifestyle Events controller with an Index action
####################################################################################################

rails generate controller lifestyle_events index


####################################################################################################
##  Update the index.html.erb file
####################################################################################################

<%= link_to "New Lifestyle Event", new_lifestyle_event_path %>


####################################################################################################
##  Add the resources to the routes.rb file
####################################################################################################

Rails.application.routes.draw do
  root to: "lifestyle_events#index"

  resources :lifestyle_events
end


####################################################################################################
##  Generating the Lifestyle Event Model
####################################################################################################

rails generate model lifestyle_event name:string date:string type:string


####################################################################################################
##  Modify the migration file to use the up and down methods
####################################################################################################

class CreateLifestyleEvents < ActiveRecord::Migration[5.2]
  def up
    create_table :lifestyle_events do |t|
      t.string :name
      t.string :date
      t.string :type

      t.timestamps
    end

    def down
      drop_table :lifestyle_events do |t|
        t.string :name
        t.string :date
        t.string :type

        t.timestamps
      end

  end
end


####################################################################################################
##  Run the migration
####################################################################################################

rails db:migrate


####################################################################################################
##  Run the Rails Console to test the model
####################################################################################################

rails console

LifestyleEvent.all
LifestyleEvent

exit


####################################################################################################
##  Add create action to the controller
####################################################################################################

def create
  @lifestyle_event = LifestyleEvent.new(lifestyle_event_params)
  @lifestyle_event.save
  flash[:success] = "Lifestyle event has been created"
  redirect_to lifestyle_events_path
end

#  Add flah message to the application


####################################################################################################
##  Git commit changes and merge to master branch
####################################################################################################

git status
git add --A
git commit -m "Create Lifestyle Event Successfully"
git checkout master
git merge lifestyle-events-feature-success
git push


####################################################################################################
##  Adding styling with Bootstrap
####################################################################################################

# Update Gemfile
# Add gem bootstrap-sass
# Add gem autoprefixer-rails

bundle install


####################################################################################################
##  Creating a custom.css.scss stylesheet file
####################################################################################################

@import "bootstrap-sprockets";
@import "bootstrap";


####################################################################################################
##  Copy a navbar template from Bootstrap
####################################################################################################

# Add the navigation bar to application.html.erb


####################################################################################################
##  Adding Guard
####################################################################################################

git checkout -b adding-guard

# Add gems to gemfile
# guard
# guard-rspec
# guard-cucumber

# Install Guard on the system
sudo apt install ruby-guard

bundle install
bundle binstubs guard
guard init

# Start Guard
guard

# Stop Guard
exit

# Initialise cucumber
cucumber --init
