Vagrant Basebox definitions.
In order to use these you will have to install the rubygem *bundler* and do a one-time ``bundle install``.

Now the veewee command is available to build newer versions of a box or create new definitions.

Example (build a new version of the Centos6 SaltStack basebox):

    bundle exec veewee vbox build centos6min-salt

If that was successful you can export the new box to a file:

    bundle exec veewee vbox export centos6min-salt

