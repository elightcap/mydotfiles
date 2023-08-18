#!/bin/sh

sensors | grep CPU: | awk '{print $2}' | grep + | tr '+' ' | '
