# CompSoc Website

## [compsoc.maynoothuniversity.ie](http://rails-compsoc-env.es7mszu33e.eu-west-1.elasticbeanstalk.com/)
Currently hosted on an AWS Elastic Beanstalk instance but will be hosted on our
own machines when they are set up.

## Contributing/Forking
Feel free to fork this website and use it for whatever. 

**Note**: There are a few files we have omitted for security.
- `Website.env` - Contains API keys

These files can be found in our private Repo, committee members and website
contributors should have access to this. Contact the committee for access to
these, in the mean time, you may need to spoof these to get the website up and
running

## Installing Ruby on Rails

### Windows
You can find an installer online <http://railsinstaller.org/en>

### Mac OSX
ruby is installed by default but you may want a new version:

Install the [brew package manager](http://brew.sh):

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ruby
gem install rails
```

If you haven't already, make sure to install git and a few other useful tools:

```sh
brew install git curl wget
```

### Linux
This is the easy one

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --rails
```

**Note 0:** You may need to enter your password a few times during the installation.

**Note 1:** If the install fails when installing gem native extensions you may
need to install `make`. On Arch Linux I used `pacman -S base-devel`

## Fork the repo
Fork the repo on GitHub <https://github.com/MindsSociety/Website#fork-destination-box>

```sh
git clone https://github.com/<Your_username>/Compsoc-Website.git
cd Compsoc-Website
bundle install      # May take a while
rake db:migrate
```

## Set environment variables
The world does not need to know our secrets; The actual values for our
production environment can be found in our private repo. Ask a committee member
for access.

In the mean time, enjoy these fake environment values.

```sh
export RAILS_SERVE_STATIC_FILES=true
export SECRET_KEY_BASE=$(rake secret)
```

**Caveat**: We can't give out our Mailchimp API Key so it wont be possible to
work on the News page if you don't have it. I may generate some fake data in
the future.
