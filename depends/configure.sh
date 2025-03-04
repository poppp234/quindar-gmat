#!/bin/bash
# Author:  Jfisher
# Project: Gmat
# Title:   configure.sh
# Purpose: This script allows developers to quickly and easily 
#	   configure the GMAT dependencies on Mac/Linux.
# Usage:   configure.sh [-w wx_version] [-help]
#          Default behavior detects GMAT path and builds wxWidgets 3.0.2
#           -w: (optional) wxWidgets dotted version, e.g. 3.0.2
#           -help: Print usage
# Updates: Feb-Apr 2015: Ravi Mathur: Heavy updates for new CMake

# Set defaults
wx_build=true 
wx_version=3.0.2

# Get path to gmat (one folder above this script)
BASEDIR=$( dirname "${BASH_SOURCE[0]}" ) # Path to this script
BASEDIRFULL=$( cd "${BASEDIR}" && pwd ) # Go to script folder
gmat_path="$(dirname "${BASEDIRFULL}")" # Path to gmat folder

# ***********************************
# Input System
# ***********************************
while getopts w:h opt; do
  case $opt in
    w) wx_version="$OPTARG";;
    h) echo Usage: configure.sh [-w wx_dotted_version] [-help]
      exit;;
  esac
done

# Make sure curl exists
if ! type curl > /dev/null
then
  echo "This script requires curl to download dependencies. Please install curl first."
  exit
fi

clear
echo Launching from $gmat_path
  
# Detect Mac/Linux
if [ "$(uname)" = "Darwin" ]
then
  mac=true
else
  mac=false
fi

# Detect architecture
if [[ "$(uname -m)" = *"64" ]]
then
  arch="x64"
else
  arch="x86"
fi

# ***********************************
# Download Library Dependencies
# ***********************************
function download_depends() {

	# Set Variables
	bin_path=$gmat_path/depends/bin
	f2c_path=$gmat_path/depends/f2c
	cspice_path=$gmat_path/depends/cspice
	wxWidgets_path=$gmat_path/depends/wxWidgets
	sofa_path=$gmat_path/depends/sofa
	tsplot_path=$gmat_path/depends/tsPlot
	pcre_path=$gmat_path/depends/pcre

	if [ $mac == true ]
	then
	  cspice_path=$cspice_path/macosx
	else
	  cspice_path=$cspice_path/linux
	fi

	# Create directories and download f2c if it does not already exist.
	# Disabled for now
	if [ ! -d "$f2c_path" ] && [ false == true ]
	then
		# Create Directories
		mkdir "$f2c_path"
	
		# Change to f2c directory
		cd "$f2c_path"
	
		# Download F2C
		wget -nH --cut-dirs=1 -r http://netlib.org/f2c/
	fi

	# Create directories and download cspice if it does not already exist.
	if [ -d "$cspice_path" ]
	then
	  echo "CSPICE already configured"
	else
		# Create Directories
		mkdir -p "$cspice_path"
	
		# Change to cspice directory
		cd "$cspice_path"

		# Determine download folder based on OS
        	if [ $mac == true ]
        	then
		  cspice_type=MacIntel_OSX_AppleC
        	else 
		  cspice_type=PC_Linux_GCC
        	fi
	
		# Download and extract Spice (32/64-bit)
		if [ "$arch" = "x86" ]
		then
		  echo "Downloading 32-bit CSPICE..."
		  curl http://naif.jpl.nasa.gov/pub/naif/toolkit/C/"$cspice_type"_32bit/packages/cspice.tar.Z > cspice.tar.Z
		  echo "Extracting 32-bit CSPICE..."
		  gzip -d cspice.tar.Z
		  tar xf cspice.tar
		  mv cspice cspice32
		  rm cspice.tar
		  cd cspice32/src/cspice
		  export TKCOMPILEARCH="-m32"
		else
		  echo "Downloading 64-bit CSPICE..."
		  curl http://naif.jpl.nasa.gov/pub/naif/toolkit/C/"$cspice_type"_64bit/packages/cspice.tar.Z > cspice.tar.Z
		  echo "Extracting 64-bit CSPICE..."
		  gzip -d cspice.tar.Z
		  tar xf cspice.tar
		  mv cspice cspice64
		  rm cspice.tar
		  cd cspice64/src/cspice
		  export TKCOMPILEARCH="-m64"
		fi

		# Compile debug CSPICE with integer uiolen [GMT-5044]
		export TKCOMPILEOPTIONS="$TKCOMPILEARCH -c -ansi -g -fPIC -DNON_UNIX_STDIO -DUIOLEN_int"
		./mkprodct.csh
		mv ../../lib/cspice.a ../../lib/cspiced.a

		# Compile release CSPICE with integer uiolen [GMT-5044]
		export TKCOMPILEOPTIONS="$TKCOMPILEARCH -c -ansi -O2 -fPIC -DNON_UNIX_STDIO -DUIOLEN_int"
		./mkprodct.csh
	fi	

	# Create directories and download wxWidgets if needed
	if [ ! -d "$wxWidgets_path/wxWidgets-$wx_version" ] && [ $wx_build == true ]
	then
		# Create Directories
		mkdir -p "$wxWidgets_path"
	
		# Change to wxWidgets directory
		cd "$wxWidgets_path"
	
		# Checkout wxWidgets source
		wx_version_download=`echo $wx_version | sed 's/\./_/g'`
		echo "Downloading wxWidgets $wx_version..."
		curl -Lk https://github.com/wxWidgets/wxWidgets/archive/v$wx_version.tar.gz > wxWidgets.tar.gz
		echo "Extracting wxWidgets $wx_version..."
		gzip -d wxWidgets.tar.gz
		mkdir -p wxWidgets-$wx_version
		tar xf wxWidgets.tar -C wxWidgets-$wx_version --strip-components 1
		rm wxWidgets.tar

		# Make sure wxWidgets was downloaded
		if [ ! -d "wxWidgets-$wx_version" ]
		then
		  echo Error in wxWidgets-$wx_version download
		  wx_build=false
		fi
	fi

	# Create directories and download sofa if it does not already exist.
	# Disabled for now
	if [ ! -d "$sofa_path" ] && [ false == true ]
	then
		# Change to depends directory
		cd "$gmat_path/depends/"

		# Download and extract Sofa Source, finally remove archive
		wget http://www.iausofa.org/2012_0301_C/sofa_c_a.zip
		unzip sofa_c_a.zip
		rm sofa_c_a.zip	
	fi

	# Create directories and download tsplot if it does not already exist.
	# Disabled for now
	if [ ! -d "$tsplot_path" ] && [ false == true ]
	then
		# Create Directories
		mkdir "$tsplot_path"
	
		# Change to tsplot directory
		cd "$tsplot_path"
	
		# Checkout tsplot source.
		svn co svn://svn.code.sf.net/p/tsplot/code/trunk tsplot-latest
	fi

	# Create directories and download pcre if it does not already exist.
	# Disabled for now
	if [ ! -d "$pcre_path" ] && [ false == true ]
	then
		# Create Directories
		mkdir "$pcre_path"
	
		# Change to pcre directory
		cd "$pcre_path"
	
		# Checkout release pcre source.
		svn co svn://vcs.exim.org/pcre/code/tags/pcre-8.31 pcre-8.31
	fi
}

