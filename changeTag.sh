#!/bin/bash
sed "s/tagVersion/$1/g" conf.yml > elastic-app-pod.yml
