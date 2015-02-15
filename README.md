# Splunk OSX Magic Mouse Battery

A Splunk App to monitor the battery level on your Apple Magic Mouse.

I wrote this app shortly after switching from a wired mouse to a Magic Mouse, and
wanted to see how quickly my battery levels dropped. (yeah, I'm kind of a nerd, I know)


## What's Splunk?

Splunk is an amazing app that lets you monitor your logfiles and perform analytics on them.  You can monitor other kinds of data, such as the output of the ping command, which is what this app does.  A free copy of Splunk Enterprise [can be downloaded at Splunk.com](http://www.splunk.com/)


## Installation

This assumes you are running this on a machine with Vagrant and Virtual box installed.  If you are running this on a machine 
that has already been created, simply remove the references to Vagrant.

- Download this app:
	- `git clone git@github.com:dmuth/splunk-network-monitor.git`
- Start Vagrant with `vagrant up`
- SSH into the Vagrant instance with `vagrant ssh`
- Install Splunk with `sudo /vagrant/bin/install_splunk.sh`
    - Agree to the license and then watch Spkunk start
    - **Note:** that you'll need a Splunk .deb file named `splunk.deb` in the current directory
- Deploy this app:
	- `sudo /vagrant/bin/deploy_symlink.sh $SPLUNK_ROOT` if you'd like to have a symlink pointing to this directory
	- `sudo /vagrant/bin/deploy.sh $SPLUNK_ROOT` if you'd like to have this directory copied into $SPLUNK_HOME/Network-Monitor/
- Restart Splunk:
    - `sudo $SPLUNK_HOME/bin/splunk restart`
- Log into Splunk on [http://localhost:8000/](http://localhost:8000/) and click "App: Network Monitor" to see your connectivity reports.


If you are already running Splunk natively on your machine, you can skip straight to the "deploy" section.


## Usage

For now, query `index=main sourcetype=osx-magic-mouse-battery-level`.

Graphs will follow in a future release.


## How does it work?

This app periodically runs a script with a command similar to:

`ioreg -n "BNBMouseDevice" | grep -i "batterypercent" |grep -v "{" | sed 's/[^[:digit:]]//g'`

...that returns the current battery level as an integer between 0 and 100.


## Compatibility

This has been written for (and tested on) Splunk 6.2

Splunk 6.2, in turn, has been tested on Ubuntu 14.04 LTS and Macintosh OS/X 10.10.1.  **If you would like to run this in Windows**, your best bet is just to set up Ubuntu 14.04 LTS in a VM.  256 Megs of RAM should be sufficient.



## TODO

Things I might implement in the future:
- Build some graphs and ship them with this app.


    
## Questions, comments, abuse, and offers of employment

Hit me up via [email](mailto:dmuth@dmuth.org), or [Facebook](http://www.facebook.com/dmuth).


