#!/bin/bash
clear
make clean
make
$spike ./obj/riscv-pke ./obj/app_two_long_loops
