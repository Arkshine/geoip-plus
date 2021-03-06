#!/usr/bin/env bash
trap "exit" INT

if [ ! -d "amxmodx" ]; then
  git clone --recursive https://github.com/Arkshine/geoip-plus.git
fi

checkout ()
{
  if [ ! -d "$name" ]; then
    git clone $repo -b $branch $name
    if [ -n "$origin" ]; then
      cd $name
      git remote rm origin
      git remote add origin $origin
      cd ..
    fi
  else
    cd $name
    git checkout $branch
    git pull origin $branch
    cd ..
  fi
}

name=metamod-am
branch=master
repo="https://github.com/alliedmodders/metamod-hl1"
origin=
checkout

name=hlsdk
branch=master
repo="https://github.com/alliedmodders/hlsdk"
origin=
checkout

`python -c "import ambuild2"`
if [ $? -eq 1 ]; then
  repo="https://github.com/alliedmodders/ambuild"
  origin=
  branch=master
  name=ambuild
  checkout

  cd ambuild
  if [ $iswin -eq 1 ]; then
    python setup.py install
  else
    python setup.py build
    echo "Installing AMBuild at the user level. Location can be: ~/.local/bin"
    python setup.py install --user
  fi
fi
