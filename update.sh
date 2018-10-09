#!/bin/bash
# A script for building a new JDT LS with the type hierarchy capabilities. After running this script, stage your changes, commit and push.

rm -rf ./eclipse.jdt.ls/ \
&& git clone --single-branch -b GH-28 https://github.com/kittaakos/eclipse.jdt.ls.git \
&& cd ./eclipse.jdt.ls/ \
&& git rev-parse --short HEAD \
&& ./mvnw -X clean verify \
&& cd ./org.eclipse.jdt.ls.product/target/repository/ \
&& tar -czf ../../../../jdt-language-server-latest.tar.gz ./config_linux/ ./config_mac/ ./config_win/ ./plugins/ ./features/ \
&& cd ../../../..