function build_wxWidgets() {
	# Set build path based on version
	wx_path=$wxWidgets_path/wxWidgets-$wx_version

	# OS-specific vars
	if [ $mac == true ]
    	then
	  # Out-of-source wx build/install locations
	  wx_build_path=$wx_path/cocoa-build
	  wx_install_path=$wx_path/cocoa-install
    	else
	  # Out-of-source wx build/install locations
	  wx_build_path=$wx_path/gtk-build
	  wx_install_path=$wx_path/gtk-install
    	fi

	# Find a test file to see if wxWidgets has already been configured
	wx_test_file=`ls $wx_install_path/lib/libwx_baseu-* 2> /dev/null | head -n 1`

	# Build wxWidgets if the test file doesn't already exist
	# Note that according to 
	#   http://docs.wxwidgets.org/3.0/overview_debugging.html
	# debugging features "are always available by default", so
	# we don't build a separate debug version here.
	# IF a debug version is required in the future, then this
	# if/else block should be repeated with the --enable-debug flag
	# added to mac & linux versions of the wx ./configure command
	if [ -f "$wx_test_file" ]
	then
	  echo "wxWidgets $wx_version already configured"
	else
	  echo "Building wxWidgets..."
	  mkdir -p "$wx_build_path"
	  cd "$wx_build_path"

	  if [ $mac == true ]
	  then
	    ../configure --enable-unicode --with-opengl --prefix="$wx_install_path" --with-osx_cocoa --with-macosx-version-min=10.8
	    ncores=$(sysctl hw.ncpu | awk '{print $2}')
	  else
	    # Configure wxWidgets build
	    ../configure --enable-unicode --with-opengl --prefix="$wx_install_path"
	    ncores=$(nproc)
	  fi

	  # Compile, install, and clean wxWidgets
	  make -j$ncores
	  if [ $? -eq 0 ]
	  then
	    make install
	    cd ..; rm -Rf "$wx_build_path"
	  else
	    echo "wxWidgets build failed. Fix errors and try again."
	    return
	  fi
	fi
}

# Run Script Functions
download_depends
if [ $wx_build == true ]
then
  build_wxWidgets
fi

# ***********************************
# End of script
# ***********************************
echo Dependency Configuration Complete!
exit 1
