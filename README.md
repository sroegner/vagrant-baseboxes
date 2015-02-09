Vagrant Basebox definitions.
In order to use these you will have to install the rubygem *bundler* and do a one-time ``bundle install``.

Now the veewee command is available to build newer versions of a box or create new definitions.

Example (build a new version of the Centos6 SaltStack basebox):

    ./vee build centos6-salt

If that was successful you can export the new box to a file:

    ./vee export centos6-salt

