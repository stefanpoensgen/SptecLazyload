#!/usr/bin/env bash

npm install --prefix src/Resources/app/storefront
cd ../../../
./psh.phar administration:build
./psh.phar storefront:build
