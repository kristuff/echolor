#!/bin/sh

# make sure we are in current directory as the script may be run from another location
# to use relative path 
cd `dirname $0`

# our dist directory
mkdir -p dist

# create a clean debian package directory
rm -rf debian
mkdir -p debian/DEBIAN
mkdir -p debian/usr/bin
mkdir -p debian/usr/share/doc/echolor
mkdir -p debian/usr/share/man/man1

# populate the debian directory
cp deb/control           debian/DEBIAN
cp deb/copyright         debian/usr/share/doc/echolor
cp deb/changelog         debian/usr/share/doc/echolor/changelog.Debian
gzip -9 -n               debian/usr/share/doc/echolor/changelog.Debian
# Fix Error debian-changelog-file-missing-or-wrong-name
# but add a warning instead duplicate-changelog-files
# see https://www.debian.org/doc/debian-policy/ch-docs.html#s-changelogs
cp deb/changelog         debian/usr/share/doc/echolor/changelog
gzip -9 -n               debian/usr/share/doc/echolor/changelog

cp bin/echolor           debian/usr/bin/echolor

# convert and deploy man page
/usr/bin/pandoc --standalone --to man deb/man.md -o debian/usr/share/man/man1/echolor.1
gzip -9 -n  debian/usr/share/man/man1/echolor.1

# adjust ownerships
# unused since --root-owner-group option in dpkg-deb
# chown -R root:root    debian

# adjust permissions
find debian -type d -exec chmod 0755 {} \;  #set directory attributes
find debian -type f -exec chmod 0644 {} \;  #set data file attributes
find debian/usr/bin -type f -exec chmod 0755 {} \;  #set executable attributes

# minimal permissions required for scripts
#chmod 755 debian/DEBIAN/postinst
#chmod 755 debian/DEBIAN/prerm

# finally build the package debian in our dist directory
dpkg-deb --root-owner-group --build debian dist 
