#!/usr/bin/env bash

pluginName=${PWD##*/}

commit=$1
if [ -z ${commit} ]; then
    commit=$(git tag --sort=-creatordate | head -1)
    if [ -z ${commit} ]; then
        commit="master";
    fi
fi

# Remove old release
rm -rf ${pluginName}-*.zip

# Build new release
npm install --prefix src/Resources/app/storefront
cd ../../../
./psh.phar administration:build
./psh.phar storefront:build
cd custom/plugins/${pluginName}
git archive --prefix ${pluginName}/ ${commit} --format=zip > ${pluginName}-${commit}.zip
