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
  gem 'rspec-rails', '~> 3.9'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'capybara', '~> 3.29'
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

## Guard
### Adding Guard to the project
Add _Guard_ gems to the _Gemfile_
```ruby
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'guard', '~> 2.14.0'
  gem 'guard-rspec', '~> 4.7.2'
  gem 'guard-cucumber', '~> 2.1.2'
end
```

Run the _Bundler_ to install the new _gems_
```bash
bundle install
```

Initialize _Guard_ with the command:
```bash
guard init
```

Generate an Guard stub for the project
```bash
bundle binstubs guard
```

Initialize _Cucumber_ with the command:
```bash
cucumber --init
```


Update the _Guardfile_ by adding watches under the _Rails files_, _Rails config changes_ and _Capybara features specs_
```ruby
# Rails files
rails = dsl.rails(view_extensions: %w(erb haml slim))
dsl.watch_spec_files_for(rails.app_files)
dsl.watch_spec_files_for(rails.views)

watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { "spec/features" }
watch(%r{^app/models/(.+)\.rb$})  { "spec/features" }
watch(rails.controllers) do |m|
  [
    rspec.spec.call("routing/#{m[1]}_routing"),
    rspec.spec.call("controllers/#{m[1]}_controller"),
    rspec.spec.call("acceptance/#{m[1]}")
  ]
end

# Rails config changes
watch(rails.spec_helper)     { rspec.spec_dir }
watch(rails.routes)          { "spec" } # { "#{rspec.spec_dir}/routing" }
watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

# Capybara features specs
watch(rails.view_dirs)     { "spec/features" } # { |m| rspec.spec.call("features/#{m[1]}") }
watch(rails.layouts)       { |m| rspec.spec.call("features/#{m[1]}") }
```


## CRUD Event Types
### Create Event Types
Create a topic branch
```bash
git checkout -b article-feature-success
```
#### Create feature specification
Create a new file called _creating_event_types_spec.rb_
```ruby
require "rails_helper"

RSpec.feature "Creating Lifestyle Event Types" do
  scenario "A user creates a new event type" do
    visit "/"

    click_link "New Event Type"

    fill_in "Name", with: "Birthday"
    click_button "Create Event Type"

    expect(page).to have_content("Event type has been created")
    expect(page.current_path).to eq(event_types_path)
  end
end
```

#### Update the route file
Create a _root path_ by updating the _config/routes.rb_ file
```ruby
root to: "lifestyle_event_types#index"
```
Create the required resources by updating the _config/routes.rb_ file
```ruby
resources :lifestyle_event_types
```

#### Generate controller
Use a generator to create a controller
```bash
rails g controller lifestyle_event_types index
```

#### Generate model
Use a generator to create a model. __Note__ the model is singular and the controller is plural
```bash
rails g model lifestyle_event_type title:string
```

#### Run the migration
Run the migration to create a database
```bash
rails db:migrate
```



```ruby
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
