
### Building a DPKG for orb-slam2

Clone and build it:
```bash

git clone https://github.com/mfassler/ORB_SLAM2.git

cd ORB_SLAM2

make -j
```

Now, install it into a "buildroot":
```bash

make install PREFIX=/usr DESTDIR=~/buildroot_orbSlam2

```


Copy the "DEBIAN" dir from this repo into your buildroot:

```
cp -a $THISREPO/DEBIAN ~/buildroot_orbSlam2/

# Set the architecture to what you just build:
vim ~/buildroot_orbSlam2/DEBIAN/control
# ... edit the "Architecture:" line...


# sometimes there's wrong umask (default chmod settings) for directories:
cd ~/buildroot_orbSlam2/usr
find . -type d | xargs chmod 755
```

(some notes on building .dpkg files:  http://tldp.org/HOWTO/html_single/Debian-Binary-Package-Building-HOWTO/ )

```
cd ~
fakeroot dpkg-deb --build buildroot_orbSlam2 orb-slam2-0.0.1-1_amd64.deb
```

