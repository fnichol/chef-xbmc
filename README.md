# DESCRIPTION:

# REQUIREMENTS:

# ATTRIBUTES: 

# USAGE:

# NOTES:

* Based on documentation from http://wiki.xbmc.org/?title=XBMCbuntu
* Currently focused on targetting Acer Aspire R1600 (http://support.acer.com/acerpanam/desktop/2009/acer/aspire/AspireR1600/AR1600sp2.shtml)

    \# install prequisite pkgs
    apt-get install python-software-properties pkg-config

    \# add apt-repo and refresh
    add-apt-repository ppa:team-xbmc-svn/ppa
    apt-get update

    \# nvidia-specific video drivers
    apt-get install nvidia-current nvidia-settings mesa-utils libvdpau-dev
