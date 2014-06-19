#!/bin/sh

# This must be run as root
# provide full path to the directory for setting up flask
# Once successfully run, activate virtualenv:
# > source $1/venv/bin/activate
# Now you can run flask powered python scripts
# to deactivate, just run:
# > deactivate

# Localbox Mac OS X:

if [ -z "$1" ]
then
	echo "Usage: $0 /fullpath/to/dir/to/install/flask"
	exit -1
fi

# Is pip installed?
command -v pip || { echo "\nInstalling pip ...\n"; easy_install pip; }

# virtualenv ?
command -v virtualenv || { echo "\nInstalling virtualenv ...\n"; pip install virtualenv; }

# install flask
mkdir -p "$1"
cd "$1"
virtualenv venv
source venv/bin/activate
pip install Flask

echo "\nSuccess! You now have a flask installed in a virtualenv under $1/venv"
