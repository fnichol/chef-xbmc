# DESCRIPTION:

# REQUIREMENTS:

# ATTRIBUTES: 

# USAGE:

# NOTES:

* Based on documentation from http://wiki.xbmc.org/?title=XBMCbuntu
* Currently focused on targetting Acer Aspire R1600 (http://support.acer.com/acerpanam/desktop/2009/acer/aspire/AspireR1600/AR1600sp2.shtml)

    apt-get install python-software-properties pkg-config
    add-apt-repository ppa:team-xbmc-svn/ppa
    apt-get update
    apt-get install nvidia-current nvidia-settings mesa-utils libvdpau-dev
    nvidia-xconfig -s --no-logo --force-generate --output-xconfig=/etc/X11/xorg.conf
    adduser xbmc --gecos XBMC
    usermod --group audio,video,fuse,cdrom,plugdev xbmc
    apt-get install xbmc-live
    xinit xbmc-standalone         # as user xbmc
    apt-get install linux-sound-base alsa-base alsa-utils
    apt-get install policykit-1 upower
