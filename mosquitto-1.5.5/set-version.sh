#!/bin/sh

MAJOR=1
MINOR=5
REVISION=5

sed -i "s/^VERSION=.*/VERSION=${MAJOR}.${MINOR}.${REVISION}/" config.mk

sed -i "s/^#define LIBMOSQUITTO_MAJOR .*/#define LIBMOSQUITTO_MAJOR ${MAJOR}/" lib/mosquitto.h
sed -i "s/^#define LIBMOSQUITTO_MINOR .*/#define LIBMOSQUITTO_MINOR ${MINOR}/" lib/mosquitto.h
sed -i "s/^#define LIBMOSQUITTO_REVISION .*/#define LIBMOSQUITTO_REVISION ${REVISION}/" lib/mosquitto.h

sed -i "s/^set (VERSION .*)/set (VERSION ${MAJOR}.${MINOR}.${REVISION})/" CMakeLists.txt

sed -i "s/^!define VERSION .*/!define VERSION ${MAJOR}.${MINOR}.${REVISION}/" installer/*.nsi

sed -i "s/^version: .*/version: ${MAJOR}.${MINOR}.${REVISION}/" snap/snapcraft.yaml
