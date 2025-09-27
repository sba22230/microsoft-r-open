pushd L:/Source/Repos/
cd microsoft-r-open/



pacman -Syuu
pacman -Sy base-devel gcc wget subversion tar unzip make texinfo patch
pacman -Sy wget subversion

TCLBUNDLE=tcltk-5550-5412.zip
##wget https://cran.r-project.org/bin/windows/Rtools/rtools43/files/$TCLBUNDLE

##svn checkout https://svn.r-project.org/R/branches/R-4-3-branch

# changed the directory name to source 
##mv R-4-3-branch source

## THis is for R-open

patch -p0 < patch/relocatable-r.patch
cd source

unzip ../$TCLBUNDLE

cd src/gnuwin32


export PATH=/x86_64-w64-mingw32.static.posix/bin:$PATH
#export PATH=/c/Program\ Files/MiKTeX/miktex/bin/x64:$PATH
export PATH="/c/Program Files/MiKTeX/miktex/bin/x64:$PATH"

export TAR="/usr/bin/tar"
export TAR_OPTIONS="--force-local"

pacman -Sy mingw-w64-x86_64-gcc mingw-w64-x86_64-make mingw-w64-x86_64-texinfo
pacman -Sy mingw-w64-i686-gcc mingw-w64-x86_64-gcc

export PATH="/mingw64/bin:$PATH"

which make gcc pdflatex tar

## before building 

make rsync-recommended
make all recommended

make distribution