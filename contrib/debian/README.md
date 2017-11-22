
Debian
====================
This directory contains files used to package monoecid/monoeci-qt
for Debian-based Linux systems. If you compile monoecid/monoeci-qt yourself, there are some useful files here.

## monoeci: URI support ##


monoeci-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install monoeci-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your monoeci-qt binary to `/usr/bin`
and the `../../share/pixmaps/dash128.png` to `/usr/share/pixmaps`

monoeci-qt.protocol (KDE)

