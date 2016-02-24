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
```

Follow the Linux instructions but use `brew` rather than `apt-get`

### Linux

#### Ubuntu <= 14.04
If you have Ubuntu 14.04 or below, you will need to manually install ruby
`2.2`, if your package manager has ruby `2.2` feel free to skip this step.

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --rails
```

#### Ubuntu >= 14.04 and other Linux distros
-   Ubuntu

    ```sh
    sudo apt-get install ruby
    gem install rails
    ```

-   Mac OSX

    ```sh
    brew install ruby
    gem install rails
    ```

- Otherwise, use your system's package manager; i.e. `pacman`, `yum` or whatever.

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
