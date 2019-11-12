Nik's Ruby on Rails Summary
==================================================

##  References
- [guides.rubyonrails.org](guides.rubyonrails.org)
- [http://guides.rubyonrails.org/form_helpers.html](http://guides.rubyonrails.org/form_helpers.html)
- [http://api.rubyonrails.org/classes/ActionDispatch/Flash.html](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html)
- [https://www.youtube.com/watch?v=ZDR433b0HJY](https://www.youtube.com/watch?v=ZDR433b0HJY)
- [https://git-scm.com](https://git-scm.com)
- [https://github.com](https://github.com)


##  Setting up Rails
```bash
cd /mnt/w/rails/bergstromdomain/lifestyle_events_app
sudo apt update
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```


###  Gemfile
Update _Gemfile_ before running the _installer_ with
```bash
bundle install
```

##  Creating new Ruby on Rails project
Start a new (_Todo_) project with the _Rails new_ command
```bash
rails new todoapp
```


###  Starting the local Rails server
```bash
cd todoapp
rails s
```

View the application local host in Firefox
http://localhost:3000/


###  Adding a root route
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

# Cloud9
##  Start server in Cloud9
Move into the application folder and run the _start_ command
- `bash$ cd myRailsApp`
- `bash$ rails s -b $IP -p $PORT`
