#!/bin/sh
nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits | awk -F'[,]' '{ print "GPU",""$1"","%","|",""$2"","C"}'

