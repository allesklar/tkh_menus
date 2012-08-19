# TKH Menus

This Rails engine dynamically generates menus. 

Primarily developed for Ten Thousand Hours but we are happy to share if anybody finds it useful. It's meant primarily to be used with other tkh gems and the TKH CMS eco-system but overtime we want it to be used individually as well. The latter implementation will be accelerated if some issues and pull requests come in, denoting some interest out there.

It's still embryonic but many improvements to come.


## Pre-requisites

The following things are needed:

* Ruby 1.9.2 or later


## Installation

Add this line to your application's Gemfile:

    gem 'tkh_menus', '~> 0.0'

Then execute:

    $ bundle

Import migrations and needed files

		$ rake tkh_menus:install

Run the migrations

		$ rake db:migrate
		
And then of course restart your server!

		$ rails s


## Upgrading

Update the gem:

    $ bundle update tkh_menus

Update files, migrations, etc. This is only needed with a new minor version number ( second level from left )

		$ rake tkh_menus:update
		
Run migrations if there are new ones

		$ rake db:migrate

Start your server!

		$ rails s


## Usage


The section is located at:

    /menus

... and it should work out of the box


## Contributing

Pull requests for new features and bug fixes are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create your failing tests based on the Test Unit framework.
4. Create your code which makes the tests pass.
5. Commit your changes (`git commit -am 'Added some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
