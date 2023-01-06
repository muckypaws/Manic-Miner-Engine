#!/bin/bash

# Script to start correct version of ManicMiner 

# Determine which Binary to Use 32 or 64Bit
bits=`getconf LONG_BIT`

mmexec="ManicMinerLinux"$bits
./$mmexec
