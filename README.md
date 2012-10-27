# Automating the Cloud

As given Oct 27, 2012 at [CPOSC](http://cposc.org)

Slides are at https://speakerdeck.com/matschaffer/automating-the-cloud-unix

# Usage

1. Get a chef server: Do this by either going to http://manage.opscode.com or http://devops.mashion.net/chef-install and follow the instructions

2. Set up your workstation using the instructions at http://wiki.opscode.com/display/chef/Workstation+Setup

3. Set up a server environment. The helpers in the `scripts` directory assume EC2 with the SSH key available at ./cposc-cloud.pem

Then run:

    git clone https://github.../matschaffer/cposc-cloud
    cd cposc-cloud

    gem install berkshelf
    berks install
    berks upload
    knife role from file roles/*
    ./script/cluster
