Ruby on Rails Summary
==================================================
This **Ruby on Rails Summary** is my documentation of getting started with _Ruby on Rails_. It briefly touches which _Gems_ to use, some _IDE_ specific configurations and setting, version control with _Git_ as well as deployment to both _Heruko_ and _AWS_. It's written as a reference guide for myself but hopefully it will be useful for you as well.

##  References
- [guides.rubyonrails.org](guides.rubyonrails.org)
- [http://guides.rubyonrails.org/form_helpers.html](http://guides.rubyonrails.org/form_helpers.html)
- [http://api.rubyonrails.org/classes/ActionDispatch/Flash.html](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html)
- [https://www.youtube.com/watch?v=ZDR433b0HJY](https://www.youtube.com/watch?v=ZDR433b0HJY)
- [https://git-scm.com](https://git-scm.com)
- [https://github.com](https://github.com)


##  Setting up Rails
I used the following steps to set up _Rails_
```bash
sudo apt update
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```


##  Creating new Ruby on Rails project
The following steps are recommended when you start a new _Rails_ project
1. **Set up the environment**
  1. [Start a new _Rails_ project](#start-a-new-rails-project)
  2. [Install the _RSpec_ gem](/GemSummary.md#rspec)
  3. [Install the _Capybara_ gem](/GemSummary.md#capybara)
  4. [Install the _Guard_ gem](/GemSummary.md#guard)
  5. [Initialize a _Git_ repository](/GitSummary.md)
2. **CRUD for the first model in your application**
  1. Create a _Git_ feature branch
  2. Create a _RSpec_ feature spec
  3. Update _Routes_
  4. Create _Controller_
  5. Create _View_
  6. Update styling using _Bootstrap_ or other framework
  7. Create a _Model_
  8. Add _Data validation_ to your model
  9. Refactor your code
  10. Commit your code and merge into the _Master branch_
3. **User Management**
  1. Add the _Device_ gem
  2. Create the _Sign-up_ functionality
  3. Create the _Log in_ functionality
  4. Create the _Log out_ functionality
  5. Install the _Factory Girl_ gem
4. **Adding additional functionality for your application**



## Start a new Rails project
Start a new (_Todo_) project with the _Rails new_ command
```bash
rails new todoapp
```

Update _Gemfile_ before running the _installer_ with
```bash
bundle install
```

Starting the local Rails server
```bash
cd todoapp
rails s
```

View the application local host in Firefox
http://localhost:3000/


##  Adding a root route
Edit _/config/routes.rb_ by adding a root route
```ruby
    root "pages#home"
```

To get all the CRUD routes for your application, add _resources_
```ruby
resources :todos
```


##  Creating the pages controller
Create the file _/controllers/pages_controller.rb_
```ruby
class PagesController < ApplicationController
end
```

##  Adding a home action
Edit the file _/controllers/pages_controller.rb_ by adding a _home_ action
```ruby
def home
end
```

###  Creating a view for the home action
Create the folder _/views/pages_ and create the file _views/pages/home.html.erb_
```ruby
<h1>Home view</h1>
```


###  Creating a migration
Create a migration file using a generator
```bash
rails generate migration create_todos
```
Modify the migration file _/db/migrate/[date stamp]_cretate_todos_ to add the required columns.
Migrate your changes with the _migrate_ command
```bash
rails db:migrate
```


## Rails Console
The _Rails Console_ lets you interact with the database
```bash
rails console
```

###  CRUD from the console
Create a model by modifying _/models/todo.rb_
Open the _Rails Console_ and perform some _CRUD_ actions
```ruby
Todo.all
cook = Todo.new(name: "Cook", description: "Cook dinner")
cook.save

bake = Todo.create(name: "Bake", description: "Bake a cake")

todo2 = Todo.find 2
todo2.destroy

todo3.save
todo3.errors.any?
todo3.errors.full_message
```

## RSpec

### Running RSpec
Run all specs
```bash
rspec
```
Run specific specs
```bash
rspec spec/features/create_spec.rb
```

```bash
```


## Cloud9
###  Start server in Cloud9
Move into the application folder and run the _start_ command
- `bash$ cd myRailsApp`
- `bash$ rails s -b $IP -p $PORT`
